import 'package:riverpod/riverpod.dart';

final helloWorldProvider = Provider((_) => 'Hello world');

void main() {
  // 最もシンプルなProviderの例
  final value = ProviderContainer().read(helloWorldProvider);
  print(value); // Hello world

  // Providerの値を無理やり変える例
  // Testのためにモックに切り替えたりするときにProviderScopeを介してこのようなことをするみたい
  final container = ProviderContainer(
      overrides: [helloWorldProvider.overrideWithValue('hello')]);
  print(container.read(helloWorldProvider)); // hello
  // overrideしたProviderをさらにUpdateする例
  container.updateOverrides([helloWorldProvider.overrideWithValue('world')]);
  print(container.read(helloWorldProvider)); // world

  // listenを試す
  container.listen(helloWorldProvider, (value) => print(value));
  container.updateOverrides([
    helloWorldProvider.overrideWithValue('hello world')
  ]); // listenしているので 'hello world' が出力される
}
