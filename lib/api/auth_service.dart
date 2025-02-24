import 'package:dio/dio.dart';

class AuthService {
  //create the DIO object

  final Dio dio =
      Dio(BaseOptions(baseUrl: 'https://mbpadqmjzirzxibjstoe.supabase.co'));

  //this is the login function that uses the base url in dio
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      Response response = await dio
          .post("/login", data: {"email": email, "password": password});
      return response.data;
    } catch (e) {
      return {"Error": e.toString()};
    }
  }

  //this is the register function that uses the base url in dio
  Future<Map<String, dynamic>> register(
      String email, String username, String password) async {
    try {
      Response response = await dio.post("/register",
          data: {"email": email, "username": username, "password": password});
      return response.data;
    } catch (e) {
      return {"Error": e.toString()};
    }
  }

  Future<Map<String, dynamic>> logout() async {
    try {
      Response response = await dio.post("/logout");
      return response.data;
    } catch (e) {
      return {"error": e.toString()};
    }
  }
}
