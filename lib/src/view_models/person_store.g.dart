// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PersonStore on _PersonStore, Store {
  late final _$_pageAtom = Atom(name: '_PersonStore._page', context: context);

  @override
  int get _page {
    _$_pageAtom.reportRead();
    return super._page;
  }

  @override
  set _page(int value) {
    _$_pageAtom.reportWrite(value, super._page, () {
      super._page = value;
    });
  }

  late final _$personsAtom =
      Atom(name: '_PersonStore.persons', context: context);

  @override
  List<Results> get persons {
    _$personsAtom.reportRead();
    return super.persons;
  }

  @override
  set persons(List<Results> value) {
    _$personsAtom.reportWrite(value, super.persons, () {
      super.persons = value;
    });
  }

  late final _$stateAtom = Atom(name: '_PersonStore.state', context: context);

  @override
  StoreState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StoreState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$doGetAllUsersAsyncAction =
      AsyncAction('_PersonStore.doGetAllUsers', context: context);

  @override
  Future<void> doGetAllUsers() {
    return _$doGetAllUsersAsyncAction.run(() => super.doGetAllUsers());
  }

  late final _$doNextPageAsyncAction =
      AsyncAction('_PersonStore.doNextPage', context: context);

  @override
  Future<void> doNextPage() {
    return _$doNextPageAsyncAction.run(() => super.doNextPage());
  }

  @override
  String toString() {
    return '''
persons: ${persons},
state: ${state}
    ''';
  }
}
