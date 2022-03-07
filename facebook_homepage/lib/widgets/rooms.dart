import 'package:facebook_homepage/config/palette.dart';
import 'package:facebook_homepage/data/data.dart';
import 'package:facebook_homepage/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUser;

  Rooms({Key? key, required this.onlineUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
            // return Container(
            //   margin: const EdgeInsets.all(2.0),
            //   height: 20.0,
            //   width: 20.0,
            //   color: Colors.red,
            // );
          }),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Create Room'),
      style: ButtonStyle(
        // foregroundColor: MaterialStateProperty.all(Palette.facebookBlue),
        // backgroundColor: MaterialStateProperty.all(Colors.blueAccent[100]),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            // side: const BorderSide(width: 3.0, color: Colors.red),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0),
          const Text('Create\nRoom'),
        ],
      ),
    );
  }
}
