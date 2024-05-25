// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transport_app/models/get_data_gas/model_datagas.dart';

class datagasRepository {
  final _baseUrl =
      'https://apkresep.000webhostapp.com/transport_apps/get_datagas.php';

  Future getData() async {
    try {
      // ignore: non_constant_identifier_names
      final Response = await http.get(Uri.parse(_baseUrl));

      if (Response.statusCode == 200) {
        Iterable it = jsonDecode(Response.body);
        List<datagas> data = it.map((e) => datagas.fromJson(e)).toList();
        return data;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
