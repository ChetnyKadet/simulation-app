import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogStateNotifier extends StateNotifier<List<String>> {
  LogStateNotifier() : super([]);

  void log(String message) {
    state = [message, ...state];
  }
}
