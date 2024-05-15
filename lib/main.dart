
import 'package:flutter/material.dart';
import 'package:mylockerapp/app.dart';
import 'package:mylockerapp/controller_binder.dart';

void main(){
  ControllerBinder().dependencies();
  runApp(const MyLockerApp());
}