import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key key,
    @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                SizedBox(height: 5.0,),
                Text(post.caption),
                post.imageUrl==null? SizedBox.shrink():SizedBox(height: 4.0,),
              ],
            ),
          ),
          post.imageUrl == null?SizedBox.shrink(): Container(
            child: CachedNetworkImage(
              imageUrl: post.imageUrl,
            ),
          ),
          SizedBox(height: 4.0,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostLike(post: post,),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileImageAvater(imageUrl: post.user.imageUrl),
        SizedBox(width: 10.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.user.name,style: TextStyle(fontWeight: FontWeight.w600),),
              Row(
                children: [
                  Text('${post.timeAgo} .',style: TextStyle(fontSize: 12.0,color: Colors.grey[600]),),
                  Icon(
                    Icons.public,
                    size: 12.0,
                    color: Colors.grey[600],

                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: ()=> print('more'))

      ],
    );
  }
}

class _PostLike extends StatelessWidget {
  final Post post;

  const _PostLike({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Palette.facebookBlue,
          ),
          child: Icon(
            Icons.thumb_up_alt,
            size: 10.0,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 4.0,),
        Expanded(
          child: Text('${post.likes}',style: TextStyle(
            color: Colors.grey[600],
          ),),
        ),
        Text('${post.comments} Comments',style: TextStyle(
          color: Colors.grey[600],
        ),),
        SizedBox(width: 8.0,),
        Text('${post.shares} Shares',style: TextStyle(
          color: Colors.grey[600],
        ),)
      ],
    );
  }
}


