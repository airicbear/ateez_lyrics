import 'package:dart_pre_commit/dart_pre_commit.dart';
import 'package:git_hooks/git_hooks.dart';

void main(List<String> arguments) {
  final params = {
    Git.commitMsg: _conventionalCommitMsg,
    Git.preCommit: _preCommit,
  };
  GitHooks.call(arguments, params);
}

Future<bool> _preCommit() async {
  // Run dart_pre_commit package function to auto run various flutter commands
  final result = await DartPreCommit.run();
  return result.isSuccess;
}

Future<bool> _conventionalCommitMsg() async {
  final commitMsg = Utils.getCommitEditMsg();
  final conventionCommitPattern = RegExp(
      r'''^(feat|fix|refactor|build|chore|perf|ci|docs|revert|style|test|merge){1}(\\([\\w\\-\\.]+\\))?(!)?:( )?([\\w ])+([\\s\\S]*)''');
  // Check if it matches conventional commit format
  return conventionCommitPattern.hasMatch(commitMsg);
}
