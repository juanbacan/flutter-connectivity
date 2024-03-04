import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba2/services/connectivity_service.dart';


class AuthService with ChangeNotifier {
  final ConnectivityService connectivityService;
  final http.Client httpClient = http.Client();

  AuthService(this.connectivityService);

  bool _isAuthenticated = false;

  // Stream para notificar cambios en la autenticación
  final _authController = StreamController<bool>();
  Stream<bool> get authStream => _authController.stream;

  bool get isAuthenticated => _isAuthenticated;

  void checkInitialAuthStatus() {
    // Verificar si el usuario está autenticado inicialmente
    // Simulamos una verificación de autenticación inicial (puedes ajustarlo según tu lógica real)
    const isAuthenticated = false; // Simulamos que el usuario está autenticado inicialmente
    _isAuthenticated = isAuthenticated;
    _authController.add(isAuthenticated); // Notificar cambio de estado de autenticación
  }

  void login() {
    _isAuthenticated = true;
    _authController.add(true); // Notificar inicio de sesión
  }

  void register(String email, String password) {
    // Aquí iría la lógica real para registrar al usuario
    print('Registrando usuario con email: $email y contraseña: $password');
    _isAuthenticated = true; // Simulamos que el registro fue exitoso
    _authController.add(true); // Notificar inicio de sesión después del registro
  }

  void logout() {
    print("Haciendo un logout");
    _isAuthenticated = false;
    _authController.add(false); // Notificar cierre de sesión
  }

  @override
  void dispose() {
    _authController.close();
    httpClient.close();
    super.dispose();
  }


  void prueba() {
    fetchData(
      url: 'https://jsonplaceholder.typicode.com/posts',
      method: 'GET',
      onSuccess: (data) {
        print('Datos recibidos: $data');
      },
      onError: (error) {
        print('Error: $error');
      },
    );
  }

  void fetchData({
    required String url,
    required String method, // 'GET' o 'POST'
    dynamic data, // Datos de la solicitud (opcional)
    required Function(dynamic) onSuccess,
    required Function(dynamic) onError,
    }) async {
    try {
      if (!connectivityService.isConnected) {
        onError('No hay conexión a internet');
        return;
      }

      final response = method == 'GET'
        ? await httpClient.get(Uri.parse(url))
        : await httpClient.post(Uri.parse(url), body: data);

      final responseBody = response.body;
      
      if (response.statusCode == 200) {
        // Si la solicitud es exitosa, llama a la función onSuccess con los datos recibidos
        onSuccess(responseBody);
      } else {
        // Si la solicitud falla, llama a la función onError con el mensaje de error
        onError('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Si hay algún error durante la solicitud, llama a la función onError con el error
      onError(error.toString());
    }
  }
}