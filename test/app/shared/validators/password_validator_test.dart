import 'package:flutter_test/flutter_test.dart';
import 'package:testes_aula/app/shared/validators/password_validator.dart';

void main() {
  late PasswordValidator passwordValidator;

  setUp(() {
    passwordValidator = PasswordValidator();
  });

  group(
    'validação de senha',
    () {
      test(
        'deve retornar uma mensagem de erro caso a senha seja null',
        () {
          final result = passwordValidator.validate();

          expect(result, equals('A senha é obrigatória'));
        },
      );

      test(
        'deve retornar uma mensagem de erro caso a senha seja vazia',
        () {
          final result = passwordValidator.validate(password: '');

          expect(result, equals('A senha é obrigatória'));
        },
      );

      test(
        'deve retornar uma mensagem de erro caso a senha menor que 6 caracteres',
        () {
          final result = passwordValidator.validate(password: 'ana');

          expect(
            result,
            equals('A senha deve possuir pelo menos 6 caractesres'),
          );
        },
      );

      test(
        'deve retornar uma mensagem de erro caso a senha não senha alfanumérica',
        () {
          final result = passwordValidator.validate(password: 'anajulia');

          expect(result, equals('A senha deve ser alfanumérica'));
        },
      );

      test(
        'deve retornar null caso a senha seja válida',
        () {
          final result = passwordValidator.validate(password: 'anajulia123');

          expect(result, isNull);
        },
      );
    },
  );
}
