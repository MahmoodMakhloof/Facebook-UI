import 'package:flutter/foundation.dart';

@immutable
abstract class AppEvents {
  const AppEvents();
}

class GetPostsEvent extends AppEvents {}

class GetStoriesEvent extends AppEvents {}

class GetRoomsEvent extends AppEvents {}

class GetChatsEvent extends AppEvents {}

class ChangeTapsIndexEvent extends AppEvents {
  final int index;

  ChangeTapsIndexEvent(this.index);
}
