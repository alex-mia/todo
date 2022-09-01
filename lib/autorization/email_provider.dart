import 'package:flutter_riverpod/flutter_riverpod.dart';

final EmailRiverpodProvider = StateNotifierProvider((ref) => EmailProvider());

class EmailProvider extends StateNotifier<String?> {
  EmailProvider() : super('');

  void validateEmail(String? value) {
    if (value != null) {
      if (value.length > 5 && value.contains('@') && value.contains('.')) {
        state = 'OK';
      }
      else {
        state = 'Invalid email';
      }
    }
  }
}
