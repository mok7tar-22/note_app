part of 'date_base_cubit.dart';

@immutable
abstract class DateBaseState {}

class DateBaseInitial extends DateBaseState {}
class AppCreateDatabaseState extends DateBaseState {}

class AppGetDatabaseLoadingState extends DateBaseState {}

class AppGetDatabaseState extends DateBaseState {}

class AppInsertDatabaseState extends DateBaseState{}

class AppUpdateDatabaseState extends DateBaseState {}

class AppDeleteDatabaseState extends DateBaseState {}
class SearchState extends DateBaseState {}