import 'dart:io';

List<File> findJsonFiles(Directory dir) {
  final List<File> jsonFiles = [];
  final List<FileSystemEntity> entities = dir.listSync();

  for (final entity in entities) {
    if (entity is File && entity.path.endsWith('.json')) {
      jsonFiles.add(entity);
    } else if (entity is Directory) {
      jsonFiles.addAll(findJsonFiles(entity));
    }
  }
  return jsonFiles;
}
