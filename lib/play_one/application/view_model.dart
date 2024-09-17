import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/play_one/application/ui_state.dart';

class PlayViewModel extends Notifier<PlayUiStateModel> {
  @override
  PlayUiStateModel build() {
    return PlayUiStateModel.initial();
  }

  void startLoading() {
    state = state.copyWith(viewState: ViewState.loading);
  }

  void setIdle() {
    state = state.copyWith(viewState: ViewState.idle);
  }

  void showError() {
    state = state.copyWith(viewState: ViewState.error);
  }

  void incrementCounter() {
    state = state.copyWith(
        play: state.play.copyWith(counter: state.play.counter + 1));

    print(state.play.counter);
  }

  void decrement() {
    state = state.copyWith(
        play: state.play.copyWith(counter: state.play.counter - 1));
  }

  void showSuccess() {
    state = state.copyWith(viewState: ViewState.success);
  }

  void changeData(String input) async {
    state = state.copyWith(viewState: ViewState.loading);
    await Future.delayed(const Duration(seconds: 3));
    state = state.copyWith(play: state.play.copyWith(name: input, score: 78));
    state = state.copyWith(viewState: ViewState.success);
  }
}
