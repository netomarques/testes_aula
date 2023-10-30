import 'package:flutter_test/flutter_test.dart';
import 'package:testes_aula/app/shared/validators/email_validator.dart';

void main() {
  late EmailValidator emailValidator;

  setUp(() {
    emailValidator = EmailValidator();
  });

  group(
    'validação do e-mail',
    () {
      test(
        'deve retornar uma mensagem de erro caso o e-mail seja null',
        () {
          final result = emailValidator.validate();

          expect(result, equals('O e-mail é obrigatório'));
        },
      );

      test(
        'deve retornar uma mensagem de erro caso o e-mail seja vazio',
        () {
          final result = emailValidator.validate(email: '');

          expect(result, equals('O e-mail é obrigatório'));
        },
      );

      test(
        'deve retornar uma mensagem de erro caso o e-mail seja inválido',
        () {
          final result = emailValidator.validate(email: 'email');

          expect(result, equals('O e-mail é inválido'));
        },
      );

      test(
        'deve retornar null caso o e-mail seja válido',
        () {
          final result = emailValidator.validate(email: 'email@gmail.com');

          expect(result, isNull);
        },
      );
    },
  );
}
