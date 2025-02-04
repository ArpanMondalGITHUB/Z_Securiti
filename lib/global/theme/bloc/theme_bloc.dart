import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:khanakhazana/global/theme/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(theme: Apptheme.amoledDarkTheme)) {
    on<ThemeChnaged>(_themeChanged);
  }

  void _themeChanged(ThemeChnaged event, Emitter<ThemeState> emit) {
    emit(state.copyWith(theme: event.theme));
  }
}
