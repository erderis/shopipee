import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/constants/fonts/fonts.dart';
import 'package:portfolio/core/homepage/cubit/dropdown_cubit.dart';
import 'package:portfolio/core/homepage/cubit/menu_drawer_cubit.dart';
import 'package:portfolio/core/homepage/cubit/navbar_cubit.dart';
import 'package:portfolio/core/homepage/cubit/switcher_cubit.dart';
import 'package:portfolio/core/homepage/views/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio/features/category/presentation/cubit/category_image_picker_cubit.dart';
import 'package:portfolio/features/category/presentation/cubit/image_validator_cubit.dart';
import 'package:portfolio/utils/helpers/injection_container.dart' as di;
import 'features/category/presentation/bloc/category_bloc.dart';
import 'features/overview/presentation/bloc/traffic_bloc.dart';
import 'firebase_options.dart';
import 'utils/helpers/injection_container.dart';

void main() async {
  await di.init();
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
            BlocProvider(
                create: (_) => sl<TrafficBloc>()..add(GetTrafficEvent())),
            BlocProvider(
                create: (_) => sl<CategoryBloc>()..add(GetCategoryEvent())),
            BlocProvider(
              create: (_) => CategoryImagePickerCubit(),
            ),
            BlocProvider(
              create: (_) => ImageValidatorCubit(),
            ),
          ],
          child: const HomePage(),
        ));
  }
}
