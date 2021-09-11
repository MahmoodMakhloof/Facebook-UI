import 'package:flutter/foundation.dart';

@immutable
abstract class AppStates {
  const AppStates();
}

class InitialAppState extends AppStates {}

class GetPostsLoadingState extends AppStates {}

class GetPostsSuccessState extends AppStates {}

class GetPostsErrorState extends AppStates {}

class GetStoriesLoadingState extends AppStates {}

class GetStoriesSuccessState extends AppStates {}

class GetStoriesErrorState extends AppStates {}

class GetRoomsLoadingState extends AppStates {}

class GetRoomsSuccessState extends AppStates {}

class GetRoomsErrorState extends AppStates {}

class GetChatsLoadingState extends AppStates {}

class GetChatsSuccessState extends AppStates {}

class GetChatsErrorState extends AppStates {}

class ChangeTapsIndexState extends AppStates {}
