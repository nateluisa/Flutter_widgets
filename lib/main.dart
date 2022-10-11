import 'package:flutter/material.dart';
import 'package:flutter_api/screens/emissao.dart';
import 'package:flutter_api/screens/nova_contagem.dart';
import 'package:flutter_api/screens/recebimento.dart';
import 'package:flutter_api/screens/transferencia.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'initial_pages/home.dart';
import 'initial_pages/login.dart';



void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
  FlutterNativeSplash.remove();
}



class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(
      loginContext: context,
    ),
    HomePage.tag: (context) => HomePage(
       homeContext: context,
    ),
    Recebimento.tag: (context) => const Recebimento(),
    Transferencia.tag: (context) => const Transferencia(),
    NovaContagem.tag: (context) =>  NovaContagem()

  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MaterialApp(
        title: 'Albatros conferência',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          fontFamily: 'Nunito',
        ),
        home: LoginPage(loginContext: context),
        routes: routes,
      ),
    );
  }



}


