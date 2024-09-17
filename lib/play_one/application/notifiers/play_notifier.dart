import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/play_one/application/ui_state.dart';
import 'package:playground/play_one/application/view_model.dart';

final playViewModelNotifier =
    NotifierProvider<PlayViewModel, PlayUiStateModel>(() => PlayViewModel());
    // ValueNotifier<PlayViewModel>(PlayViewModel.initial());
