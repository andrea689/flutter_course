import 'package:exercise_3/common/widgets/contact_image.dart';
import 'package:flutter/material.dart';
import 'package:exercise_3/model/contact.dart';
import 'package:exercise_3/pages/contact_detail_page/widgets/info_row.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contact = GoRouterState.of(context).extra as Contact;

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
