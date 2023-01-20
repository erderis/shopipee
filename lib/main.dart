import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/constants/fonts/fonts.dart';
import 'package:portfolio/core/homepage/cubit/dropdown_cubit.dart';
import 'package:portfolio/core/homepage/cubit/menu_drawer_cubit.dart';
import 'package:portfolio/core/homepage/cubit/navbar_cubit.dart';
import 'package:portfolio/core/homepage/cubit/switcher_cubit.dart';
import 'package:portfolio/core/homepage/views/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
