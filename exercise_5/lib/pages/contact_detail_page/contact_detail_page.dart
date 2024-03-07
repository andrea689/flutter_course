import 'package:exercise_5/common/widgets/contact_image.dart';
import 'package:exercise_5/pages/contact_detail_page/contact_cubit/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:exercise_5/pages/contact_detail_page/widgets/info_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ContactCubit>().state;
    final contact = state.contact;

    if (state.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state.hasError) {
      return const Scaffold(
        body: Center(
          child: Text('Errore nella richiesta'),
        ),
      );
    }

    if (contact == null) {
      return const Scaffold(
        body: Center(
          child: Text('Contatto non trovato'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          ContactImage(
            imageUrl: contact.imageUrl,
            size: 200,
          ),
          const SizedBox(height: 16),
          InfoRow(
            label: 'Telefono',
            value: contact.number.toString(),
          ),
          const Divider(),
          InfoRow(
            label: 'Indirizzo',
            value: '${contact.address.streetAddress}, ${contact.address.city}',
          ),
          const Divider(),
          InfoRow(
            label: 'Data di nascita',
            value: DateFormat('dd/MM/yyyy').format(contact.birthday),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
