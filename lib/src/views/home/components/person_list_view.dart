import 'package:flutter/material.dart';
import 'package:random_user_api_flutter/src/view_models/person_store.dart';

class PersonListView extends StatelessWidget {
  const PersonListView({
    Key? key,
    required this.personStore,
  }) : super(key: key);

  final PersonStore personStore;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: personStore.persons.length,
        itemBuilder: (_, index) {
          return Column(
            children: [
              ListTile(
                leading: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: NetworkImage(personStore.persons[index].picture!.thumbnail!), fit: BoxFit.cover),
                  ),
                ),
                title: Text('${personStore.persons[index].name!.first!} ${personStore.persons[index].name!.last!}'),
                subtitle: Text(personStore.persons[index].email!),
              ),
              const Divider(indent: 96),
            ],
          );
        });
  }
}
