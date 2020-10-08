import 'package:cadastro_usuario/api/user_service.dart';
import 'package:cadastro_usuario/models/user.dart';
import 'package:flutter/material.dart';

final service = UserService();

class UserProvider with ChangeNotifier {
  void put(User user) {
    if (user == null) {
      return;
    }

    //alterar
    if (user.id != null && user.id.trim().isNotEmpty) {
      service.updateUser(user.id, user);
      return notifyListeners();
    } else {
      //adicionar
      service.saveUser(user);
      return notifyListeners();
    }
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      service.deleteUser(user.id);
      return notifyListeners();
    }
  }
}
