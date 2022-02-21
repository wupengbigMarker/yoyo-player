/*
 * @Description: 
 * @Author: wp
 * @Date: 2022-02-15 13:47:08
 * @LastEditors: Wp
 * @LastEditTime: 2022-02-21 15:27:08
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
    required bool showMenu,
    Function? play}) {
  return showMenu
      ? Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 30,
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              videoSeek!,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                            Text(
                              videoDuration!,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      VideoProgressIndicator(
                        controller!,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                            playedColor: Colors.white),
                        padding: EdgeInsets.only(left: 0.0, right: 0.0,bottom: 0.0),
                      ),
                    ],
                  ),
                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Padding(
                  //     padding: EdgeInsets.all(5.0),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       mainAxisSize: MainAxisSize.max,
                  //       children: [
                  //         InkWell(
                  //             onTap: () {
                  //               rewind(controller);
                  //             },
                  //             child: backwardIcon),
                  //         InkWell(
                  //           onTap: play as void Function()?,
                  //           child: Icon(
                  //             controller.value.isPlaying
                  //                 ? Icons.pause_circle_outline
                  //                 : Icons.play_circle_outline,
                  //             color: Colors.white,
                  //             size: 35,
                  //           ),
                  //         ),
                  //         InkWell(
                  //             onTap: () {
                  //               fastForward(controller: controller);
                  //             },
                  //             child: forwardIcon),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        )
      : Container();
}
