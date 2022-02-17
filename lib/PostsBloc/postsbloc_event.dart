part of 'postsbloc_bloc.dart';

abstract class PostsblocEvent extends Equatable {
  const PostsblocEvent();

  @override
  List<Object> get props => [];
}

class LoadingPostEvent extends PostsblocEvent {
  bool isLoading;
  LoadingPostEvent({this.isLoading = true});
}

class LoadPostEvent extends PostsblocEvent {
  List<PostsModel> posts;
  LoadPostEvent({this.posts = const <PostsModel>[]});
}

class AddPostEvent extends PostsblocEvent {
  List<PostsModel> posts;
  AddPostEvent({this.posts = const <PostsModel>[]});
}
