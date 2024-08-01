import 'package:mysql_client/mysql_client.dart';

class ConnectionBD {
  Future<MySQLConnection> getConnection() async {
    final conn = await MySQLConnection.createConnection(
        host: 'localhost',
        port: 3306,
        userName: 'root',
        password: 'root',
        databaseName: 'beta2');
    await conn.connect();
    return conn;
  }

  Future<void> CloseConn(MySQLConnection? conn) async {
    if (conn != null) {
      await conn.close();
    }
  }
}
