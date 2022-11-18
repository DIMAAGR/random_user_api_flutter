import 'package:mobx/mobx.dart';
import 'package:random_user_api_flutter/src/core/services/shared_preferencies_service.dart';
import 'package:random_user_api_flutter/src/models/persons_model.dart';
import 'package:random_user_api_flutter/src/repositories/interfaces/persons_repository_interface.dart';
import 'package:random_user_api_flutter/src/repositories/repository/persons_repository.dart';

part 'person_store.g.dart';

// ignore: library_private_types_in_public_api
class PersonStore = _PersonStore with _$PersonStore;

enum StoreState { error, isLoading, loaded, uninitialized, internetConectionError }

abstract class _PersonStore with Store {
  final PersonsRepository _repository = PersonsRepository();
  final _cacheService = SharedPreferenciesCacheService();

  @observable
  Gender? gender;

  @observable
  int _page = 0;

  @observable
  List<Results> _persons = [];

  @observable
  StoreState state = StoreState.uninitialized;

  List<Results> get persons {
    return _persons.where((person) => gender == null || gender!.name == person.gender!).toList();
  }

  @action
  void changeGender(Gender gender) {
    state = StoreState.isLoading;
    if (gender == Gender.non) {
      this.gender = null;
    } else {
      this.gender = gender;
    }
    state = StoreState.loaded;
  }

  @action
  Future<void> doGetAllUsers() async {
    state = StoreState.isLoading;
    try {
      PersonsModel model = await _repository.getAllPersons();
      _persons += model.results!;
      await _cacheService.setPersonsListOnCache(persons);
      state = StoreState.loaded;
    } catch (_) {
      state = StoreState.error;
    }
  }

  @action
  Future<void> doNextPage() async {
    state = StoreState.isLoading;
    try {
      _page++;
      PersonsModel model = await _repository.getAllPersons(page: _page);
      _persons += model.results!;
      await _cacheService.setPersonsListOnCache(persons);
      state = StoreState.loaded;
    } catch (_) {
      state = StoreState.error;
    }
  }

  @action
  Future<void> getPersonsListFromCache() async {
    state = StoreState.isLoading;
    if (_persons.isEmpty) {
      List<Results> results = await _cacheService.getPersonsListOnCache();
      _persons = results;
    }
    state = StoreState.loaded;
  }
}
