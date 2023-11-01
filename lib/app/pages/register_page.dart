import 'package:flutter/material.dart';
import 'package:testes_aula/app/shared/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Aula de Testes')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              key: const Key('email_key'),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'E-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              key: const Key('password_key'),
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              key: const Key('register_button_key'),
              onPressed: () {
                final String? result = _auth.register(
                  emailController.text,
                  passwordController.text,
                );

                if (result != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(result),
                    ),
                  );
                }
              },
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      vertical: 26,
                    ),
                  )),
              child: const Text('REGISTRAR'),
            )
          ],
        ),
      ),
    );
  }
}
