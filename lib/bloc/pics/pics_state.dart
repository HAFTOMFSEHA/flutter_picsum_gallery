part of 'pics_bloc.dart';

class PicsState {
  final List<ListPicResponse> pics;
  final String? error;
  final bool loading;

  PicsState({required this.pics, this.error, this.loading = false});

  PicsState copyWith(
          {final bool? loading,
          final List<ListPicResponse>? pics,
          final String? error}) =>
      PicsState(
          loading: loading ?? this.loading,
          pics: [...?pics,...this.pics],
          error: error ?? this.error);
}
