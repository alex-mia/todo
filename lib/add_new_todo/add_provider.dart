import 'package:flutter_riverpod/flutter_riverpod.dart';

final Add_new_RiverpodProvider = StateNotifierProvider((ref) => Add_new_Provider());

class Add_new_Provider extends StateNotifier<String?> {
  Add_new_Provider() : super('');

  void validateTextField(String? text) {
    if (text != null) {
      if (text.length > 0) {
        state = 'Ok';
      } else {
        state = 'No';
      }
    }
  }
}

