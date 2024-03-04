import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba2/services/auth_service.dart';
import 'package:prueba2/services/data_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final dataService = Provider.of<DataService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              dataService.clearUserState();
              authService.logout();
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Bienvenido a la página principal'),
      ),
    );
  }
}