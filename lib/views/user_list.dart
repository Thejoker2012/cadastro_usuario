import 'package:cadastro_usuario/api/user_service.dart';
import 'package:cadastro_usuario/components/user_tile.dart';
import 'package:cadastro_usuario/provider/users.dart';
import 'package:cadastro_usuario/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final UserProvider users = Provider.of(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
        actions: <Widget>[IconButton(icon: Icon(Icons.add), onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.USER_FORM
          );
        })],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
