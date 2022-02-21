/*
 * @Description: 
 * @Author: wp
 * @Date: 2022-02-20 14:41:19
 * @LastEditors: Wp
 * @LastEditTime: 2022-02-21 17:16:12
 * @FilePath: /example/lib/player_page.dart
 */

import 'package:flutter/material.dart';
import 'package:yoyo_player/yoyo_player.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({ Key? key }) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> with WidgetsBindingObserver{
  bool fullscreen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance?.removeObserver(this);

  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
    //进入应用时候不会触发该状态 应用程序处于可见状态，并且可以响应用户的输入事件。它相当于 Android 中Activity的onResume
      case AppLifecycleState.resumed:
        debugPrint("应用进入前台======");
        break;
    //应用状态处于闲置状态，并且没有用户的输入事件，
    // 注意：这个状态切换到 前后台 会触发，所以流程应该是先冻结窗口，然后停止UI
      case AppLifecycleState.inactive:
        debugPrint("idle");
        break;
    //当前页面即将退出
      case AppLifecycleState.detached:
        debugPrint("will exit======");
        break;
    // 应用程序处于不可见状态
      case AppLifecycleState.paused:
        debugPrint("background======");
        if(fullscreen){
          fullscreen = false;
          setState(() {
            
          });
        }
        break;
    }
  } 


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fullscreen == false
        ? AppBar(
            backgroundColor: Colors.blue,
            title: Image(
              image: AssetImage('image/yoyo_logo.png'),
              fit: BoxFit.fitHeight,
              height: 50,
            ),
            centerTitle: true,
          )
          : null,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              height: fullscreen ? MediaQuery.of(context).size.height : 211,
              child: YoYoPlayer(
                aspectRatio: 16 / 9,
                url:
                // "https://wrtc745991.bigmarker.com:443/hls/d2cfd7157937/b10357a784f889e1afae9108205e7f2c.m3u8",
                "https://wrtc746049.bigmarker.com:443/hls/14061428c408/7678d324037010c923491597d97b51ad.m3u8",
                    // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                    // "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8",
                    // "https://player.vimeo.com/external/440218055.m3u8?s=7ec886b4db9c3a52e0e7f5f917ba7287685ef67f&oauth2_token_id=1360367101",
                    // "https://sfux-ext.sfux.info/hls/chapter/105/1588724110/1588724110.m3u8",
                videoStyle: VideoStyle(
                ),
                videoLoadingStyle:
                VideoLoadingStyle(
                  loading: Center(
                    child: CircularProgressIndicator()
                  ),
                ),
                onFullScreen: (t) {
                  if(mounted){
                    setState(() {
                    fullscreen = t;
                  });
                  }
                  
                },
              ),
            ),
          ],
        )
      );
  }
}

