import 'dart:convert';
import 'package:vania/vania.dart';
import '../../../services/conexion.dart';
import '../../models/user.dart';
class UserController extends Controller {
  Future<Response> index() async {
    try {
      String jsonResult = await verUsuarios();
      return Response.json(
        jsonDecode(
            jsonResult),     );
    } catch (e) {
      return Response.json(
        {'error': 'Error al consultar los datos: $e'},

      );
    }
  }

  Future<String> verUsuarios() async {
    final ConnectionBD conn = ConnectionBD();
    final connected = await conn
        .getConnection();
    var result = await connected.execute('SELECT * FROM Donantes');

    List<User> users = [];

    if (result.rows.isNotEmpty) {
      for (var row in result.rows) {
        Map<String, dynamic> rowData = {
          'idDonador': int.parse(row.colAt(0)!),
          'nombre': row.colAt(1)!,
          'categoria': row.colAt(2)!,
          'año': row.colAt(3)!,
          'direccion': row.colAt(4)!,
          'telefono': row.colAt(5)!,
        };

        User user = User.fromMap(rowData);
        users.add(user);
      }
    }

    await connected.close();
    List<Map<String, dynamic>> userMaps =
        users.map((user) => user.toMap()).toList();
    return jsonEncode(userMaps);
  }
}

final UserController userController = UserController();
