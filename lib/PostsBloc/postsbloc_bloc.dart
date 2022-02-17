import 'package:bloc/bloc.dart';
import 'package:bloc_test/Models/PostsModel.dart';
import 'package:equatable/equatable.dart';

part 'postsbloc_event.dart';
part 'postsbloc_state.dart';

class PostsblocBloc extends Bloc<PostsblocEvent, PostsblocState> {
  PostsblocBloc() : super(PostsblocLoading()) {
    on<LoadPostEvent>(_onLoadPosts);
    on<AddPostEvent>(_onAddPosts);
    on<LoadingPostEvent>(_onLoadingPosts);
  }
  void _onLoadPosts(LoadPostEvent event, Emitter<PostsblocState> emit) {
    emit(PostsblocLoaded(posts: event.posts));
  }

  void _onLoadingPosts(LoadingPostEvent event, Emitter<PostsblocState> emit) {
    emit(PostsblocLoading(isLoading: event.isLoading));
  }

  void _onAddPosts(AddPostEvent event, Emitter<PostsblocState> emit) {
    final state = this.state;
    if (state is PostsblocLoading) {
      emit(PostsblocLoaded(posts: event.posts));
    }
  }
}
