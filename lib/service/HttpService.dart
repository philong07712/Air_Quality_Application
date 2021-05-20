import 'dart:convert';

import 'package:air_quality_application/models/Data.dart';
import 'package:air_quality_application/models/Predict.dart';
import 'package:air_quality_application/models/Recommend.dart';
import 'package:http/http.dart' as http;
class HttpService {
    Future<Recommend> fetchRecommend() async {
      final response = await http.get(Uri.https('microcontrollers-assign.herokuapp.com', 'api/data/recommend'));
      if (response.statusCode == 200) {
        return Recommend.fromJson(jsonDecode(response.body));
      } else {
        return Recommend();
      }
    }

    Future<Data> fetchData() async {
      final response = await http.get(Uri.https('microcontrollers-assign.herokuapp.com', 'api/data/latest'));
      if (response.statusCode == 200) {
        return Data.fromJson(jsonDecode(response.body));
      } else {
        return Data();
      }
    }

    Future<Predict> fetchPredict() async {
      final response = await http.get(Uri.https('microcontrollers-assign.herokuapp.com', 'api/data/predict'));
      if (response.statusCode == 200) {
        return Predict.fromJson(jsonDecode(response.body));
      } else {
        return Predict();
      }
    }

    Future<List<Data>> fetchListData() async {
      final response = await http.get(Uri.https('microcontrollers-assign.herokuapp.com', 'api/data'));
      List<Data> list = [];
      if (response.statusCode == 200) {
        Iterable l = json.decode(response.body);
        list = List<Data>.from(l.map((e) => Data.fromJson(e)));
      }
      return list;
    }
}