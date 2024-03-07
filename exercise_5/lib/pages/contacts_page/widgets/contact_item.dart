import 'package:exercise_5/common/widgets/contact_image.dart';
import 'package:exercise_5/pages/contacts_page/contacts_cubit/contacts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:exercise_5/model/contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      onTap: () => context.go('/details/${contact.id}'),
      trailing: IconButton(
        onPressed: () => context.read<ContactsCubit>().removeContact(contact),
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
