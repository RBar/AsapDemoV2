// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:asapdemo/auth/core/errors/failures.dart';
import 'user.dart';
import 'value_objects.dart';

abstract class IAuthFacade {
  Future<Option<AUser>> getSignedUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {@required EmailAddress emailAddress, @required Password password});
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {@required EmailAddress emailAddress, @required Password password});
  Future<Either<AuthFailure, Unit>> resetPasswordWithEmail(
      {@required EmailAddress emailAddress});
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
