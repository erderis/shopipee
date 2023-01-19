import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/constants/fonts/fonts.dart';
import 'package:portfolio/modules/homepage/cubit/dropdown_cubit.dart';
import 'package:portfolio/modules/homepage/cubit/menu_drawer_cubit.dart';
import 'package:portfolio/modules/homepage/cubit/navbar_cubit.dart';
import 'package:portfolio/modules/homepage/cubit/switcher_cubit.dart';
import 'package:portfolio/modules/homepage/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shopipee Admin Panel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
              bodyText1:
                  TextStyle(fontFamily: AppFontStyle.poppins, fontSize: 16),
            )),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => SwitcherCubit(),
            ),
            BlocProvider(
              create: (_) => DropdownCubit(),
            ),
            BlocProvider(
              create: (_) => NavbarCubit(),
            ),
            BlocProvider(
              create: (_) => MenuDrawerCubit(),
            ),
          ],
          child: const HomePage(),
        ));
  }
}
