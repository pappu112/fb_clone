import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class Room extends StatelessWidget {

  final List<User> onlineUsers;

  const Room({Key key, @required this.onlineUsers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1+ onlineUsers.length,
          itemBuilder: (BuildContext context,int index){
          if(index ==0){
            return Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _CreateRoomButton(),
            );
          }
          User user = onlineUsers[index-1];
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: ProfileImageAvater(imageUrl: user.imageUrl,isOnline: true),
          );

          }),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(onPressed: ()=> print('Create Room'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      borderSide: BorderSide(
        width: 3.0,
        color: Colors.blueAccent[100],
      ),
      textColor: Palette.facebookBlue,
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 8.0,),
          Text('Create\nRoom')
        ],
      ),
    );
  }
}

