import 'package:exercise_5/pages/contacts_page/contacts_cubit/contacts_cubit.dart';
import 'package:exercise_5/pages/contacts_page/widgets/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const ContactsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ContactsCubit>().getContacts(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
