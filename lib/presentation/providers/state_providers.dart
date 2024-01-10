import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_providers.g.dart';

@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  int build() {
    return 5;
  }

  void increaseByOne() {
    state++;
  }
}

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() {
    return false;
  }

  void toggleDark() {
    state = !state;
  }
}

@riverpod
class Name extends _$Name {
  @override
  String build() {
    return "Denis Rodriguez Mendoza";
  }
}
