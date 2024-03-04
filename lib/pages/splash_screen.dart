import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba2/pages/error_page.dart';
import 'package:prueba2/pages/home_page.dart';
import 'package:prueba2/pages/instructions_page.dart';
import 'package:prueba2/services/data_service.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    final dataService = Provider.of<DataService>(context, listen: false);
    dataService.checkInitialUserState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Consumer<DataService>(
      builder: (context, dataService, child) {

        switch (dataService.estadoInfoUsuario) {
          case UserState.instructions:
            return const InstructionsPage();
          case UserState.home:
            return const HomePage();
          case UserState.loading:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case UserState.error:
            return const ErrorPage();
          default:
            return const ErrorPage();
        }
      },
    );
  }
}