// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../core/errors/failures.dart';
import '../domain/i_auth_facade.dart';
import '../domain/user.dart';
import '../domain/value_objects.dart';
import '../infrastructure/firebase_user_extension.dart';

@LazySingleton(as: IAuthFacade)
class AuthFacadeImpl implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthFacadeImpl(this._firebaseAuth, this._googleSignIn);

  // metodo utilizado para registrar usuario con email and password
  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  }) async {
    // se utiliza el getOrcrash porque si en este punto tenemos un email o password incorrecto es porque algo
    // mal ha sucedido en el funcionamiento de la app y tiramos un error.
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailAddressStr, password: passwordStr);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      }
      return left(const AuthFailure.serverError());
    }
  }

  // Metodo para logearnos con email and password
  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  }) async {
    // se utiliza el getOrcrash porque si en este punto tenemos un email o password incorrecto es porque algo
    // mal ha sucedido en el funcionamiento de la app y tiramos un error.
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailAddressStr, password: passwordStr);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return left(const AuthFailure.invalidEmailandPasswordCombination());
      }
      return left(const AuthFailure.serverError());
    }
  }

  // Metodo para logearnos con google
  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.canceledByUser());
      }
      final googleAuth = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((value) => right(unit));
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.canceledByUser());
    }
  }

  // Metodo para obtener el usuario logeado
  @override
  Future<Option<AUser>> getSignedUser() async {
    return optionOf(_firebaseAuth.currentUser?.toDomain());
  }

  // Metodo para signOut
  @override
  Future<void> signOut() async => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]); // same to do this     // await _googleSignIn.signOut();
  // await _firebaseAuth.signOut();

  // Metodo para resetear el password con el email
  @override
  Future<Either<AuthFailure, Unit>> resetPasswordWithEmail(
      {EmailAddress emailAddress}) async {
    try {
      final String emailStr = emailAddress.getOrCrash();
      await _firebaseAuth.sendPasswordResetEmail(email: emailStr);
      return right(unit);
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }
}
