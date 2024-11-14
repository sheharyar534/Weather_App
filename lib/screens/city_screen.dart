import 'package:flutter/material.dart';
import 'package:weather1_app/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/city_background.png"),
                fit: BoxFit.cover)),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 50,
                    color: Colors.white,
                  )),
            ),
            //text field
            Container(
                padding: const EdgeInsets.all(25.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration: kInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                )),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context,cityName);
                },
                child: const Text(
                  "Get Weather",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
