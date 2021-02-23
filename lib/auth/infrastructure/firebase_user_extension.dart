// Package imports:
import 'package:firebase_auth/firebase_auth.dart' as firebase;

// Project imports:
import '../domain/user.dart';
import '../domain/value_objects.dart';

//Extension que transforma el usuario de firebase a un Usuario de nuestra aplicacion.

extension FirebaseUserDomainX on firebase.User {
  AUser toDomain() {
    return AUser(
        id: UniqueId.fromUniqueString(uid),
        photoUrl: photoURL,
        name: displayName,
        emailAddress: email);
  }
}
