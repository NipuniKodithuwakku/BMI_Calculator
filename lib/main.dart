import 'package:flutter/material.dart';
import './ui/home.dart';

void main(){
  runApp(new MaterialApp(
    title: "BMI app",
    debugShowCheckedModeBanner: false,
    home:new Home()
  ));
}