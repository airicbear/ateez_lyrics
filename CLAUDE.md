# ATEEZ Lyrics

Flutter app for browsing ATEEZ lyrics with multi-language support.

## Architecture

The `lib/` directory is divided into seven layers, each with a strict responsibility:

| Layer | Folder | Responsibility |
|---|---|---|
| Data | `lib/data/` | Static definitions (album list, song lists) |
| Model | `lib/model/` | Plain data classes; `SongModel` validates equal line counts across languages |
| Singleton | `lib/singletons/` | Long-lived shared instances (e.g. `SongManager` song cache) |
| Notifier | `lib/notifiers/` | `ChangeNotifier` subclasses consumed via Provider |
| State | `lib/states/` | `State<T>` subclasses extracted from their widget when the logic gets complex |
| Utils | `lib/utils/` | Pure functions; one function per file |
| Widget | `lib/widgets/` | `StatelessWidget` / `StatefulWidget` UI components |

## Naming conventions

Every file ends with the suffix that matches its layer:

- `*_widget.dart` — widget
- `*_widget_state.dart` — state class for a widget
- `*_notifier.dart` — ChangeNotifier
- `*_singleton.dart` — singleton
- `*_model.dart` — data model
- `*_util.dart` — utility function
- `*_data.dart` — static data

Class names mirror the file name in PascalCase. No abbreviations.

## Lyrics JSON format

Every song file lives under `assets/lyrics/<album>/` and follows this structure:

```json
{
    "title": "Song Title",
    "lyrics": {
        "han": ["[Verse 1: Hongjoong]", "Korean line", "<i>Another line</i>", ""],
        "rom": ["[Verse 1: Hongjoong]", "Romanized line", "<i>Another line</i>", ""],
        "eng": ["[Verse 1: Hongjoong]", "English line", "<i>Another line</i>", ""]
    }
}
```

**Language keys** (only include what applies to the song):
- `han` — Korean Hangul
- `kan` — Japanese Kanji
- `rom` — Romanized
- `eng` — English translation

**Rules:**
- All present language arrays must have identical line counts (enforced by `SongModel` assert).
- Empty string `""` represents a blank line / section break.
- Section headers use the format `[Section: Artist, <i>Artist</i>, <b>Artist</b>]`.
- Supported inline tags: `<i>`, `<b>`, `<b><i>`, `*text*` (special vocal styling).
- **`<i>` tags must wrap individual lines only — never span across multiple array entries.** `flutter_widget_from_html_core` renders each entry as its own widget, so an unclosed tag on one line does not carry over to the next.

## Dependencies

| Package | Version | Purpose |
|---|---|---|
| `provider` | ^6.1.2 | State management via `ChangeNotifier` |
| `dynamic_color` | ^1.7.0 | Material 3 dynamic color theming |
| `flutter_widget_from_html_core` | ^0.15.2 | Renders HTML tags (`<i>`, `<b>`) inside lyrics lines |
| `html` | ^0.15.5 | HTML parsing utilities |
| `clipboard` | ^2.0.0 | Copy lyrics to clipboard |
| `http` | ^1.2.2 | HTTP client |
| `cupertino_icons` | ^1.0.8 | iOS icons |

Dev dependencies of note: `flutter_lints`, `dart_pre_commit`, `git_hooks` (pre-commit hooks run automatically).

## Open issues

| Issue | Title | Notes |
|---|---|---|
| #117 | Multi-language UI | In-app language switching beyond lyrics keys |
| #111 | Testing | Expand test coverage beyond the existing JSON validation test |
| #53 | Grid layout | Album/song grid view as an alternative to the current list |
| — | Clipboard | **In progress** — `clipboard` dependency added; feature not yet wired up |

## Commands

```bash
flutter pub get               # install dependencies
flutter run                   # run on connected device / emulator
flutter test                  # run all tests
flutter analyze --fatal-infos # static analysis (matches CI)
flutter build ios --release --no-codesign
flutter build apk --split-per-abi
flutter build appbundle
```
