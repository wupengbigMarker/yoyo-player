/*
 * @Description: 
 * @Author: wp
 * @Date: 2022-02-15 13:47:07
 * @LastEditors: Wp
 * @LastEditTime: 2022-02-20 15:06:30
 * @FilePath: /example/lib/main.dart
 */
import 'package:example/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage()
    );
  }
}