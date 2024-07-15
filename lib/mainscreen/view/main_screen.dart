import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/mainscreen/service/providercontroller.dart';

import 'package:practice/mainscreen/service/weathercontroller.dart';
import 'package:practice/mainscreen/view/widgets/commonwidgets.dart';
import 'package:practice/mainscreen/view/widgets/weatherdisplay.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class WeatherMain extends StatefulWidget {
  const WeatherMain({super.key});

  @override
  State<WeatherMain> createState() => _WeatherMainState();
}

class _WeatherMainState extends State<WeatherMain> {
  @override
  Widget build(BuildContext context) {
    WeatherNotifier weatherControllerRead = context.read<WeatherNotifier>();
    WeatherNotifier weatherControllerWatch = context.watch<WeatherNotifier>();
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                width: 200,
                height: 50,
                hintText: "Your City",
                controller: weatherControllerRead.search,
              ),
              SizedBox(
                width: 10,
              ),
              CustomElevatedButton(
                width: 120,
                height: 50,
                text: "Search",
                onPressed: () => weatherControllerRead.fetchWeather(),
                backgroundColor: Colors.white,
                textColor: Colors.black,
              ),
            ],
          ),
          weatherControllerWatch.weatherDetails != null
              ? (!weatherControllerWatch.loading
                  ? WeatherDisplay(
                      city: weatherControllerWatch
                              .weatherDetails?.location.name ??
                          "City Name",
                      tempCelsius:
                          weatherControllerWatch.weatherDetails!.current.tempC,
                      tempFahrenheit:
                          weatherControllerWatch.weatherDetails!.current.tempF,
                      country: weatherControllerWatch
                          .weatherDetails!.location.country,
                      weatherIconUrl: weatherControllerWatch
                          .weatherDetails!.current.condition.icon,
                    )
                  : Loading())
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 300.0,
                    height: 200.0,
                    child: Shimmer.fromColors(
                      baseColor: const Color.fromARGB(255, 206, 193, 193),
                      highlightColor: Colors.grey,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    ));
  }
}
