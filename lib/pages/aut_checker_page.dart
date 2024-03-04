import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:prueba2/pages/login_page.dart';
import 'package:prueba2/pages/splash_screen.dart';
import 'package:prueba2/services/auth_service.dart';
import 'package:prueba2/services/connectivity_service.dart';

class AuthCheckerPage extends StatefulWidget {
  const AuthCheckerPage({super.key});

  @override
  State<AuthCheckerPage> createState() => _AuthCheckerPageState();
}

class _AuthCheckerPageState extends State<AuthCheckerPage> {


  @override
  void initState() {
    super.initState();
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.checkInitialAuthStatus(); // Verificar estado de autenticación inicial
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: Provider.of<AuthService>(context, listen: false).authStream,
      initialData: null,
      builder: (context, snapshot) {
        print('snapshot: $snapshot');
        if (snapshot.data == true) {
          // Usuario autenticado, ir a la página principal
          return const SplashPage();
        } else {
          // Usuario no autenticado, ir a la página de inicio de sesión
          return const LoginPage();
        }
      },
    );
  }
}
