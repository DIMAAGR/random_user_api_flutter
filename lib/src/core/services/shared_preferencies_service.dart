// =============================================================================
// Cache Service
// =============================================================================

import 'dart:convert';

import 'package:random_user_api_flutter/src/models/persons_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenciesCacheService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final _personListModelCachedKey = 'PERSON_MODEL_CACHED_KEY';

  // ===========================================================================
  // Cache of PersonsModel list setter
  // ===========================================================================
  Future<void> setPersonsListOnCache(List<Results> list) async {
    final cache = await _prefs;

    // Create a cache;
    List<String> cacheList = [];

    // Set Values on Cache
    for (var person in list) {
      cacheList.add(jsonEncode(person.toJson()));
    }

    // set cache on android storage
    await cache.setStringList(_personListModelCachedKey, cacheList);
  }

  // ===========================================================================
  // Cache of PersonsModel list getter
  // ===========================================================================
  Future<List<Results>> getPersonsListOnCache() async {
    final cache = await _prefs;

    List<String>? cacheList = cache.getStringList(_personListModelCachedKey);
    List<Results> listOfPersons = [];

    if (cacheList != null) {
      for (var item in cacheList) {
        listOfPersons.add(Results.fromJson(jsonDecode(item)));
      }
    }

    return listOfPersons;
  }
}
