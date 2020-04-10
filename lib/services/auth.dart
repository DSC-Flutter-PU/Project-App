import 'package:password/password.dart';

String hashPassword(String originalPassword) {
  return Password.hash(originalPassword, new PBKDF2());
}

Future<bool> matchPassword(String password, String hash) async {
  return Password.verify(password, hash);
}