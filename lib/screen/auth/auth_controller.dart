import 'dart:convert';
import 'package:fb_taxi/models/user_register.dart';
import 'package:fb_taxi/models/user_verify.dart';
import 'package:fb_taxi/models/verify.dart';
import 'package:fb_taxi/res/hostting.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


class AuthController extends GetxController {
  Future<bool> register(UserRegister user) async {
    http.Response response = await http.post(Hostting.register,
        headers: Hostting().getHeader(), body: user.toJson());
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<bool> login(String phone) async {
    http.Response response = await http.post(Hostting.login,
        headers: Hostting().getHeader(), body: {"phone": phone});
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> verify(Verify verify) async {
    http.Response response = await http.post(Hostting.verify,
        headers: Hostting().getHeader(), body: verify.toJson());
    if (response.statusCode == 200) {
      var storeg = GetStorage();
      var body = UserVerify.fromJson(jsonDecode(response.body)["data"]);
      storeg.write("token", body.token);
      storeg.write("name", body.name);
      storeg.write("phone", body.phone);
      storeg.write("email", body.email ?? "");
      return true;
    }
    return false;
  }

  Future<UserVerify?> userProfile() async {
    http.Response response =
        await http.get(Hostting.showProfile, headers: Hostting().getHeader());
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return UserVerify.fromJson(body["data"]);
    }
    return null;
  }

  Future<bool?> updateProfile(Verify verify) async {
    http.Response response = await http.post(Hostting.updateProfile,
        headers: Hostting().getHeader(), body: verify);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
