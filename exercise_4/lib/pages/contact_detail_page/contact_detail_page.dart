import 'package:exercise_4/common/widgets/contact_image.dart';
import 'package:exercise_4/cubits/contacts_cubit/contacts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:exercise_4/pages/contact_detail_page/widgets/info_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ContactDetailPage extends StatelessWidget {
  final int? contactId;

  const ContactDetailPage({
    super.key,
    required this.contactId,
  });

  @override
  Widget build(BuildContext context) {
    final contact = context.watch<ContactsCubit>().state.contactById(contactId);

    if (contact == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Contact ID: $contactId'),
        ),
        body: const Center(
          child: Text('Nessun contatto trovato'),
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
            value: contact.address,
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
