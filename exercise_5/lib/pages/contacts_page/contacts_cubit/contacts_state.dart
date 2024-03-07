import 'package:collection/collection.dart';
import 'package:exercise_5/model/contact.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contacts_state.freezed.dart';

@freezed
class ContactsState with _$ContactsState {
  const ContactsState._();

  const factory ContactsState({
    @Default([]) List<Contact> contacts,
    @Default(false) bool isAscending,
    @Default(false) bool isLoading,
    @Default(false) hasError,
  }) = _ContactsState;

  List<Contact> get sortedContacts {
    final sortContacts = List<Contact>.from(contacts);
    sortContacts.sort((a, b) =>
        isAscending ? b.name.compareTo(a.name) : a.name.compareTo(b.name));
    return sortContacts;
  }
}
