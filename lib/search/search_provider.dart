import 'package:flutter_riverpod/flutter_riverpod.dart';


final SearchProviderRiverpodProvider = StateNotifierProvider((ref) => SearchProvider());

class SearchProvider extends StateNotifier<String?> {
  SearchProvider() : super('');

  void validDateSearch (String text){
    state = text;
  }


}