import 'package:exercise_4/cubits/contacts_cubit/contacts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:exercise_4/pages/contacts_page/widgets/contact_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = context.watch<ContactsCubit>().state.sortedContacts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            onPressed: () => context.read<ContactsCubit>().toggleOrder(),
            icon: const Icon(Icons.sort_by_alpha),
          ),
        ],
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
