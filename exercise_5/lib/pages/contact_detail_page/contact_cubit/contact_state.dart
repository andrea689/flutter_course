import 'package:exercise_5/model/contact.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_state.freezed.dart';

@freezed
class ContactState with _$ContactState {
  const factory ContactState({
    Contact? contact,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
  }) = _ContactState;
}
