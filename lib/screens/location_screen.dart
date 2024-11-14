import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather1_app/screens/city_screen.dart';
import 'package:weather1_app/services/weather_modal.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  const LocationScreen({super.key, this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModal weather = WeatherModal();
  late String cityName;
  late String getWeatherIcon;
  late int tempreture;
  late String getWeatherMessage;

  @override
  void initState() {
    super.initState();
    upadatedUi(widget.locationWeather);
  }

  void upadatedUi(dynamic weatherData) {
    setState(() {
      cityName = weatherData["name"];
      var condId = weatherData["weather"][0]["id"];
      getWeatherIcon = weather.getWeatherIcon(condId);
      double temp = weatherData["main"]["temp"];
      tempreture = temp.toInt();
      getWeatherMessage = weather.getMessage(tempreture);
      if (kDebugMode) {
        print(condId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("weather"),
          centerTitle: true,
        ),
        drawer: const Drawer(),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/weather_bg.png"),
                  fit: BoxFit.fill)),
          constraints: const BoxConstraints.expand(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.rotate(
                      angle: 45,
                      child: IconButton(
                          onPressed: () async {
                            var weatherData =
                                await weather.getLocatoinWeather();
                            upadatedUi(weatherData);
                          },
                          icon: const Icon(
                            Icons.navigation_sharp,
                            size: 70,
                            color: Colors.white,
                          )),
                    ),
                    IconButton(
                        onPressed: ()  {
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) {
                          //     return const HistoryScreen();
                          //   },
                          // ));
                        },
                        icon: const Icon(
                          Icons.history_outlined,
                          size: 70,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () async {
                          var typedName = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CityScreen()));
                          // print(typedName);
                          if (typedName != null) {
                            var weatherData =
                                await weather.cityWeather(typedName);
                            return setState(() {
                              upadatedUi(weatherData);
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.location_city,
                          size: 70,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20),
                child: Row(
                  children: [
                    Text(
                      "$tempreture °C",
                      style: const TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(width: 20),
                    Text(getWeatherIcon,
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 90),
                child: Text(
                  "$getWeatherMessage in",
                  style: const TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 90),
                child: Text(
                  cityName,
                  style: const TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
              )
            ],
          ),
        ));
  }
}
