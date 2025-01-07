import 'package:base/app/bloc/settings_cubit.dart';
import 'package:base/configurations/app_states.dart';
import 'package:base/configurations/app_theme.dart';
import 'package:base/handlers/security/AESEncryptor.dart';
import 'package:base/handlers/security/AESEncryptor.dart';
import 'package:base/navigation/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/home/ui/screens/home_screen.dart';
import 'firebase_options.dart';
import 'navigation/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AESEncryptor.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit.instance,
      child: BlocBuilder<SettingsCubit, AppStates>(
        builder: (context, state) {
          return MaterialApp(
            theme:
                SettingsCubit.instance.isDarkMode ? ThemeData.dark() : stcTheme,
            locale: SettingsCubit.instance.locale,
            onGenerateRoute: generateRoute,
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            localizationsDelegates: [
              // AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
