import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:metacards/data/models/work_in_progress.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  factory AppUser(
      {@Default([]) List<WorkInProgress> works,
      WorkInProgress? creativeModeWork,
      @Default(0) int currentWorkIndex}) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
