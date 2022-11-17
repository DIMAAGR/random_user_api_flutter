import 'package:mobx/mobx.dart';
import 'package:random_user_api_flutter/src/models/persons_model.dart';
import 'package:random_user_api_flutter/src/repositories/interfaces/persons_repository_interface.dart';
import 'package:random_user_api_flutter/src/repositories/repository/persons_repository.dart';

part 'person_store.g.dart';

// ignore: library_private_types_in_public_api
class PersonStore = _PersonStore with _$PersonStore;

enum StoreState { error, isLoading, loaded, uninitialized }

abstract class _PersonStore with Store {
  final PersonsRepository _repository = PersonsRepository();

  @observable
  Gender? gender;

  @observable
  int _page = 0;

  @observable
  List<Results> persons = [];

  @observable
  StoreState state = StoreState.uninitialized;

  @action
  void setGender(Gender gender) {
    if (gender == Gender.non) {
      this.gender = null;
    } else {
      this.gender = gender;
    }
  }

  @action
  Future<void> doGetAllUsers() async {
    state = StoreState.isLoading;
    PersonsModel model = await _repository.getAllPersons();
    persons += model.results!;
    state = StoreState.loaded;
  }

  @action
  Future<void> doNextPage() async {
    _page++;
    PersonsModel model = await _repository.getAllPersons(page: _page);
    persons += model.results!;
  }
}
