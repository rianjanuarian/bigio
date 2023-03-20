import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:starwars/model/model.dart';

import 'package:starwars/model/repository.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

class FetchBloc extends Bloc<FetchEvent, FetchState> {
  final PersonRepo _personRepo;
  final int number;

  FetchBloc(this._personRepo, this.number) : super(FetchInitial()) {
    on<LoadPerson>((event, emit) async {
      emit(FetchInitial());
      try {
        final person = await _personRepo.getPersonPage(number);

        emit(PersonLoaded(person: person));
      } catch (e) {
        emit(PersonError(e.toString()));
      }
    });
  }
}
