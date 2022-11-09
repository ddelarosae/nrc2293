import 'package:test1/counter_app/lib/counter.dart';
import 'package:test/test.dart';

void main() {
  group('Counter', () {
    test('el valor debe iniciar en 0', () {
      expect(Counter().value, 0);
    });

    test('el valor debe ser incrementado', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('el valor debe ser decrementado', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
