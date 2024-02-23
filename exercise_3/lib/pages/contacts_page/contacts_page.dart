import 'package:flutter/material.dart';
import 'package:exercise_3/model/contact.dart';
import 'package:exercise_3/pages/contacts_page/widgets/contact_item.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = List.generate(
      100,
      (index) => Contact(
        id: index,
        name: 'Mario Rossi $index',
        imageUrl: 'https://picsum.photos/seed/${index + 1}/600',
        number: 3455120493 + index,
        address: 'via Flutter, $index',
        birthday: DateTime(2000, 01, 01).add(Duration(days: index)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView.separated(
        itemCount: contacts.length,
        itemBuilder: (context, index) => ContactItem(
          contact: contacts[index],
        ),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
