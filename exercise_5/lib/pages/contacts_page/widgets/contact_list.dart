import 'package:exercise_5/pages/contacts_page/contacts_cubit/contacts_cubit.dart';
import 'package:exercise_5/pages/contacts_page/widgets/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ContactsCubit>().state;
    final contacts = state.sortedContacts;

    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state.hasError) {
      return const Center(
        child: Text('Errore nella richiesta'),
      );
    }

    if (contacts.isEmpty) {
      return const Center(
        child: Text('Nessun contatto trovato'),
      );
    }

    return ListView.separated(
      itemCount: contacts.length,
      itemBuilder: (context, index) => ContactItem(
        contact: contacts[index],
      ),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
