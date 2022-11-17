import 'dart:convert';

import 'package:http/http.dart';
import 'package:random_user_api_flutter/src/core/constants.dart';
import 'package:random_user_api_flutter/src/core/services/networking_service.dart';
import 'package:random_user_api_flutter/src/models/persons_model.dart';
import 'package:random_user_api_flutter/src/repositories/interfaces/persons_repository_interface.dart';

import '../../exceptions/networking_exceptions.dart';

class PersonsRepository extends IPersonsRepository {
  PersonsRepository() : super(networking: Networking(url: Const.apiURL));

  @override
  Future<PersonsModel> getAllPersons(int page) async {
    Response response = await networking.get(path: '?nat=br&format=json&results=20&page=$page');

    switch (response.statusCode) {
      case 200:
        // All Right return the Persons Model
        return PersonsModel.fromJson(jsonDecode(response.body));
      case 400:
        // On Error Status Code 400
        throw BadRequestNetworkingException(message: 'Bad Request');
      case 401:
        // On Error Status Code 401
        throw UnauthorizedNetworkingException(message: 'Unauthorized');
      case 403:
        // On Error Status Code 403
        throw ForbiddenNetworkingException(message: 'Forbidden');
      case 404:
        // On Error Status Code 404
        throw NotFoundNetworkingException(message: 'Not Found');
      case 500:
        // On Error Status Code 500
        throw InternalErrorNetworkingException(message: 'Internal Server Error');
      case 502:
        // On Error Status Code 502
        throw BadGetwayNetworkingException(message: 'Bad Getway');
      case 503:
        // On Error Status Code 503
        throw ServiceUnavailableNetworkingException(message: 'Service Unavailable');
      case 504:
        // On Error Status Code 504
        throw GetwayTimeoutNetworkingException(message: 'Getway Timeout');
      default:
        // On No Internet Connection Error
        throw NotInternetConnectionNetworkingException(message: 'Not Have Internet');
    }
  }

  @override
  Future<PersonsModel> getPersonsByGender(int page, Gender gender) {
    throw UnimplementedError();
  }
}
