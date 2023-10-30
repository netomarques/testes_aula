import 'package:flutter_test/flutter_test.dart';
import 'package:testes_aula/app/shared/auth/auth_service.dart';

void main() {
  late Auth auth;

  setUp(() {
    auth = Auth();
  });

  group(
    'validação do cadastro',
    () {
      test(
        'deve retornar uma mensagem para um email e senha inválidos',
        () {
          final result = auth.register('ana', '123');

          expect(result, isA<String>());
        },
      );

      test(
        'deve retornar null para um email e senha válidos',
        () {
          final result = auth.register('ana@gmail.com', 'anajulia123');

          expect(result, isNull);
        },
      );
    },
  );
}
