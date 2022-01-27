import 'package:equatable/equatable.dart';
import 'package:ftips_bloc_fetch_api/models/MountainerModel/mountainers_model.dart';

abstract class MountainerBlogState extends Equatable {
  const MountainerBlogState();

  @override
  List<Object?> get props => [];
}

class MountainersInitial extends MountainerBlogState {}

class MountainersLoading extends MountainerBlogState {}

class MountainersLoaded extends MountainerBlogState {
  final MountainersModel mountainersModel;
  const MountainersLoaded(this.mountainersModel);
}

class MountainersError extends MountainerBlogState {
  final String? message;
  const MountainersError(this.message);
}
