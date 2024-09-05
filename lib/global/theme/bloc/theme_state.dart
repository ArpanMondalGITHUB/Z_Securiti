part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final Apptheme theme;
   ThemeState({
    required this.theme,
  });
  ThemeState copyWith( { Apptheme? theme}){
    return ThemeState(theme: theme ?? this.theme);
  }
  @override
  List<Object> get props => [theme];
}
