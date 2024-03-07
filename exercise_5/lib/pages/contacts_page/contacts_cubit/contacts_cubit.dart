import 'dart:convert';

import 'package:exercise_5/model/contact.dart';
import 'package:exercise_5/pages/contacts_page/contacts_cubit/contacts_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit() : super(const ContactsState());

  void getContacts() async {
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
    ));
    try {
      final response = await http.get(Uri.parse(
        'https://my-json-server.typicode.com/andrea689/flutter_course/contacts',
      ));

      if (response.statusCode == 200) {
        final contacts = (jsonDecode(response.body) as List)
            .map((e) => Contact.fromJson(e))
            .toList();

        emit(state.copyWith(
          isLoading: false,
          contacts: contacts,
        ));
      } else {
        throw Exception('Failed to load contacts');
      }
    } catch (e, s) {
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
      ));
      print(e);
      print(s);
    }
  }

  void removeContact(Contact contact) async {
    try {
      final response = await http.delete(Uri.parse(
        'https://my-json-server.typicode.com/andrea689/flutter_course/contacts/${contact.id}',
      ));

      if (response.statusCode == 200) {
        emit(state.copyWith(
          contacts: List<Contact>.from(state.contacts)..remove(contact),
        ));
      } else {
        throw Exception('Failed to delete contact');
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  void toggleOrder() {
    emit(state.copyWith(isAscending: !state.isAscending));
  }
}
