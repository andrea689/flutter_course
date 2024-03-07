import 'dart:convert';

import 'package:exercise_5/model/contact.dart';
import 'package:exercise_5/pages/contact_detail_page/contact_cubit/contact_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(const ContactState());

  void getContact(int contactId) async {
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
    ));
    try {
      final response = await http.get(Uri.parse(
        'https://my-json-server.typicode.com/andrea689/flutter_course/contacts/$contactId',
      ));

      if (response.statusCode == 200) {
        final contact = Contact.fromJson(jsonDecode(response.body));

        emit(state.copyWith(
          isLoading: false,
          contact: contact,
        ));
      } else {
        throw Exception('Failed to load contacts');
      }
    } catch (e, s) {
      print(e);
      print(s);
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
      ));
    }
  }
}
