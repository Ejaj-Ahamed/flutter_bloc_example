part of 'postsbloc_bloc.dart';

abstract class PostsblocState extends Equatable {
  const PostsblocState();

  @override
  List<Object> get props => [];
}

class PostsblocLoading extends PostsblocState {
  final bool isLoading;
  const PostsblocLoading({this.isLoading = true});
}

class PostsblocLoaded extends PostsblocState {
  final List<PostsModel> posts;
  final bool isLoading;
  const PostsblocLoaded(
      {this.posts = const <PostsModel>[], this.isLoading = false});
  @override
  List<Object> get props => [posts, isLoading];
}
