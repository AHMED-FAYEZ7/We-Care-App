import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/doctor/domain/model/blog_model.dart';
import 'package:health_care/doctor/domain/model/comments_likes_model.dart';
import 'package:health_care/doctor/domain/usecase/create_blog_use_case.dart';
import 'package:health_care/doctor/domain/usecase/create_comment_use_case.dart';
import 'package:health_care/doctor/domain/usecase/create_dislike_use_case.dart';
import 'package:health_care/doctor/domain/usecase/create_like_use_case.dart';
import 'package:health_care/doctor/domain/usecase/get_all_blogs_use_case.dart';
import 'package:health_care/doctor/domain/usecase/get_blogs_comments_use_case.dart';
import 'package:health_care/doctor/domain/usecase/get_blogs_likes_use_case.dart';
import 'package:health_care/doctor/domain/usecase/get_doctor_blogs_by_id.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  GetAllBlogsUseCase _getAllBlogsUseCase = sl<GetAllBlogsUseCase>();
  CreateBlogUseCase _createBlogUseCase = sl<CreateBlogUseCase>();
  CreateLikeUseCase _createLikeUseCase = sl<CreateLikeUseCase>();
  CreateDisLikeUseCase _createDisLikeUseCase = sl<CreateDisLikeUseCase>();
  GetBlogsLikesUseCase _getBlogsLikesUseCase = sl<GetBlogsLikesUseCase>();
  CreateCommentUseCase _createCommentUseCase = sl<CreateCommentUseCase>();
  GetBlogsCommentsUseCase _getBlogsCommentsUseCase =
  sl<GetBlogsCommentsUseCase>();
  GetDoctorBlogsById _getDoctorBlogsById = sl<GetDoctorBlogsById>();

  PostCubit(this._getAllBlogsUseCase,
      this._createBlogUseCase,
      this._createLikeUseCase,
      this._createDisLikeUseCase,
      this._createCommentUseCase,
      this._getBlogsCommentsUseCase,
      this._getBlogsLikesUseCase,
      this._getDoctorBlogsById,) : super(PostInitial());

  static PostCubit get(context) => BlocProvider.of(context);

  User? doctorData;

  /////////////get all blogs////////////////

  List<Blog> allBlogs = [];

  getAllBlogs(NoParameters params) async {
    emit(GetAllBlogsLoadingState());

    (await _getAllBlogsUseCase.call(params)).fold((l) {
      emit(GetAllBlogsFailureState());
    }, (r) {
      allBlogs = [];
      allBlogs = r.allBlogsData!;
      emit(GetAllBlogsSuccessState());
    });
  }

  /////////////get all blogs////////////////

  createPost(String title, String des, String imageUrl) async {
    emit(CreatePostLoadingState());

    (await _createBlogUseCase.call(CreateBlogUseCaseInput(
      postDescription: des,
      postTitle: title,
      postImage: imageUrl,
    )))
        .fold((l) {
      emit(CreatePostFailureState());
    }, (r) {
      emit(CreatePostSuccessState());
    });
  }

/////////////create like and disLike////////////////

  createLike(String blogId) async {
    emit(CreateLikeLoadingState());
    (await _createLikeUseCase.call(blogId)).fold(
          (l) {
        emit(CreateLikeFailureState());
      },
          (r) {
        emit(CreateLikeSuccessState());
      },
    );
  }

  /////////////create dislike////////////////

  createDisLike(String blogId) async {
    emit(CreateDisLikeLoadingState());
    (await _createDisLikeUseCase.call(blogId)).fold(
          (l) {
        emit(CreateDisLikeFailureState());
      },
          (r) {
        emit(CreateDisLikeSuccessState());
      },
    );
  }

  /////////////create comment////////////////

  createComment(String blogId, String comment) async {
    emit(CreateCommentLoadingState());
    (await _createCommentUseCase.call(CreateCommentUseCaseInput(
      blogId: blogId,
      commentContent: comment,
    )))
        .fold(
          (l) {
        emit(CreateCommentFailureState());
      },
          (r) {
        emit(CreateCommentSuccessState());
      },
    );
  }

  /////////////get post comments////////////////
  List<BaseComment> comments = [];

  getComments(String blogId) async {
    emit(GetAllCommentsLoadingState());
    (await _getBlogsCommentsUseCase.call(blogId)).fold(
          (l) {
        emit(GetAllCommentsFailureState());
      },
          (r) {
        comments = [];
        comments = r.blogComments!;
        emit(GetAllCommentsSuccessState());
      },
    );
  }

  /////////////get post likes////////////////
  List<BaseComment> likes = [];

  getLikes(String blogId) async {
    emit(GetAllLikesLoadingState());
    (await _getBlogsLikesUseCase.call(blogId)).fold(
          (l) {
        emit(GetAllLikesFailureState());
      },
          (r) {
        likes = [];
        likes = r.blogLikes!;
        emit(GetAllLikesSuccessState());
      },
    );
  }

  /////////////doctor posts////////////////

  List<Blog> doctorBlogs = [];

  getDoctorPosts(String doctorId) async {
    emit(GetDoctorPostsLoadingState());
    doctorBlogs = [];

    (await _getDoctorBlogsById.call(doctorId)).fold((l) {
      emit(GetDoctorPostsFailureState());
    }, (r) {
      doctorBlogs = r.allBlogsData!;
      emit(GetDoctorPostsSuccessState());
    });
  }
}
