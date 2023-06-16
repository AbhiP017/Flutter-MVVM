import 'dart:async';
import 'dart:convert';

import 'package:flutter_mvvm_provider/models/users_list_model.dart';
import 'package:http/http.dart' as http;

Future<User> fetchUser(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print("The response is getting");
    return User.fromJSON(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load userdata');
  }
}