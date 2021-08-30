import 'package:riverpod/riverpod.dart';

final hogeProvider = Provider<void>((ref) {
  ref.read(fooProvider)();
});

final fooProvider = Provider<void Function()>((_) {
  return () => print('fooProvider');
});

final _countProvider = StateProvider((_) => 0);

final _someLogicProvider = Provider((ref) => _SomeLogic(ref.read));

class _SomeLogic {
  _SomeLogic(this.read);

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

  container.read(_someLogicProvider).printCount(); // 0
  container.read(_someLogicProvider).incrementCount();
  container.read(_someLogicProvider).printCount(); // 1
}
