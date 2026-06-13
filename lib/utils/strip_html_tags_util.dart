final _htmlTagPattern = RegExp(r'<[^>]*>');

String stripHtmlTags(String input) => input.replaceAll(_htmlTagPattern, '');
