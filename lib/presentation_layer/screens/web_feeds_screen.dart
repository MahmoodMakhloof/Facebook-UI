import 'package:facebook/business_logic_layer/app_bloc/app_bloc.dart';
import 'package:facebook/business_logic_layer/app_bloc/app_events.dart';
import 'package:facebook/business_logic_layer/app_bloc/app_states.dart';
import 'package:facebook/presentation_layer/widgets/web_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';


import '../../palette.dart';

class FacebookWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppBloc()
        ..add(GetPostsEvent())
        ..add(GetStoriesEvent())
        ..add(GetRoomsEvent())
        ..add(GetChatsEvent()),
      child: BlocConsumer<AppBloc, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = AppBloc.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.grey[200],
              body: Column(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.facebook,
                                          color: Palette.facebookBlue,
                                          size: 60,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      MediaQuery.of(context).size.width >= 1000
                                          ? Container(
                                              height: 45,
                                              width: 250,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.search,
                                                      color: Colors.black54,
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      'Search facebook',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.black54),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Icon(
                                                  Icons.search,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                  // width: 360,
                                ),
                              ),
                              if (MediaQuery.of(context).size.width >= 1000)
                                Expanded(
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Expanded(
                                        child: Icon(
                                          Icons.home,
                                          color: Palette.facebookBlue,
                                          size: 35,
                                        ),
                                      ),
                                      Expanded(
                                        child: Icon(
                                          Icons.supervised_user_circle,
                                          color: Colors.grey,
                                          size: 35,
                                        ),
                                      ),
                                      Expanded(
                                        child: Icon(
                                          Icons.flag_outlined,
                                          color: Colors.grey,
                                          size: 35,
                                        ),
                                      ),
                                      Expanded(
                                        child: Icon(
                                          Icons.ondemand_video,
                                          color: Colors.grey,
                                          size: 35,
                                        ),
                                      ),
                                      Expanded(
                                        child: Icon(
                                          Icons.view_compact,
                                          color: Colors.grey,
                                          size: 35,
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              // Spacer(),
                              Expanded(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (MediaQuery.of(context).size.width >=
                                          1350)
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                'https://scontent.fcai21-3.fna.fbcdn.net/v/t1.6435-9/223803416_265490708675366_1766659049128476267_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=Id1_NhWULQEAX_5FKYx&_nc_oc=AQm40-APJidIBy82d-1vcoLIkP3LzXrwgHoQOAMWLG0h_GJYl4Y5NyC0NckxraXuaW8&_nc_ht=scontent.fcai21-3.fna&oh=d51daabe193d05d37691e94b2d624b9b&oe=616470EE',
                                              ),
                                              radius: 16,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Mahmoud',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      CircleAvatar(
                                          backgroundColor: Colors.grey[300],
                                          child: Icon(
                                            Icons.apps_sharp,
                                            color: Colors.black,
                                          )),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      CircleAvatar(
                                          backgroundColor: Colors.grey[300],
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/massenger_icon.png'),
                                            ),
                                          )),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      CircleAvatar(
                                          backgroundColor: Colors.grey[300],
                                          child: Icon(
                                            Icons.notifications,
                                            color: Colors.black,
                                          )),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      CircleAvatar(
                                          backgroundColor: Colors.grey[300],
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                            size: 35,
                                          )),
                                      SizedBox(
                                        width: 8,
                                      ),
                                    ],
                                  ),
                                  // width: 360
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (MediaQuery.of(context).size.width >= 800)
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ListTile(
                                        title: Text(
                                          'Mahmoud Abbas Makhlouf',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        leading: CircleAvatar(
                                          radius: 20,
                                          backgroundImage: NetworkImage(
                                              'https://scontent.fcai21-3.fna.fbcdn.net/v/t1.6435-9/223803416_265490708675366_1766659049128476267_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=Id1_NhWULQEAX_5FKYx&_nc_oc=AQm40-APJidIBy82d-1vcoLIkP3LzXrwgHoQOAMWLG0h_GJYl4Y5NyC0NckxraXuaW8&_nc_ht=scontent.fcai21-3.fna&oh=d51daabe193d05d37691e94b2d624b9b&oe=616470EE'),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ListTile(
                                        title: Text(
                                          'Friends',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        leading: Icon(
                                          Icons.group_rounded,
                                          color: Colors.blueAccent,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ListTile(
                                        title: Text(
                                          'Marketplace',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        leading: Icon(
                                          Icons.add_business_sharp,
                                          color: Colors.blue,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ListTile(
                                        title: Text(
                                          'Saved',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        leading: Icon(
                                          Icons.save_outlined,
                                          color: Colors.deepPurpleAccent,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ListTile(
                                        title: Text(
                                          'Groups',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        leading: Icon(
                                          Icons.family_restroom_outlined,
                                          color: Colors.cyan,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ListTile(
                                        title: Text(
                                          'Ad Center',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        leading: Icon(
                                          Icons.addchart_sharp,
                                          color: Colors.indigoAccent,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ListTile(
                                        title: Text(
                                          'Ads Manager',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        leading: Icon(
                                          Icons.manage_accounts_rounded,
                                          color: Colors.cyan,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ListTile(
                                        title: Text(
                                          'Community Help',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        leading: Icon(
                                          Icons.flag_outlined,
                                          color: Colors.amber,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        Expanded(flex: 1, child: Container()),
                        Expanded(
                          flex: 6,
                          child: Container(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: 180,
                                    child: ListView.builder(
                                      itemBuilder: (context, index) =>
                                          buildStory(bloc.stories[index]),
                                      itemCount: bloc.stories.length,
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 25, left: 25, top: 10),
                                    child: Card(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      'https://scontent.fcai21-3.fna.fbcdn.net/v/t1.6435-9/223803416_265490708675366_1766659049128476267_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=Id1_NhWULQEAX_5FKYx&_nc_oc=AQm40-APJidIBy82d-1vcoLIkP3LzXrwgHoQOAMWLG0h_GJYl4Y5NyC0NckxraXuaW8&_nc_ht=scontent.fcai21-3.fna&oh=d51daabe193d05d37691e94b2d624b9b&oe=616470EE'),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey[200],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        border: Border.all(
                                                            color: Colors.grey
                                                                .shade200)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              right: 20,
                                                              top: 10,
                                                              bottom: 10),
                                                      child: Text(
                                                        'What\'s on your mind?',
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 1,
                                            width: double.infinity,
                                            color: Colors.grey[200],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .center,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.video_call,
                                                        color: Colors.red,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text('Live',style: TextStyle(color: Colors.black54),)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 15,
                                                width: 1,
                                                color: Colors.grey[300],
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .center,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.filter,
                                                        color: Colors.green,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text('Photo',style: TextStyle(color: Colors.black54))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 15,
                                                width: 1,
                                                color: Colors.grey[300],
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .center,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.face,
                                                        color: Colors.amber,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text('Feeling',style: TextStyle(color: Colors.black54))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 25, left: 25, top: 10),
                                    child: Card(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Container(
                                          height: 60,
                                          width: double.infinity,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            physics: BouncingScrollPhysics(),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                      height: 35,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .lightBlue[50],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10),),
                                                      child: MaterialButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            'Create Room',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.blue,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ))),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Container(
                                                    height: 80,
                                                    child: ListView.separated(
                                                      separatorBuilder:
                                                          (context, index) =>
                                                              SizedBox(
                                                        width: 5,
                                                      ),
                                                      itemBuilder: (context,
                                                              index) =>
                                                          buildRoom(bloc
                                                              .rooms[index]),
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      shrinkWrap: true,
                                                      itemCount:
                                                          bloc.rooms.length,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Conditional.single(
                                      context: context,
                                      conditionBuilder: (context) =>
                                          bloc.posts.length != 0,
                                      widgetBuilder: (context) =>
                                          ListView.separated(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) =>
                                                  buildPostItem(context,
                                                      bloc.posts[index]),
                                              separatorBuilder:
                                                  (context, index) => SizedBox(
                                                        height: 0,
                                                      ),
                                              itemCount: bloc.posts.length),
                                      fallbackBuilder: (context) => Padding(
                                            padding: const EdgeInsets.all(25.0),
                                            child: shimmerBuilder(),
                                          ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(flex: 1, child: Container()),
                        if (MediaQuery.of(context).size.width >= 1200)
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Text(
                                          'Contacts',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black54),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        Spacer(),
                                        Icon(Icons.video_call_outlined,
                                            color: Colors.black54, size: 25),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.search,
                                            color: Colors.black54, size: 25),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.more_horiz,
                                          color: Colors.black54,
                                          size: 25,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Expanded(
                                      child: ListView.separated(
                                          itemBuilder: (context, index) =>
                                              buildChatItem(bloc.chats[index]),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                                height: 12,
                                              ),
                                          itemCount: bloc.chats.length),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
