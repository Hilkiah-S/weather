import 'package:flutter/material.dart';

class WeatherDisplay extends StatelessWidget {
  final String city;
  final String country;
  final double tempCelsius;
  final double tempFahrenheit;
  final String weatherIconUrl;

  WeatherDisplay({
    required this.city,
    required this.country,
    required this.tempCelsius,
    required this.tempFahrenheit,
    required this.weatherIconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$city, $country',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Image.network(
            'https:' + weatherIconUrl,
            width: 100,
            height: 100,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
          ),
          SizedBox(height: 10),
          Text(
            '${tempCelsius.toStringAsFixed(1)}°C',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            '${tempFahrenheit.toStringAsFixed(1)}°F',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
