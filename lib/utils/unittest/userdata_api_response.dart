import 'dart:async';
import 'dart:convert';


import 'package:flutter_Riverpod/model/user_model.dart';
import 'package:http/http.dart' as http;




Future<UserModel> fetchusers(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://reqres.in/api/users?page=2'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print("The response is getting");
    return UserModel.fromJson(jsonDecode(response.body));

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load userdata');
  }
}