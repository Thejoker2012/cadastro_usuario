import 'package:dio/dio.dart';

class UserService {
  Dio dio = Dio(
    BaseOptions(
      baseUrl:
          "https://crudcrud.com/api/076af59de0db401b84f4251bc63a6dc2/users",
    ),
  );

  getAllUsers() async {
    final response = await dio.get("/");
    return response;
  }

  getOneUser(id) async {
    final response = await dio.get("/$id");
    return response;
  }

  saveUser(user) async {
    final response = await dio.post("/", data: {
      "name": user.name,
      "email": user.email,
      "password": user.password,
      "avatarUrl": user.avatarUrl,
    });
    print(response);
    return response;
  }

  updateUser(id, user) async {
    final response =
        await dio.put("/$id", data: {
        "name": user.name,
        "email": user.email,
        "password": user.password,
        "avatarUrl": user.avatarUrl,
        });
    return response;
  }

  deleteUser(id) async {
    final response = await dio.delete('/$id');
    return response;
  }
}
