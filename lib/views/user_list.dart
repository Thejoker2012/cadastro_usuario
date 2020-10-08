import 'package:cadastro_usuario/api/user_service.dart';
import 'package:cadastro_usuario/components/user_tile.dart';
import 'package:cadastro_usuario/models/user.dart';
import 'package:cadastro_usuario/routes/app_routes.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  Future<List<User>> userFuture;
  UserService service;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    service = UserService();
    userFuture = service.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
              })
        ],
      ),
      body: FutureBuilder(
        future: this.userFuture,
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Column(
              children: <Widget>[
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Text('Error: $snapshot.error')
              ],
            ));
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (ctx, i) => UserTile(snapshot.data[i]));
          }
        },
      ),
    );
  }
}
