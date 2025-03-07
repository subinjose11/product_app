import 'package:riverpod/riverpod.dart';

final baseUrlProvider = StateProvider<String>((ref) {
  return "https://dummyjson.com/products";
});
