import 'package:exercise_4/cubits/contacts_cubit/contacts_state.dart';
import 'package:exercise_4/model/contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit()
      : super(ContactsState(
          contacts: List.generate(
            100,
            (index) => Contact(
              id: index,
              name: 'Mario Rossi $index',
              imageUrl: 'https://picsum.photos/seed/${index + 1}/600',
              number: 3455120493 + index,
              address: 'via Flutter, $index',
              birthday: DateTime(2000, 01, 01).add(Duration(days: index)),
            ),
          ),
        ));

  void removeContact(Contact contact) {
    emit(state.copyWith(
      contacts: List<Contact>.from(state.contacts)..remove(contact),
    ));
  }

  void toggleOrder() {
    emit(state.copyWith(isAscending: !state.isAscending));
  }
}
