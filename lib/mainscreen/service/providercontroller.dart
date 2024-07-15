import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practice/config/api_keys.dart';
import 'package:practice/config/apifailure.dart';
import 'package:practice/config/instances/instances.dart';
import 'package:practice/config/typedef/typedef.dart';
import 'package:practice/mainscreen/model/weathermodel.dart';
import 'package:practice/mainscreen/view/widgets/weatherdisplay.dart';
import 'package:provider/provider.dart';
import 'package:dartz/dartz.dart';

class WeatherNotifier with ChangeNotifier {
  TextEditingController search = TextEditingController();
  bool loading = false;
  notifyListeners();

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  Weatherdetails? weatherDetails;

  FutureResult<bool> getWeather() async {
    try {
      print("Check");
      print(search.text);
      final response = await dio.get(
          'http://api.weatherapi.com/v1/current.json?key=${weather_api_key}&q=${search.text}&aqi=no');
      if (response.statusCode == 200) {
        weatherDetails =
            Weatherdetails.fromMap(response.data as Map<String, dynamic>);

        loading = false;
        notifyListeners();
        return Right(true);
      } else {
        loading = false;
        notifyListeners();
        return Left(ApiFailure(
            message: "Failed to fetch data", statusCode: response.statusCode!));
      }
    } catch (e) {
      loading = false;
      notifyListeners();
      return Left(ApiFailure(message: e.toString(), statusCode: 500));
    }
  }

  void fetchWeather() async {
    loading = true;
    var result = await getWeather();
    notifyListeners();
    result.fold((failure) => print('Error: ${failure.message}'),
        (success) => print('Fetch was successful'));
  }
}
