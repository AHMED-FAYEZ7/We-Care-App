part of 'post_cubit.dart';

abstract class PostState {}

class PostInitial extends PostState {}

////////////////////////////////////////////

class GetAllBlogsLoadingState extends PostState {}

class GetAllBlogsSuccessState extends PostState {}

class GetAllBlogsFailureState extends PostState {}

////////////////////////////////////////////
class CreatePostLoadingState extends PostState {}

class CreatePostSuccessState extends PostState {}

class CreatePostFailureState extends PostState {}
////////////////////////////////////////////

class CreateLikeLoadingState extends PostState {}

class CreateLikeSuccessState extends PostState {}

class CreateLikeFailureState extends PostState {}
////////////////////////////////////////////

class CreateDisLikeLoadingState extends PostState {}

class CreateDisLikeSuccessState extends PostState {}

class CreateDisLikeFailureState extends PostState {}

////////////////////////////////////////////
class CreateCommentLoadingState extends PostState {}

class CreateCommentSuccessState extends PostState {}

class CreateCommentFailureState extends PostState {}

////////////////////////////////////////////

class GetAllLikesLoadingState extends PostState {}

class GetAllLikesSuccessState extends PostState {}

class GetAllLikesFailureState extends PostState {}

////////////////////////////////////////////

class GetAllCommentsLoadingState extends PostState {}

class GetAllCommentsSuccessState extends PostState {}

class GetAllCommentsFailureState extends PostState {}
