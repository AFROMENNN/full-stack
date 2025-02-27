import 'package:vania/vania.dart';
import 'package:belajar_vania/route/api_route.dart';
import 'package:belajar_vania/route/web.dart';
import 'package:belajar_vania/route/web_socket.dart';

class RouteServiceProvider extends ServiceProvider {
  @override
  Future<void> boot() async {}

  @override
  Future<void> register() async {
    WebRoute().register();
    ApiRoute().register();
    WebSocketRoute().register();
  }
}
