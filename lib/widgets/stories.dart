import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class Stories extends StatelessWidget {

  final User user;
  final List<Story> userStories;
  final bool isAddStory;

  const Stories({Key key,
    this.user,
    this.userStories,
    this.isAddStory = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 8.0),
          scrollDirection: Axis.horizontal,
          itemCount: userStories.length+1,
          itemBuilder: (BuildContext context,index){
          if(index == 0){
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(user: user,isAddStory: true,),
            );
          }
          Story story = userStories[index-1];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(user: user,story: story),
          );

      }),
    );
  }
}


class _StoryCard extends StatelessWidget {
  final User user;
  final Story story;
  final bool isAddStory;

  const _StoryCard({Key key,
    this.user,
    this.story,
    this.isAddStory = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),

          child: CachedNetworkImage(
            imageUrl: isAddStory?user.imageUrl:story.imageUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Positioned(
          top: 8.0,
            left: 8.0,
            child: isAddStory?Container
              (width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.add),
                onPressed: ()=> print('pressed'),
                iconSize: 30,
                color: Palette.facebookBlue,

          ),
        ): ProfileImageAvater(
              imageUrl: story.user.imageUrl,isStory: story.isViewed,
            )
        ),
        Positioned(
          bottom: 8.0,
            right: 8.0,
            left: 8.0,
            child: Text(
          isAddStory?'Add Story':story.user.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
              overflow: TextOverflow.ellipsis,

        ))
      ],
    );
  }
}
