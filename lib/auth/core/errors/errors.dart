// Project imports:
import 'failures.dart';

// Error para utilizar en caso de que nos encontremos en una situacion inrecuperable y debamos cerrrar la aplicacion.

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() => Error.safeToString(
      'Encountered a ValueFailure at an unrecoverable point.Terminating. Failure was: $valueFailure');
}
