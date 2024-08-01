import 'package:vania/vania.dart';

class User extends Model {
  User() {
    super.table('users');
  }

  late int id_donador;
  late String nombre;
  late String categoria;
  late String anio;
  late String direccion;
  late String telefono;

  User.fromMap(Map<String, dynamic> map) {
    id_donador = map['idDonador'];
    nombre = map['nombre'];
    categoria = map['categoria'];
    anio = map['año'];
    direccion = map['direccion'];
    telefono = map['telefono'];
  }

  Map<String, dynamic> toMap() {
    return {
      'idDonador': id_donador,
      'nombre': nombre,
      'categoria': categoria,
      'año': anio,
      'direccion': direccion,
      'telefono': telefono,
    };
  }
}
