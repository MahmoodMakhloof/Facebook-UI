import 'package:facebook/business_logic_layer/app_bloc/app_bloc.dart';
import 'package:facebook/business_logic_layer/app_bloc/app_states.dart';
import 'package:facebook/data_layer/models/chatmodel.dart';
import 'package:facebook/data_layer/models/storymodel.dart';
import 'package:facebook/presentation_layer/widgets/web_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FacebookWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppBloc()..getPosts()..getRooms()..getChats()..getStories(),
      child: BlocConsumer<AppBloc, AppStates>(
        listener: (context, state) {
          if (state is! InitialAppState) {
            Future.delayed(Duration(seconds: 2), () {});
          }
        },
        builder: (context, state) {
          var bloc = AppBloc.get(context);
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.grey[300],
                                        child: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        )),
                                  ),
                                  Expanded(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.grey[300],
                                        child: Icon(
                                          Icons.notifications,
                                          color: Colors.black,
                                        )),
                                  ),
                                  Expanded(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.grey[300],
                                        child: Icon(
                                          Icons.messenger_outline,
                                          color: Colors.black,
                                        )),
                                  ),
                                  Expanded(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.grey[300],
                                        child: Icon(
                                          Icons.apps_sharp,
                                          color: Colors.black,
                                        )),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          'Abdullah',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        Expanded(
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                'https://static.remove.bg/remove-bg-web/97e23b9bea3ef10227bf2e0bed160d3a30f93253/assets/start-0e837dcc57769db2306d8d659f53555feb500b3c5d456879b9c843d1872e7baa.jpg'),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Icon(
                                      Icons.shopping_bag_outlined,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Expanded(
                                    child: Icon(
                                      Icons.dashboard,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Expanded(
                                    child: Icon(
                                      Icons.supervised_user_circle,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Expanded(
                                    child: Icon(
                                      Icons.video_settings_rounded,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Expanded(
                                    child: Icon(
                                      Icons.home,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              'Search Facebook',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                            Icon(
                                              Icons.search,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.facebook,
                                    color: Colors.blue,
                                    size: 50,
                                  )
                                ],
                              ),
                            )
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
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Text(
                                    'Contacts',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Expanded(child: Icon(Icons.more)),
                                        Expanded(child: Icon(Icons.search)),
                                        Expanded(
                                            child: Icon(
                                                Icons.video_settings_rounded))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: ListView.separated(
                                    itemBuilder: (context, index) =>
                                        buildChatItem(bloc.chats[index]),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 5,
                                        ),
                                    itemCount: bloc.chats.length),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: SingleChildScrollView(
                              child: Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 200,
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
                                    Card(
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
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg45jUi84SYeCf4uNAaprS7aoKzS8AohaLwQ&usqp=CAU'),
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
                                                        Icons.live_tv_sharp,
                                                        color: Colors.red,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text('Live')
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
                                                        Icons.photo,
                                                        color: Colors.green,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text('Photo')
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
                                                        Icons
                                                            .video_call_rounded,
                                                        color: Colors.purple,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text('Live')
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Card(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Container(
                                          height: 60,
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
                                                                      10)),
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
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    height: 60,
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
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            buildPostItem(
                                                context, bloc.posts[index]),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                              height: 5,
                                            ),
                                        itemCount: bloc.posts.length)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child: Column(
                        //     children: [
                        //       Expanded(
                        //         child: Column(
                        //           children: [
                        //             Expanded(
                        //                 child: buildRightSide(bloc.rights[0])),
                        //             Expanded(
                        //                 child: buildRightSide(bloc.rights[1])),
                        //             Expanded(
                        //                 child: buildRightSide(bloc.rights[2])),
                        //             Expanded(
                        //                 child: buildRightSide(bloc.rights[3])),
                        //             Expanded(
                        //                 child: buildRightSide(bloc.rights[4])),
                        //             Expanded(
                        //                 child: buildRightSide(bloc.rights[5])),
                        //           ],
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         height: 10,
                        //       ),
                        //       Container(
                        //         height: 1,
                        //         color: Colors.grey[300],
                        //         width: double.infinity,
                        //       ),
                        //       SizedBox(
                        //         height: 10,
                        //       ),
                        //       // Expanded(
                        //       //     child: Column(
                        //       //   crossAxisAlignment: CrossAxisAlignment.start,
                        //       //   children: [
                        //       //     Expanded(
                        //       //         child: buildRightSide(bloc.rights[6])),
                        //       //     Expanded(
                        //       //         child: buildRightSide(bloc.rights[7])),
                        //       //     Expanded(
                        //       //         child: buildRightSide(bloc.rights[8])),
                        //       //     Expanded(
                        //       //         child: buildRightSide(bloc.rights[9])),
                        //       //     Expanded(
                        //       //         child: buildRightSide(bloc.rights[10])),
                        //       //     Expanded(
                        //       //         child: buildRightSide(bloc.rights[11])),
                        //       //     Expanded(
                        //       //         child: Padding(
                        //       //       padding: const EdgeInsets.all(10.0),
                        //       //       child: Text(
                        //       //         'الخصوصيه.الشروط.الاعلانات . ملف تعريف الارتباط.المزيد.حقوق.النشر محفوظه @facebook 2021',
                        //       //         style: TextStyle(color: Colors.grey),
                        //       //       ),
                        //       //     ))
                        //       //   ],
                        //       // )),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildChatItem(ChatModel model) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: CircleAvatar(
              backgroundImage: NetworkImage(model.image),
            ),
          ),
          Expanded(
              flex: 2,
              child: Text(
                model.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ))
        ],
      );

  Widget buildStory(StoryModel model) => Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Container(
          width: 100,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: 200,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(model.image),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
              )
            ],
          ),
        ),
      );
}
