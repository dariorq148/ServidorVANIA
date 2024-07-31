import 'package:vania/vania.dart';

class UserController extends Controller {
  Future<Response> index() async {
    return Response.json(
        {'title': 'Flutter dev', 'description': 'this is my first web'});
  }
}

final UserController userController = UserController();
