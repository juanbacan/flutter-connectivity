import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba2/services/auth_service.dart';
import 'package:prueba2/services/data_service.dart';

class InstructionsPage extends StatelessWidget {
  const InstructionsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final dataService = Provider.of<DataService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructions Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authService.logout();
              dataService.clearUserState();
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Instrucciones para el usuario'),
      ),
    );
  }
}