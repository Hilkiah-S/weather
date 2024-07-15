// import 'package:dartz/dartz.dart';
// import 'package:dartz/dartz.dart';

// Future<Either<bool,String>> getWeather()async{

// }
import 'package:dartz/dartz.dart';
import 'package:practice/config/apifailure.dart';
import 'package:practice/config/instances/instances.dart';
import 'package:practice/config/typedef/typedef.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:practice/config/api_keys.dart';
import 'package:practice/mainscreen/model/weathermodel.dart';

//  FutureResult<bool> getWeather() async {
//     try {
//       final response = await dio.get(
//           'http://api.weatherapi.com/v1/current.json?key=${weather_api_key}&q=${search.text}&aqi=no');
//       if (response.statusCode == 200) {
//         weatherDetails.value =
//             Weatherdetails.fromJson(json.encode(response.data));
//         loading.value = true;
//         return Right(true);
//       } else {
//         loading.value = false;
//         return Left(ApiFailure(
//             message: "Failed to fetch data", statusCode: response.statusCode!));
//       }
//     } catch (e) {
//       loading.value = true;
//       return Left(ApiFailure(message: e.toString(), statusCode: 500));
//     }
//   }

//   void fetchWeather() async {
//     loading.value = true;
//     var result = await getWeather();
//     result.fold((failure) => print('Error: ${failure.message}'),
//         (success) => print('Fetch was successful'));
//   }