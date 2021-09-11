import 'package:bloc/bloc.dart';
import 'package:facebook/business_logic_layer/app_bloc/app_events.dart';
import 'package:facebook/data_layer/models/chatmodel.dart';
import 'package:facebook/data_layer/models/postmodel.dart';
import 'package:facebook/data_layer/models/roommodel.dart';
import 'package:facebook/data_layer/models/storymodel.dart';
import 'package:facebook/data_layer/repository/chats.dart';
import 'package:facebook/data_layer/repository/posts.dart';
import 'package:facebook/data_layer/repository/rooms.dart';
import 'package:facebook/data_layer/repository/stories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_states.dart';

class AppBloc extends Bloc<AppEvents, AppStates> {
  AppBloc() : super(InitialAppState());
  static AppBloc get(context) => BlocProvider.of(context);

  @override
  Stream<AppStates> mapEventToState(AppEvents event) async* {
    if (event is GetPostsEvent) {
      yield* getPosts();
    }
    if (event is GetStoriesEvent) {
      yield* getStories();
    }
    if (event is GetRoomsEvent) {
      yield* getRooms();
    }
    if (event is GetChatsEvent) {
      yield* getChats();
    }
    if(event is ChangeTapsIndexEvent)
      {
        yield* changeTapsIndex(event.index);
      }
  }

  List<PostModel> posts = [];
  Stream<AppStates> getPosts() async* {
    this.posts = [];
    yield GetPostsLoadingState();
    await Future.delayed(Duration(seconds: 2));
    try {
      Posts.posts.forEach((element) {
        this.posts.add(element);
      });
      yield GetPostsSuccessState();
    } catch (error) {
      yield GetPostsErrorState();
    }
  }

  List<StoryModel> stories = [];
  Stream<AppStates> getStories() async* {
    this.stories = [];
    yield GetStoriesLoadingState();
    try {
      Stories.stories.forEach((element) {
        this.stories.add(element);
      });
      yield GetStoriesSuccessState();
    } catch (error) {
      yield GetStoriesErrorState();
    }
  }

  List<RoomModel> rooms = [];
  Stream<AppStates> getRooms() async* {
    this.rooms = [];
    yield GetRoomsLoadingState();
    try {
      Rooms.rooms.forEach((element) {
        this.rooms.add(element);
      });
      yield GetRoomsSuccessState();
    } catch (error) {
      yield GetRoomsErrorState();
    }
  }

  List<ChatModel> chats = [];
  Stream<AppStates> getChats() async* {
    this.chats = [];
    yield GetChatsLoadingState();

    try {
      Chats.chats.forEach((element) {
        this.chats.add(element);
      });
      yield GetChatsSuccessState();
    } catch (error) {
      yield GetChatsErrorState();
    }
  }

  int tapsIndex = 0;
  Stream<AppStates> changeTapsIndex(int index) async* {
    tapsIndex = index;
      yield ChangeTapsIndexState();
  }
}
