import 'package:flutter/material.dart';
import 'package:mvvm_practises/utility/routes/routes.dart';
import 'package:mvvm_practises/utility/routes/routesName.dart';
import 'package:mvvm_practises/viewModel/authViewModel.dart';
import 'package:mvvm_practises/viewModel/homePhotoViewModel.dart';
import 'package:mvvm_practises/viewModel/userSessionViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserSessionViewModel()),
        ChangeNotifierProvider(create: (_) => HomePhotViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.home,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
