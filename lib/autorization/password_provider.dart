import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final PasswordRiverpodProvider = StateNotifierProvider((ref) => PasswordProvider());

class PasswordProvider extends StateNotifier<String?> {
  PasswordProvider() : super('');


  void validatePassword(String? password) {
    if (password != null) {
      if (password.length > 10) {
        state = 'Long password!';
      }
      if (password.length < 5) {
          state = 'Short password!';
      }
      if (password.length > 5 && password.length < 10) {
        state = 'OK';
      }

      }
    }
  }

