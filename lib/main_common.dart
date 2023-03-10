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
import 'package:portfolio/features/category/presentation/cubit/update_params_cubit.dart';
import 'package:portfolio/utils/helpers/environtment.dart';
import 'package:portfolio/utils/helpers/injection_container.dart' as di;
import 'features/category/presentation/bloc/category_bloc.dart';
import 'features/overview/presentation/bloc/traffic_bloc.dart';
import 'firebase_options.dart';
import 'utils/helpers/injection_container.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  late Color primaryColor;
  switch (env) {
    case Environtment.dev:
      primaryColor = Colors.blue;
      break;
    case Environtment.prod:
      primaryColor = Colors.red;
      break;
  }

  runApp(ShopipeeApp(
    primaryColor: primaryColor,
  ));
}

class ShopipeeApp extends StatelessWidget {
  const ShopipeeApp({super.key, required this.primaryColor});
  final Color primaryColor;

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
            BlocProvider(
              create: (_) => UpdateParamsCubit(),
            ),
          ],
          child: const HomePage(),
        ));
  }
}
