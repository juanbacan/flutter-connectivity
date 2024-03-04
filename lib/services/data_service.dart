
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba2/services/connectivity_service.dart';


enum UserState { loading, instructions, home, error}

class DataService with ChangeNotifier {

  final ConnectivityService connectivityService;

  DataService(this.connectivityService);

  UserState _estadoInfoUsuario = UserState.loading;
  UserState get estadoInfoUsuario => _estadoInfoUsuario;

  Future checkInitialUserState() async {
    await Future.delayed(const Duration(seconds: 3));
    _estadoInfoUsuario = UserState.instructions;
    notifyListeners();
  }

  Future raiseError() async {
    await Future.delayed(const Duration(seconds: 3));
    _estadoInfoUsuario = UserState.error;
    notifyListeners();
  }

  Future clearUserState() async {
    await Future.delayed(const Duration(seconds: 3));
    _estadoInfoUsuario = UserState.loading;
  }

  void fetchData({
    required String url,
    required Function(dynamic) onSuccess,
    required Function(dynamic) onError,
  }) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Si la solicitud es exitosa, llama a la función onSuccess con los datos recibidos
        onSuccess(response.body);
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
