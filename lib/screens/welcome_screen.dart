import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weather1_app/screens/location_screen.dart';
import 'package:weather1_app/services/weather_modal.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    requestLOcation();
  }

  File? userImage;
  final picker = ImagePicker();

  //picking image

  Future imageFromUser() async {
    final pickedImge = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImge != null) {
        userImage = File(pickedImge.path);
      } else {
        print("imnage is not selected");
      }
    });
  }

  // controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void Login(String email, password) async {
    try {
      Response response =
          await post(Uri.parse("https://reqres.in/api/register"), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        getLocatoinData();
      } else {
        if (kDebugMode) {
          print("invalid user");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void getLocatoinData() async {
    WeatherModal weatherModal = WeatherModal();
    var weatherData = await weatherModal.getLocatoinWeather();

    log(name: "ali", weatherData.runtimeType.toString());
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LocationScreen(locationWeather: weatherData)));
  }

  void requestLOcation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    print(permission);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Log In",
            style: TextStyle(
                color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              imageFromUser();
            },
            child:  CircleAvatar(
              radius: 50,
              child: userImage == null ? const Icon(Icons.person_3) : ClipOval(child: Image.file(userImage!,width: 90)),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: emailController,
                cursorColor: Colors.grey,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    hintText: "Enter Email",
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(Icons.email_outlined,
                        color: Colors.white, size: 40),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              )),
          Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: passwordController,
                cursorColor: Colors.grey,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    hintText: "Enter password",
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(Icons.password_sharp,
                        color: Colors.white, size: 40),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              )),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white),
              ),
              onPressed: () {
                Login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: const Text(
                "Get Location",
                style: TextStyle(color: Colors.black),
              )),
        ],
      )),
    );
  }
}
