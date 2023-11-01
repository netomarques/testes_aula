import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testes_aula/app/pages/register_page.dart';

void main() {
  group('testes do campo de email', () {
    testWidgets(
      'deve confirmar que o campo de email aparece na tela corretamente',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailKey = find.byKey(const Key('email_key'));

        expect(emailKey, findsOneWidget);
      },
    );

    testWidgets(
      'deve exibir uma SnackBar com a mensagem de erro caso o e-mail seja nulo',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(find.text('O e-mail é obrigatório'), findsOneWidget);
      },
    );

    testWidgets(
      'deve exibir uma SnackBar com a mensagem de erro caso o e-mail seja vazio',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, '');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(find.text('O e-mail é obrigatório'), findsOneWidget);
      },
    );

    testWidgets(
      'deve exibir uma SnackBar com a mensagem de erro caso o e-mail seja inválido',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, 'ana');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(find.text('O e-mail é inválido'), findsOneWidget);
      },
    );

    testWidgets(
      'não deve exibir nenhuma SnackBar com a mensagem de erro caso o e-mail seja válido',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, 'ana@gmail.com');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(
            find.text('O e-mail é inválido'), findsNothing); // ***23:00******
      },
    );
  });

  group('testes do campo de senha', () {
    testWidgets(
      'deve confirmar que o campo de senha aparece na tela corretamente',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final passwordField = find.byKey(const Key('password_key'));

        expect(passwordField, findsOneWidget);
      },
    );

    testWidgets(
      'deve exibir uma Snackbar com a mensagem de erro caso a senha seja nula',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, 'ana@gmail.com');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(find.text('A senha é obrigatória'), findsOneWidget);
      },
    );

    testWidgets(
      'deve exibir uma Snackbar com a mensagem de erro caso a senha seja vazia',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, 'ana@gmail.com');
        await tester.pumpAndSettle();

        final passwordField = find.byKey(const Key('password_key'));
        await tester.tap(passwordField);
        await tester.pumpAndSettle();

        await tester.enterText(passwordField, '');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(find.text('A senha é obrigatória'), findsOneWidget);
      },
    );

    testWidgets(
      'deve exibir uma Snackbar com a mensagem de erro caso a senha seja menor que 6 caracteres',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, 'ana@gmail.com');
        await tester.pumpAndSettle();

        final passwordField = find.byKey(const Key('password_key'));
        await tester.tap(passwordField);
        await tester.pumpAndSettle();

        await tester.enterText(passwordField, 'ana');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(
          find.text('A senha deve possuir pelo menos 6 caracteres'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'deve exibir uma Snackbar com a mensagem de erro caso a senha não seja alfanumérica',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, 'ana@gmail.com');
        await tester.pumpAndSettle();

        final passwordField = find.byKey(const Key('password_key'));
        await tester.tap(passwordField);
        await tester.pumpAndSettle();

        await tester.enterText(passwordField, 'anajulia');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(
          find.text('A senha deve ser alfanumérica'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'não deve aparecer nenhuma SnackBar com a mensagem de erro caso a senha e email sejam válidos',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, 'ana@gmail.com');
        await tester.pumpAndSettle();

        final passwordField = find.byKey(const Key('password_key'));
        await tester.tap(passwordField);
        await tester.pumpAndSettle();

        await tester.enterText(passwordField, 'ana123');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(
          find.text('A senha deve ser alfanumérica'),
          findsNothing,
        );
      },
    );
  });

  group('testes do botão de cadastro', () {
    testWidgets(
      'deve confirmar que o botão de cadastro aparece na tela corretamente',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final registerButton = find.byKey(const Key('register_button_key'));

        expect(registerButton, findsOneWidget);
      },
    );

    testWidgets(
      'deve exibir uma SnackBar com a mensagem de erro para um email e senha inválidas ao clicar no botão',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, 'ana');
        await tester.pumpAndSettle();

        final passwordField = find.byKey(const Key('password_key'));
        await tester.tap(passwordField);
        await tester.pumpAndSettle();

        await tester.enterText(passwordField, 'ana2');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
      },
    );

    testWidgets(
      'não deve exibir uma SnackBar com mensagem de erro para um email e senha válidas',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: RegisterPage(),
          ),
        );

        final emailField = find.byKey(const Key('email_key'));
        await tester.tap(emailField);
        await tester.pumpAndSettle();

        await tester.enterText(emailField, 'ana@gmail.com');
        await tester.pumpAndSettle();

        final passwordField = find.byKey(const Key('password_key'));
        await tester.tap(passwordField);
        await tester.pumpAndSettle();

        await tester.enterText(passwordField, 'ana123');
        await tester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await tester.tap(registerButton);
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsNothing);
      },
    );
  });
}
