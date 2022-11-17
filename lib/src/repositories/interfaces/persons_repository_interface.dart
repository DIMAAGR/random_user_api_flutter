import 'package:random_user_api_flutter/src/core/services/networking_service.dart';
import 'package:random_user_api_flutter/src/models/persons_model.dart';

enum Gender { male, female }

abstract class IPersonsRepository {
  Networking networking;

  IPersonsRepository({required this.networking});

  Future<PersonsModel> getAllPersons();
  Future<PersonsModel> getPersonsByGender(Gender gender);
}
