import 'package:facebook/business_logic_layer/app_bloc/app_bloc.dart';
import 'package:facebook/business_logic_layer/app_bloc/app_events.dart';
import 'package:facebook/business_logic_layer/app_bloc/app_states.dart';
import 'package:facebook/presentation_layer/widgets/mobile_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../palette.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (BuildContext context) =>
          AppBloc()..add(GetStoriesEvent())..add(GetPostsEvent()),
      child: BlocConsumer<AppBloc, AppStates>(
        listener: (context, state) {
          // if (state is! InitialAppState) {
          //   Future.delayed(Duration(seconds: 7), () {});
          // }
        },
        builder: (context, state) {
          var bloc = AppBloc.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                'facebook',
                style: const TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2,
                ),
              ),
              centerTitle: false,
              actions: [
                CircleAvatar(
                  radius: 19,
                  backgroundColor: Colors.grey[200],
                  child: Image(
                    image: AssetImage('assets/images/search_icon.png'),
                    height: 21,
                    width: 21,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 19,
                  backgroundColor: Colors.grey[200],
                  child: Image(
                    image: AssetImage('assets/images/massenger_icon.png'),
                    height: 24,
                    width: 24,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
              bottom: TabBar(
                indicatorWeight: 2.5,
                physics: NeverScrollableScrollPhysics(),
                isScrollable: false,
                controller: _tabController,
                indicatorColor: Palette.facebookBlue,
                indicatorPadding: EdgeInsets.only(left: 8, right: 3),
                onTap: (index) {
                  bloc.add(ChangeTapsIndexEvent(index));
                },
                tabs: <Widget>[
                  Tab(
                    icon: Icon(
                      Icons.home,
                      color: bloc.tapsIndex != 0
                          ? Colors.black45
                          : Palette.facebookBlue,
                      size: 29,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.group_rounded,
                      color: bloc.tapsIndex != 1
                          ? Colors.black45
                          : Palette.facebookBlue,
                      size: 28,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.ondemand_video,
                      color: bloc.tapsIndex != 2
                          ? Colors.black45
                          : Palette.facebookBlue,
                      size: 26,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.view_compact,
                      color: bloc.tapsIndex != 3
                          ? Colors.black45
                          : Palette.facebookBlue,
                      size: 25,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      color: bloc.tapsIndex != 4
                          ? Colors.black45
                          : Palette.facebookBlue,
                      size: 26,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.view_headline_outlined,
                      color: bloc.tapsIndex != 5
                          ? Colors.black45
                          : Palette.facebookBlue,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey[300],
                    ),
                    Expanded(
                      child: SmartRefresher(
                        controller: refreshController,
                        physics: BouncingScrollPhysics(),
                        onRefresh: () {
                          bloc.add(GetPostsEvent());
                          refreshController.refreshCompleted();
                        },
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10, top: 10),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://scontent.fcai21-3.fna.fbcdn.net/v/t1.6435-9/223803416_265490708675366_1766659049128476267_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=Id1_NhWULQEAX8bEVY6&_nc_oc=AQnxRgLV1nt_eHSDxdNxCcIrywXTFdRHHT7U38XgWSJQYvnIciEHdh3Vml8vT_s567c&_nc_ht=scontent.fcai21-3.fna&oh=d3be909533c81d48d6ce03cfd3e01622&oe=61607C6E'),
                                      radius: 22,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            border: Border.all(
                                                color: Colors.grey.shade300)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          child: Text(
                                            'What\'s on your mind?',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 1,
                                width: double.infinity,
                                color: Colors.grey[300],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: AlignmentDirectional.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.switch_video,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Live',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 1,
                                      color: Colors.grey[300],
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: AlignmentDirectional.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.filter,
                                              color: Colors.green,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Photo',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 1,
                                      color: Colors.grey[300],
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: AlignmentDirectional.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.video_call_rounded,
                                              color: Colors.purple,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Room',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 10,
                                width: double.infinity,
                                color: Colors.grey[350],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 190,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        buildStory(bloc.stories[index]),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: 0,
                                        ),
                                    itemCount: bloc.stories.length),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 10,
                                width: double.infinity,
                                color: Colors.grey[300],
                              ),
                              SizedBox(
                                height: 10,
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
                                              buildPostItem(
                                                  context, bloc.posts[index]),
                                          separatorBuilder: (context, index) =>
                                              Container(
                                                height: 10,
                                                width: double.infinity,
                                                color: Colors.grey[300],
                                              ),
                                          itemCount: bloc.posts.length),
                                  fallbackBuilder: (context) => Shimmer(
                                      interval: Duration(seconds: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Colors.grey[300],
                                                  radius: 22,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  width: 120,
                                                  height: 12,
                                                  color: Colors.grey[300],
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(
                                              width: 250,
                                              height: 7,
                                              color: Colors.grey[300],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(
                                              width: 200,
                                              height: 7,
                                              color: Colors.grey[300],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(
                                              width: 250,
                                              height: 7,
                                              color: Colors.grey[300],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 300,
                                              color: Colors.grey[300],
                                            ),
                                          )
                                        ],
                                      ))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(child: Text('groups')),
                Center(child: Text('watch')),
                Center(child: Text('games')),
                Center(child: Text('notifications')),
                Center(child: Text('menu')),
              ],
            ),
          );
        },
      ),
    );
  }
}
