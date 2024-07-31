import 'dart:io';
import 'dart:convert';

class model {
  final String title;
  final String description;

  model({required this.title, required this.description});

  factory model.fromJson(Map<String, dynamic> json) {
    return model(title: json['title'],
        description: json['description']);
  }
}
