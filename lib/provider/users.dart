import 'package:cadastro_usuario/api/user_service.dart';
import 'package:cadastro_usuario/data/dummy_users.dart';
import 'package:cadastro_usuario/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  Map<String, User> _items = {...DUMMY_USERS};

  final service = UserService();

  Future<List<User>> get all async {
    return service.getAllUsers();
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    //alterar
    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      return service.updateUser(user.id, user);
    } else {
      //adicionar
      return service.saveUser(user);
    }
    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      service.deleteUser(user.id);
    }
    notifyListeners();
  }
}
