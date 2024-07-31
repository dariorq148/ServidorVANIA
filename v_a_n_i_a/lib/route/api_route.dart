import 'package:v_a_n_i_a/app/http/controllers/user_controller.dart';
import 'package:vania/vania.dart';
import 'package:v_a_n_i_a/app/http/controllers/home_controller.dart';
import 'package:v_a_n_i_a/app/http/middleware/authenticate.dart';
import 'package:v_a_n_i_a/app/http/middleware/home_middleware.dart';
import 'package:v_a_n_i_a/app/http/middleware/error_response_middleware.dart';

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
    Router.basePrefix('api');

    Router.get("/home", homeController.index);
      ///
    Router.get('/usuario1', userController.index);
    ///

    Router.get("/hello-world", () {
      return Response.html('Hello World');
    }).middleware([HomeMiddleware()]);

    // Return error code 400
    Router.get('wrong-request',
            () => Response.json({'message': 'Hi wrong request'}))
        .middleware([ErrorResponseMiddleware()]);

    // Return Authenticated user data
    Router.get("/user", () {
      return Response.json(Auth().user());
    }).middleware([AuthenticateMiddleware()]);

    Router.get("/new-route", () {
      return Response.json({'message': 'This is a new route'});
    });
  }
}
