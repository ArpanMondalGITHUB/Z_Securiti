part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
  @override
  List<Object> get props => [];
}

class ThemeChnaged extends ThemeEvent {
  final Apptheme theme;
  const ThemeChnaged({
    required this.theme,
  });

  @override
List<Object> get props => [theme];
}
