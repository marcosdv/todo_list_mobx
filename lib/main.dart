import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_mobx/screens/login_screen.dart';
import 'package:todo_list_mobx/stores/login_store.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<LoginStore>(
      create: (_) => LoginStore(),
      child: MaterialApp(
        title: 'ToDo List MobX',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
          scaffoldBackgroundColor: Colors.deepPurpleAccent,
          textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.deepPurpleAccent),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
