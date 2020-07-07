import 'dart:convert';

import 'package:crypto/crypto.dart';

class CriptyUtils {
  static String generateSha256Hash(String value) {
    final bytes = utf8.encode(value ?? '');
    return sha256.convert(bytes).toString();
  }
}