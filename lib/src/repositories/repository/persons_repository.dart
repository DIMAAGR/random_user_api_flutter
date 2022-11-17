import 'package:random_user_api_flutter/src/core/constants.dart';
import 'package:random_user_api_flutter/src/core/services/networking_service.dart';
import 'package:random_user_api_flutter/src/models/persons_model.dart';
import 'package:random_user_api_flutter/src/repositories/interfaces/persons_repository_interface.dart';

class PersonsRepository extends IPersonsRepository {
  PersonsRepository() : super(networking: Networking(url: Const.apiURL));

  @override
  Future<PersonsModel> getAllPersons() {
    throw UnimplementedError();
  }

  @override
  Future<PersonsModel> getPersonsByGender(Gender gender) {
    throw UnimplementedError();
  }
}
