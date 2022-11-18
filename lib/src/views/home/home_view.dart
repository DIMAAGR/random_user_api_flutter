import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:random_user_api_flutter/src/core/main/get_it.dart';
import 'package:random_user_api_flutter/src/repositories/interfaces/persons_repository_interface.dart';
import 'package:random_user_api_flutter/src/view_models/person_store.dart';
import 'package:random_user_api_flutter/src/views/home/components/person_list_filter.dart';
import 'package:random_user_api_flutter/src/views/home/components/person_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PersonStore personStore = getIt<PersonStore>();

  @override
  void initState() {
    super.initState();

    personStore.getPersonsListFromCache().then((_) {
      if (personStore.persons.isEmpty) {
        personStore.doGetAllUsers();
      }
    });
  }

  Widget _showLoadingWidget() => const Center(child: CircularProgressIndicator(color: Colors.grey, strokeWidth: 5));

  Widget _showErrorMessage() {
    return const Center(
      child: Text(
        'Algum erro ocorreu\nPor favor, tente novamente mais tarde!',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lista de Usuários'), actions: [PersonListFilter(personStore: personStore)]),
        body: SafeArea(
          child: Observer(builder: (_) {
            //

            // =====================================================================
            // Show Persons List
            // =====================================================================
            if (personStore.state == StoreState.loaded || personStore.state == StoreState.isLoading && personStore.persons.isNotEmpty) {
              return PersonListView(personStore: personStore);
            }

            // =====================================================================
            // Show Loading Widget
            // =====================================================================
            if (personStore.state == StoreState.isLoading) {
              return _showLoadingWidget();
            }

            // =====================================================================
            // Show Error Widget
            // =====================================================================
            return _showErrorMessage();
          }),
        ));
  }
}
