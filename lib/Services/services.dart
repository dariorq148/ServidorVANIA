import 'dart:convert';

import 'package:frontvania/Models/model.dart';
import 'package:http/http.dart'as http;

class Services{

  Future<model?>fetchData()async{
    final url=Uri.parse('http://localhost:8000/api/usuario1');
    final response=await http.get(url);
    if(response.statusCode==200)
      {
        final data=jsonDecode(response.body);
        print(data.toString());
        final jmodel=model.fromJson(data);
        return jmodel;
      }else{
      return null;
    }
  }
}