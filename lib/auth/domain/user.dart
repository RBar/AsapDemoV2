// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'value_objects.dart';

part 'user.freezed.dart';

// Modelo para el usuario proveniente de firebase

@freezed
abstract class AUser with _$AUser {
  const factory AUser({
    @required UniqueId id,
    @required @nullable String photoUrl,
    @required String emailAddress,
    @required @nullable String name,
  }) = _AUser;
}
