import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tmdb_app/app/core/constants/navigation_cubit.dart';
import 'package:tmdb_app/app/features/dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'TMDB Demo',
            theme: ThemeData(
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: Colors.white,
                    displayColor: Colors.white,
                  ),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: Colors.blueGrey,
                secondary: Color.fromARGB(2, 33, 2, 76),
              ),
              primaryColor: Colors.blueGrey,
              primarySwatch: Colors.blueGrey,
            ),
            home: Dashboard(),
          );
        },
      ),
    );
  }
}
