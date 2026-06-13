#!/usr/bin/env python3
"""
Fetch synced or unsynced lyrics from LRCLIB and write a lyrics JSON file.

Usage:
    python scripts/fetch_lyrics.py --artist "ATEEZ" --title "Fireworks" \
        --out assets/lyrics/fever_pt_2/fireworks_im_the_one.json

    # Preview without writing:
    python scripts/fetch_lyrics.py --artist "ATEEZ" --title "Fireworks" --dry-run

The script writes the app's JSON schema:
    { "title": "...", "lyrics": { "eng": [...] } }

If LRCLIB returns synced (LRC) lyrics the timestamps are stripped; only
the text lines are kept. Blank lines in the LRC become empty strings "".

LRCLIB is an open, no-auth API: https://lrclib.net
"""

import argparse
import io
import json
import re
import sys
import urllib.parse
import urllib.request

# Ensure stdout handles Unicode on Windows (cp1252 terminal).
if sys.stdout.encoding and sys.stdout.encoding.lower() != "utf-8":
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")


API_BASE = "https://lrclib.net/api"
LRC_LINE = re.compile(r"^\[[\d:.]+\]\s*(.*)$")


def fetch_json(url: str) -> dict | list | None:
    req = urllib.request.Request(url, headers={"User-Agent": "ateez-lyrics-app/1.0"})
    try:
        with urllib.request.urlopen(req, timeout=10) as resp:
            return json.loads(resp.read().decode())
    except urllib.error.HTTPError as exc:
        if exc.code == 404:
            return None
        raise


def search_lrclib(artist: str, title: str) -> dict | None:
    """Return the best LRCLIB track match, or None."""
    params = urllib.parse.urlencode({"artist_name": artist, "track_name": title})
    results = fetch_json(f"{API_BASE}/search?{params}")
    if not results:
        return None
    # Prefer exact title match (case-insensitive), otherwise take first result.
    title_lower = title.lower()
    for r in results:
        if r.get("trackName", "").lower() == title_lower:
            return r
    return results[0]


def parse_lrc(lrc_text: str) -> list[str]:
    """Strip LRC timestamps and return plain lyric lines."""
    lines = []
    for raw in lrc_text.splitlines():
        m = LRC_LINE.match(raw)
        if m:
            lines.append(m.group(1))
        # skip metadata tags like [ar:], [ti:], etc.
    return lines


def plain_lines(text: str) -> list[str]:
    """Split plain (unsynced) lyrics into lines, preserving blank lines."""
    return text.splitlines()


def build_lyrics_json(title: str, lines: list[str]) -> dict:
    return {"title": title, "lyrics": {"eng": lines}}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--artist", required=True, help="Artist name")
    parser.add_argument("--title", required=True, help="Track title")
    parser.add_argument("--album", default="", help="Album name (improves search accuracy)")
    parser.add_argument("--out", help="Output JSON file path (omit to print to stdout)")
    parser.add_argument("--dry-run", action="store_true",
                        help="Print result without writing the file")
    parser.add_argument("--lang-key", default="eng",
                        help="Language key to use in the JSON (default: eng)")
    args = parser.parse_args()

    print(f"Searching LRCLIB for '{args.title}' by {args.artist}…", file=sys.stderr)
    track = search_lrclib(args.artist, args.title)

    if not track:
        print("No results found.", file=sys.stderr)
        return 1

    print(f"Found: {track.get('trackName')} — {track.get('artistName')} "
          f"(album: {track.get('albumName', 'unknown')})", file=sys.stderr)

    synced = track.get("syncedLyrics")
    plain = track.get("plainLyrics")

    if synced:
        print("Using synced (LRC) lyrics — timestamps stripped.", file=sys.stderr)
        lines = parse_lrc(synced)
    elif plain:
        print("No synced lyrics; using plain lyrics.", file=sys.stderr)
        lines = plain_lines(plain)
    else:
        print("Track found but has no lyrics.", file=sys.stderr)
        return 1

    data = {
        "title": track.get("trackName", args.title),
        "lyrics": {args.lang_key: lines},
    }
    output = json.dumps(data, indent=2, ensure_ascii=False) + "\n"

    if args.dry_run or not args.out:
        print(output)
        return 0

    with open(args.out, "w", encoding="utf-8") as f:
        f.write(output)
    print(f"Written to {args.out}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
