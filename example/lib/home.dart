/*
 * @Description: 
 * @Author: wp
 * @Date: 2022-02-20 14:41:07
 * @LastEditors: 王鹏 peng.wang@bigmarker.com
 * @LastEditTime: 2022-10-07 10:54:39
 * @FilePath: /example/lib/home.dart
 */
import 'package:example/player_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: TextButton(
          child: Text("点击进入播放页面"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (BuildContext context) => const PlayerPage(),
            ));
          },
        ),
      ),
    );
  }
}
