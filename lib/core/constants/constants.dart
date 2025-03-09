import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final baseUrlProvider = StateProvider<String>((ref) {
  return "https://dummyjson.com/products";
});

var size16B = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
var size16 = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
var size14 = const TextStyle(fontWeight: FontWeight.w500, fontSize: 14);
