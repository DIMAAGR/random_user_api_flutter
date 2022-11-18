import 'package:flutter/material.dart';

import 'package:random_user_api_flutter/src/view_models/person_store.dart';

class PersonListView extends StatelessWidget {
  const PersonListView({
    Key? key,
    required this.personStore,
  }) : super(key: key);

  final PersonStore personStore;

  Padding _loadingWidet() {
    return const Padding(
      padding: EdgeInsets.only(top: 16.0, bottom: 24.0),
      child: Center(
        child: SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(color: Colors.grey, strokeWidth: 2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        if (notification.metrics.atEdge && notification.metrics.pixels != 0) {
          personStore.doNextPage();
          return true;
        }
        return false;
      },
      child: ListView.builder(
          itemCount: (personStore.persons.length + 1),
          itemBuilder: (_, index) {
            //

            // ===================================================================
            // Show loading widget when the list has loading...
            // ===================================================================
            if (index >= personStore.persons.length) return _loadingWidet();

            // ===================================================================
            // Show person list
            // ===================================================================
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
          }),
    );
  }
}
