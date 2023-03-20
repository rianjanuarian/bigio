part of 'fetch_bloc.dart';

@immutable
abstract class FetchState {}

class FetchInitial extends FetchState {}

class PersonLoaded extends FetchState {
  final List<Person?>? person;

  PersonLoaded({
    this.person,
  });
}

class PersonError extends FetchState {
  final String error;
  PersonError(this.error);
}
