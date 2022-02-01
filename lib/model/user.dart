import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'address.dart';
import 'company.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User(
      this.id,
      this.name,
      this.username,
      this.phone,
      this.website,
      this.company,
      this.address,
      this.email,
      );

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'],
        address = Address.fromJson(json["address"]),
        phone = json['phone'],
        website = json['website'],
        company = Company.fromJson(json["company"]);
}

Future<List<User>> fetchUsers() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  return compute(parseUsers, response.body);
}

List<User> parseUsers(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<User>((json) => User.fromJson(json)).toList();
}