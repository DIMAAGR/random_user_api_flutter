import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:random_user_api_flutter/src/repositories/interfaces/persons_repository_interface.dart';
import 'package:random_user_api_flutter/src/view_models/person_store.dart';

class PersonListFilter extends StatelessWidget {
  const PersonListFilter({
    Key? key,
    required this.personStore,
  }) : super(key: key);

  final PersonStore personStore;

  PopupMenuItem<Gender> _menuItem({required Gender value, required IconData icon, required String title, Color? color}) {
    return PopupMenuItem(
      value: value,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: color),
        title: Text(title, style: TextStyle(color: color)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return PopupMenuButton<Gender>(
        icon: const Icon(Icons.filter_list),
        tooltip: 'Filtrar',
        initialValue: personStore.gender,
        onSelected: (gender) => personStore.changeGender(gender),
        itemBuilder: (_) => <PopupMenuEntry<Gender>>[
          //

          // ===================================================================
          // Male Gender Select Button
          // ===================================================================
          _menuItem(
            value: Gender.male,
            icon: Icons.male,
            title: 'Homem',
          ),

          // ===================================================================
          // Female Gender Select Button
          // ===================================================================
          _menuItem(
            value: Gender.female,
            icon: Icons.female,
            title: 'Mulher',
          ),

          // ===================================================================
          // Remove Gender Select Button
          // ===================================================================
          const PopupMenuDivider(),
          _menuItem(
            value: Gender.non,
            icon: Icons.delete,
            title: 'Remover',
            color: Colors.red,
          ),
        ],
      );
    });
  }
}
