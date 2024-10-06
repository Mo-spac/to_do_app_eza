// part of 'task_cubit.dart';

// @immutable
abstract class TaskState {}

final class TaskInitial extends TaskState {}

// Date
final class TaskDateLoadingState extends TaskState {}

final class TaskDateCateSuccessState extends TaskState {}

final class TaskDateFailureState extends TaskState {}

// StartTime
final class TaskStartTimeLoadingState extends TaskState {}

final class TaskStartTimeSuccessState extends TaskState {}

final class TaskStartTimFailureState extends TaskState {}

// EndTime
final class TaskEndTimeLoadingState extends TaskState {}

final class TaskEndTimeSuccessState extends TaskState {}

final class TaskEndTimFailureState extends TaskState {}

// changeCheckMarkColor
final class ChangeCheckMarkColorState extends TaskState {}
