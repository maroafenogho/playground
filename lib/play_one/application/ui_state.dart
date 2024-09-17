import 'package:playground/play_one/domain/play.dart';

final class PlayUiStateModel extends BaseUiStateModel<PlayUiStateModel> {
  @override
  final Exception error;
  @override
  final ViewState viewState;
  final Play play;

  PlayUiStateModel(
      {required this.play, required this.viewState, required this.error});

  @override
  PlayUiStateModel copyWith(
          {ViewState? viewState, Play? play, Exception? error}) =>
      PlayUiStateModel(
          viewState: viewState ?? this.viewState,
          play: play ?? this.play,
          error: error ?? this.error);
  PlayUiStateModel.initial()
      : this(
            play: Play.empty(),
            viewState: ViewState.idle,
            error: Exception(''));
}

enum ViewState {
  idle,
  loading,
  success,
  error;

  bool get isIdle => this == idle;
  bool get isError => this == error;
  bool get isScuccess => this == success;
  bool get isLooading => this == loading;
}

abstract base class BaseUiStateModel<T extends BaseUiStateModel<T>> {
  ViewState get viewState;
  Exception get error;

  T copyWith({ViewState? viewState, Play? play});
}
