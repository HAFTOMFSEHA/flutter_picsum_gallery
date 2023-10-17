part of 'pics_bloc.dart';

class PicsEvent {}

class OnGetPhotos extends PicsEvent {
  final int i;

  OnGetPhotos(this.i);
}