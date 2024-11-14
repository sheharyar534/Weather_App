import 'package:flutter/material.dart';

const kInputDecoration = InputDecoration(
    hintText: "Enter City Name",
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10))));
