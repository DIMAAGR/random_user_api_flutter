// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PersonStore on _PersonStore, Store {
  late final _$genderAtom = Atom(name: '_PersonStore.gender', context: context);

  @override
  Gender? get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(Gender? value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

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

  late final _$_personsAtom =
      Atom(name: '_PersonStore._persons', context: context);

  @override
  List<Results> get _persons {
    _$_personsAtom.reportRead();
    return super._persons;
  }

  @override
  set _persons(List<Results> value) {
    _$_personsAtom.reportWrite(value, super._persons, () {
      super._persons = value;
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

  late final _$getPersonsListFromCacheAsyncAction =
      AsyncAction('_PersonStore.getPersonsListFromCache', context: context);

  @override
  Future<void> getPersonsListFromCache() {
    return _$getPersonsListFromCacheAsyncAction
        .run(() => super.getPersonsListFromCache());
  }

  late final _$_PersonStoreActionController =
      ActionController(name: '_PersonStore', context: context);

  @override
  void changeGender(Gender gender) {
    final _$actionInfo = _$_PersonStoreActionController.startAction(
        name: '_PersonStore.changeGender');
    try {
      return super.changeGender(gender);
    } finally {
      _$_PersonStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gender: ${gender},
state: ${state}
    ''';
  }
}
