import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sway_app/core/constants/app_colors.dart';
import 'package:flutter_sway_app/core/constants/ui_constants.dart';
import 'package:flutter_sway_app/features/home/models/weather.dart';
import 'package:flutter_sway_app/features/home/widgets/requests_text.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Future<List<WeatherForecast>> fetchWeatherForecast() async {
  try {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:55283/WeatherForecast'),
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
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Container(
            height: 180,
            child: Stack(
              children: <Widget>[
                Container(
                  color: AppColors.appBarShadeColor,
                  height: 150,
                  padding: EdgeInsets.only(left: 36, top: 12),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '¡Bienvenido de nuevo,',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        'Mauricio Alejandro Santiago González!',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        decoration: BoxDecoration(
                          color: AppColors.primaryButtonColor,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Solicitados\nhoy',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                              ),
                            ),
                            SizedBox(width: 32),
                            RequestsText(
                              requests: 100,
                              color: AppColors.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 36.0,
              vertical: 24,
            ),
            child: Container(
              height: 48,
              child: CupertinoSearchTextField(
                borderRadius: BorderRadius.circular(16),
                placeholder: 'Buscar',
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: FutureBuilder<List<WeatherForecast>>(
                future: futureWeatherForecast,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<WeatherForecast> weatherForecasts =
                        snapshot.data!;
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
        ],
      ),
    );
  }
}
