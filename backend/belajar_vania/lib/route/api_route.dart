import 'package:belajar_vania/app/http/controllers/product_controller.dart';
import 'package:vania/vania.dart';

class ApiRoute implements Route {
  @override
  void register() {
    Router.post('create', productController.create);
  }
}
