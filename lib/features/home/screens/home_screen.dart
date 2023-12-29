import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sway_app/core/constants/constants.dart';
import 'package:flutter_sway_app/features/home/models/weather.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Future<List<WeatherForecast>> fetchWeatherForecast() async {
  try {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:53053/WeatherForecast'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: 'api_token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseJson = jsonDecode(response.body);
      return WeatherForecast.fromJsonList(responseJson);
    } else {
      throw Exception('Failed to load weather forecasts.');
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('Failed to connect to the server.');
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<WeatherForecast>> futureWeatherForecast;

  @override
  void initState() {
    super.initState();
    futureWeatherForecast = fetchWeatherForecast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildSwayText(),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.backgroundColor, // Start Color
            Color.fromARGB(255, 65, 73, 109), // End Color
          ],
        )),
        child: Center(
          child: FutureBuilder<List<WeatherForecast>>(
            future: futureWeatherForecast,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<WeatherForecast> weatherForecasts = snapshot.data!;
                return ListView.builder(
                  itemCount: weatherForecasts.length,
                  itemBuilder: (context, index) {
                    final WeatherForecast weatherForecast =
                        weatherForecasts[index];
                    return Card(
                      elevation: 5,
                      margin: UIConstants.defaultPadding,
                      child: ListTile(
                        title: Text(weatherForecast.summary,
                            style: Theme.of(context).textTheme.titleMedium),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text(
                              'Date: ${DateFormat('yyyy-MM-dd').format(weatherForecast.date)}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Temperature: ${weatherForecast.temperatureC}°C',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Temperature: ${weatherForecast.temperatureF}°F',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSwayText() => const Text(
        'SWAY',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      );
}
