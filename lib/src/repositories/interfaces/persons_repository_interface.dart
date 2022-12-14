import 'package:random_user_api_flutter/src/core/services/networking_service.dart';
import 'package:random_user_api_flutter/src/models/persons_model.dart';

enum Gender { male, female, non }

abstract class IPersonsRepository {
  Networking networking;

  IPersonsRepository({required this.networking});

  Future<PersonsModel> getAllPersons({int page = 0});
}
