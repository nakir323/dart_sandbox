import 'package:riverpod/riverpod.dart';

final helloWorldProvider = Provider((_) => 'Hello world');

void main() {
  final value = ProviderContainer().read(helloWorldProvider);
  print(value); // Hello world
}
