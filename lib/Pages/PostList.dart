import 'package:bloc_test/PostsBloc/postsbloc_bloc.dart';
import 'package:bloc_test/Services/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    context.read<PostsblocBloc>().add(LoadingPostEvent(isLoading: true));
    var posts = await ApiService.fetchPosts();
    context.read<PostsblocBloc>().add(AddPostEvent(posts: posts));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: BlocBuilder<PostsblocBloc, PostsblocState>(
        builder: (context, state) {
          if (state is PostsblocLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PostsblocLoaded) {
            return Container(
              child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final item = state.posts[index];
                  return ListTile(
                    title: Text(index.toString() + state.posts[index].title),
                    subtitle: Text(state.posts[index].body),
                  );
                },
              ),
            );
          } else {
            return const Text("Something went wrong!");
          }
        },
      ),
    );
  }
}
