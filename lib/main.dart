import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khanakhazana/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:khanakhazana/features/auth/presentation/pages/login_page.dart';
import 'package:khanakhazana/features/map/presentation/bloc/current_location_bloc.dart';
import 'package:khanakhazana/features/map/presentation/pages/map_page.dart';
import 'package:khanakhazana/global/theme/theme.dart';
import 'package:khanakhazana/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AuthBlocBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<CurrentLocationBloc>(),
      ),

    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appthemeData[Apptheme.amoledDarkTheme],
      title: 'Z+',
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user == null) {
              return const LoginPage();
            } else {
              return const MapScreen();
            }
            
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
