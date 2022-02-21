/*
 * @Description: 
 * @Author: wp
 * @Date: 2022-02-15 13:47:08
 * @LastEditors: Wp
 * @LastEditTime: 2022-02-21 23:22:18
 * @FilePath: /example/Users/bm/Desktop/bigmarker/yoyo_player_fork/lib/src/widget/widget_bottombar.dart
 */
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yoyo_player/src/responses/play_response.dart';

Widget bottomBar(
    {VideoPlayerController? controller,
    String? videoSeek,
    String? videoDuration,
    Widget? backwardIcon,
    Widget? forwardIcon,
    required bool isFullScreen,
    Function? play}) {
  return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: isFullScreen ? 80 : 40,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: play as void Function()?,
                        child: Icon(
                          controller!.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Expanded(
                        child:  VideoProgressIndicator(
                        controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                            playedColor: Colors.green),
                        padding: EdgeInsets.only(left: 5.0, right: 5.0)
                      ),),
                      Text(
                        videoSeek! + "/" + videoDuration!,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ],
                  ),
            ),
          ),
        );
}
