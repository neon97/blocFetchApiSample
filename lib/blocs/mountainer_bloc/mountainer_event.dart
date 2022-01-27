import 'package:equatable/equatable.dart';

abstract class MountainersBlogEvent extends Equatable {
  const MountainersBlogEvent();

  @override
  List<Object> get props => [];
}

class GetMountainersList extends MountainersBlogEvent {}
