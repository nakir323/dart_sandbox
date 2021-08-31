import 'package:riverpod/riverpod.dart';

final _countProvider = StateProvider<int>((_) {
  print('_countProvider initialized');
  return 0;
});

final _printProvider = Provider<void>((ref) {
  print('_printProvider initialized');
  print(ref.watch(_countProvider).state);
});

final _printerProvider = Provider<_Printer>((ref) {
  print('_printerProvider initialized');
  return _Printer(ref);
});

class _Printer {
  _Printer(this.ref);
  final ProviderRefBase ref;
  void printCount() {
    print(ref.watch(_countProvider).state);
  }
}

void main() {
  final container = ProviderContainer();
  // container.read(_printProvider);
  // container.read(_countProvider).state++;

  container.read(_printerProvider);
  container.read(_countProvider).state++;
  container.read(_printerProvider).printCount();
  container.read(_countProvider).state++;
  container.read(_printerProvider).printCount();
}
