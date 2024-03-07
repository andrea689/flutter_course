import 'package:exercise_5/model/address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

@freezed
class Contact with _$Contact {
  const factory Contact({
    required int id,
    @JsonKey(name: 'first_name') required String name,
    @JsonKey(name: 'avatar') required String imageUrl,
    @JsonKey(name: 'phone_number') required String number,
    required Address address,
    @JsonKey(name: 'date_of_birth') required DateTime birthday,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}
