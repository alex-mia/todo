import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final PasswordRiverpodProvider = StateNotifierProvider((ref) => PasswordProvider());

class PasswordProvider extends StateNotifier<String?> {
  PasswordProvider() : super('');


  void validatePassword(String? password) {
    if (password != null) {
      if (password.length > 15) {
        state = 'Long password!';
      }
      if (password.contains(RegExp(r'[A-Z]')) == false) {
        state = "No Capital letter";
      }
      if (password.length < 5) {
          state = 'Short password!';
      }
      if (password.length > 5 && password.length < 15 && password.contains(RegExp(r'[A-Z]')) ) {
        state = 'OK';
      }

      }
    }
  }

