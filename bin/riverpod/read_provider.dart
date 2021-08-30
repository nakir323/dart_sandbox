import 'package:riverpod/riverpod.dart';

final hogeProvider = Provider<void>((ref) {
  ref.read(fooProvider)();
});

final fooProvider = Provider<void Function()>((_) {
  return () => print('fooProvider');
});

final _countProvider = StateProvider((_) => 0);

final _logicProvider = Provider((ref) => _Logic(ref.read));

class _Logic {
  _Logic(this.read);

  final Reader read;

  void printCount() {
    print(read(_countProvider).state);
  }

  void incrementCount() {
    read(_countProvider).state++;
  }
}

void main() {
  final container = ProviderContainer();
  container.read(hogeProvider); // fooProvider

  container.read(_logicProvider).printCount(); // 0
  container.read(_logicProvider).incrementCount();
  container.read(_logicProvider).printCount(); // 1
}
