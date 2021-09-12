import 'package:carousel_slider/carousel_slider.dart';
import 'package:facebook/data_layer/models/postmodel.dart';
import 'package:facebook/data_layer/models/roommodel.dart';
import 'package:facebook/data_layer/models/storymodel.dart';
import 'package:facebook/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

Widget buildRoom(RoomModel model) => Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5),
      child: CircleAvatar(
        backgroundImage: NetworkImage(model.image),
        radius: 17,
      ),
    );

Widget buildStory(StoryModel model) => Padding(
      padding: const EdgeInsets.only(left: 7),
      child: Container(
        width: 98,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Container(
              height: 190,
              width: 98,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(model.image),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 70,
                child: Text(
                  model.text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: CircleAvatar(
                  backgroundColor: Palette.facebookBlue,
                  radius: 20,
                  child: CircleAvatar(
                    radius: 17,
                    backgroundImage: NetworkImage('${model.profileImage}'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget buildPostItem(context, PostModel model) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,top: 5,right: 15),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(model.profileImage),
                radius: 22,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Text(
                        '${model.time.toString()}h',
                        style: TextStyle(fontWeight: FontWeight.w300,fontSize: 11),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.public,
                        size: 14,
                        color: Colors.grey,
                      )
                    ],
                  )
                ],
              ),
              Spacer(),
              Icon(
                Icons.more_horiz_outlined,
                size: 20,
                color: Colors.blueGrey,
              )
            ],
          ),
        ),
        if (model.text != '')
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10,top: 10,bottom: 10),
            child: Text(model.text,style: TextStyle( color: Colors.black.withOpacity(0.8),),textAlign: TextAlign.start,),
          ),
        // SizedBox(
        //   height: 10,
        // ),
        if (model.images.length != 0)
          Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 10),
            child: CarouselSlider(
              options: CarouselOptions(
                  height: 300,
                  initialPage: 0,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal),
              items: model.images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image(
                      image: NetworkImage(i),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    );
                  },
                );
              }).toList(),
            ),
          ),

        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            children: [
              CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 9,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 12,
                  )),
              SizedBox(
                width: 5,
              ),
              Text(
                model.like.toString(),
                style: Theme.of(context).textTheme.caption,
              ),
              Spacer(),
              Text(
                '${model.comments.toString()} Comments',
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ),
        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.black.withOpacity(0.6),
                      size: 20,
                    )),
                Expanded(
                    child: Text(
                  'Like',style: TextStyle(color: Colors.black.withOpacity(0.6),),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
              ],
            )),
            Expanded(
                child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mode_comment_outlined,
                      color: Colors.black.withOpacity(0.6),
                      size: 20,
                    )),
                Expanded(
                    child: Text('Comment', style: TextStyle(color: Colors.black.withOpacity(0.6),),
                        overflow: TextOverflow.ellipsis, maxLines: 1))
              ],
            )),
            Expanded(
                child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share_outlined,
                      color: Colors.black.withOpacity(0.6),
                      size: 20,
                    )),
                Expanded(
                    child: Text('Share',style: TextStyle(color: Colors.black.withOpacity(0.6),),
                        overflow: TextOverflow.ellipsis, maxLines: 1))
              ],
            )),
          ],
        ),
      ],
    );
