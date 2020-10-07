import 'package:cadastro_usuario/provider/users.dart';
import 'package:cadastro_usuario/routes/app_routes.dart';
import 'package:cadastro_usuario/views/user_form.dart';
import 'package:cadastro_usuario/views/user_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(title: 'Lista de Usuários', routes: {
        AppRoutes.HOME: (_) => UserList(),
        AppRoutes.USER_FORM: (_) => UserForm()
      }),
    );
  }
}
