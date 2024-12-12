import 'dart:io';

import 'package:belajar_vania/app/models/product.dart';
import 'package:vania/vania.dart';

class ProductController extends Controller {
  Future<Response> create(Request request) async {
    // step1 : validasi inputan dari client
    request.validate({
      'name': 'required',
      'description': 'required',
      'price': 'required'
    }, {
      'name.required': 'nama harus diisi',
      'description.required': 'deskripsi harus diisi',
      'price.required': 'harga harus diisi'
    });
    // step2 : tangkap inputan client
    var requestData = request.input();

    // step3 : cek data di db(ada atau tidak)
    var cekProduct =
        await Product().query().where('name', '=', requestData['name']).first();
    if (cekProduct != null) {
      return Response.json({
        "message": "product sudah ada",
      }, HttpStatus.conflict);
    }

    //step3 : masukan data ke database
    Product().query().insert(requestData);

    // step4 : respone ke client
    return Response.json({
      "message": "berhasil mendaftarkan user",
      "data": requestData,
    }, HttpStatus.created);
  }
}

final ProductController productController = ProductController();
