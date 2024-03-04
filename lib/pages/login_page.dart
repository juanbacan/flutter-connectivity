import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba2/services/auth_service.dart';
import 'package:prueba2/widgets/connectivity_card.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                authService.login();
              },
              child: const Text('Iniciar Sesión'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('¿No tienes una cuenta? Regístrate aquí'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                authService.prueba();
              },
              child: const Text('Prueba'),
            ),

            const ConnectivityCard()
          ],
        ),
      ),
    );
  }
}