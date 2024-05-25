// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transport_app/models/get_data_schedule/model_dataschedule.dart';

class datascheduleRepository {
  final _baseUrl =
      'https://apkresep.000webhostapp.com/transport_apps/get_dataschedule.php';

  Future getData() async {
    try {
      // ignore: non_constant_identifier_names
      final Response = await http.get(Uri.parse(_baseUrl));

      if (Response.statusCode == 200) {
        Iterable it = jsonDecode(Response.body);
        List<dataschedule> data =
            it.map((e) => dataschedule.fromJson(e)).toList();
        return data;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future getDataThisDay() async {
    try {
      final Response = await http.get(Uri.parse(
          "https://apkresep.000webhostapp.com/transport_apps/get_dataschedule_thisday.php"));

      if (Response.statusCode == 200) {
        Iterable it = jsonDecode(Response.body);
        List<dataschedule> data =
            it.map((e) => dataschedule.fromJson(e)).toList();
        return data;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future getDataThisWeek() async {
    try {
      final Response = await http.get(
        Uri.parse(
            "https://apkresep.000webhostapp.com/transport_apps/get_dataschedule_thisweek.php"),
      );

      if (Response.statusCode == 200) {
        Iterable it = jsonDecode(Response.body);
        List<dataschedule> data =
            it.map((e) => dataschedule.fromJson(e)).toList();
        return data;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future getDataThisMonth() async {
    try {
      final Response = await http.get(
        Uri.parse(
            "https://apkresep.000webhostapp.com/transport_apps/get_dataschedule_thismonth.php"),
      );

      if (Response.statusCode == 200) {
        Iterable it = jsonDecode(Response.body);
        List<dataschedule> data =
            it.map((e) => dataschedule.fromJson(e)).toList();
        return data;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
