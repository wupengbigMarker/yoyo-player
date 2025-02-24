/*
 * @Description: 
 * @Author: wp
 * @Date: 2022-02-20 14:41:19
 * @LastEditors: Wp
 * @LastEditTime: 2022-10-18 11:28:30
 * @FilePath: /example/lib/player_page.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoyo_player/yoyo_player.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  bool fullscreen = false;
  @override
  void initState() {
    super.initState();
    
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
                // "https://ms-6e6d62dbac6e-54522cfdde55.bigmarker.com:443/hls/54522cfdde55/3a65cfbcddcd22340bf8f1a7dd19cfaa.m3u8",
                    // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                    // "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8",
                // "https://player.vimeo.com/external/440218055.m3u8?s=7ec886b4db9c3a52e0e7f5f917ba7287685ef67f&oauth2_token_id=1360367101",
                "https://sfux-ext.sfux.info/hls/chapter/105/1588724110/1588724110.m3u8",
                videoStyle: VideoStyle(),
                videoLoadingStyle: VideoLoadingStyle(
                  loading: Center(child: CircularProgressIndicator()),
                ),
                onFullScreen: (t) {
                  if (mounted) {
                    fullscreen = t;
                    if (fullscreen) {
                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.landscapeRight, //全屏时旋转方向，左边
                      ]);
//                         SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
//   SystemUiOverlay.top
// ]);
                      SystemChrome.setEnabledSystemUIMode(
                          SystemUiMode.immersiveSticky);
                    } else {
                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.portraitUp,
                      ]);
                      SystemChrome.setEnabledSystemUIMode(
                          SystemUiMode.edgeToEdge);
                    }
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ));
  }
}
