import 'package:mobx/mobx.dart';
import 'package:random_user_api_flutter/src/models/persons_model.dart';
import 'package:random_user_api_flutter/src/repositories/repository/persons_repository.dart';

part 'person_store.g.dart';

class PersonStore = _PersonStore with _$PersonStore;

abstract class _PersonStore with Store {
  final PersonsRepository _repository = PersonsRepository();

  @observable
  int _page = 0;

  @observable
  List<Results> persons = [];

  @action
  Future<void> doGetAllUsers() async {
    PersonsModel model = await _repository.getAllPersons();
    persons += model.results!;
  }

  @action
  Future<void> doNextPage() async {
    _page++;
    PersonsModel model = await _repository.getAllPersons(page: _page);
    persons += model.results!;
  }
}
