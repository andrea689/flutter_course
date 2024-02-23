import 'package:exercise_3/common/widgets/contact_image.dart';
import 'package:flutter/material.dart';
import 'package:exercise_3/model/contact.dart';
import 'package:go_router/go_router.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;

  const ContactItem({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ContactImage(
        imageUrl: contact.imageUrl,
        size: 50,
      ),
      title: Text(contact.name),
      onTap: () => context.go('/details', extra: contact),
    );
  }
}
