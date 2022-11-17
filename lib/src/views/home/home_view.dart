import 'package:flutter/material.dart';
import 'package:random_user_api_flutter/src/models/persons_model.dart';
import 'package:random_user_api_flutter/src/repositories/repository/persons_repository.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: PersonsRepository().getAllPersons(page: 1),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (context, index) => Text('${snapshot.data!.results![index].name!.first!} ${snapshot.data!.results![index].name!.last!}'),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
