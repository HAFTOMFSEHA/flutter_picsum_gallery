import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:picsum_photos/services/picsum_photos_service.dart';

import '../../models/pic_list_model.dart';

part 'pics_event.dart';
part 'pics_state.dart';

class PicsBloc extends Bloc<PicsEvent, PicsState> {
  PicsBloc() : super(PicsState(pics: [])) {
    on<OnGetPhotos>((event, emit) async {
      if (event.i == 1) {
        emit(state.copyWith(loading: true));
      }

      final Either<String, List<ListPicResponse>> pics =
          await PicsumService().getListOfImages(event.i);

      await pics.fold(
          (l) async => emit(state.copyWith(loading: false, error: l)),
          (r) async =>
              emit(state.copyWith(loading: false, pics: r, error: null)));
    });
  }
}
