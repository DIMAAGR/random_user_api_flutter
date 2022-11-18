import 'package:flutter/material.dart';
import 'package:random_user_api_flutter/src/core/main/get_it.dart';
import 'package:random_user_api_flutter/src/view_models/person_store.dart';

class PersonDetailView extends StatelessWidget {
  const PersonDetailView({super.key});

  Widget _personImageAndNameWidget(PersonStore personStore, int personIndex) {
    return Column(children: [
      Center(
        child: Container(
          height: 128,
          width: 128,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 4),
            image: DecorationImage(image: NetworkImage(personStore.persons[personIndex].picture!.large!)),
          ),
        ),
      ),
      const SizedBox(height: 16),
      Text(
        '${personStore.persons[personIndex].name!.first!} ${personStore.persons[personIndex].name!.last!}',
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
    ]);
  }

  Widget _titleAndSubtitleRowListWidget({required String title, required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
          Text(subtitle, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final personIndex = ModalRoute.of(context)!.settings.arguments as int;
    PersonStore personStore = getIt<PersonStore>();

    print(personStore.persons[personIndex].toJson());

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            _personImageAndNameWidget(personStore, personIndex),
            const SizedBox(height: 72),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text('Dados Pessoais:', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                  ),
                  const SizedBox(height: 16),
                  _titleAndSubtitleRowListWidget(title: 'Email:', subtitle: personStore.persons[personIndex].email!),
                  // _titleAndSubtitleRowListWidget(title: 'Celular:', subtitle: personStore.persons[personIndex].cell!),
                  // _titleAndSubtitleRowListWidget(title: 'Telefone:', subtitle: personStore.persons[personIndex].phone!),
                  _titleAndSubtitleRowListWidget(title: 'Gênero:', subtitle: personStore.persons[personIndex].gender!),
                  _titleAndSubtitleRowListWidget(title: 'Naturalidade:', subtitle: personStore.persons[personIndex].nat!),
                  //_titleAndSubtitleRowListWidget(title: 'País:', subtitle: personStore.persons[personIndex].location!.country!),
                  // _titleAndSubtitleRowListWidget(title: 'Estado:', subtitle: personStore.persons[personIndex].location!.state!),
                  // _titleAndSubtitleRowListWidget(title: 'Cidade:', subtitle: personStore.persons[personIndex].location!.city!),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
