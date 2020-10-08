import 'package:cadastro_usuario/models/user.dart';
import 'package:dio/dio.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: "https://crudcrud.com/api/ef0f798aca084cc294b07641d229a04b/users",
  ),
);

class UserService {
  Future<List<User>> getAllUsers() {
    return dio.get("/").then((response) {
      return response.data.map<User>((c) => User.fromMap(c)).toList()
          as List<User>;
    }).catchError((err) => print(err));
  }

  Future getOneUser(id) async {
    Response response = await dio.get("/$id");
    return response;
  }

  Future getCount() async {
    Response response = await dio.get("/");
    return response.data.length;
  }

  saveUser(user) async {
    final response = await dio.post("/", data: {
      "name": user.name,
      "email": user.email,
      "password": user.password,
      "dataNascimento": user.dataNascimento,
    });
    print(response);
    return response;
  }

  updateUser(id, user) async {
    final response = await dio.put("/$id", data: {
      "name": user.name,
      "email": user.email,
      "password": user.password,
      "dataNascimento": user.dataNascimento,
    });
    return response;
  }

  deleteUser(id) async {
    final response = await dio.delete('/$id');
    return response;
  }
}
