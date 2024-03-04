
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba2/services/data_service.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {

    final dataService = Provider.of<DataService>(context, listen: false);
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Error, algo salió mal. Intente de nuevo'),
            // Botón para recargar la página
            ElevatedButton(
              onPressed: () {
                dataService.checkInitialUserState();
              },
              child: const Text('Recargar'),
            ),
          ],
        ),

      ),
    );
  }
}