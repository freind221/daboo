import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kencan/domain/firebase_auth.dart';
import 'package:kencan/presentation/home.dart';
import 'package:kencan/presentation/light_splash_screen_loading_screen/light_splash_screen_loading_screen.dart';
import 'package:kencan/providers/profile_provider.dart';
import 'package:kencan/providers/user_provider.dart';
import 'package:kencan/theme/theme_constants.dart';
import 'package:kencan/theme/theme_manager.dart';
import 'package:kencan/translations/codegen_loader.g.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(EasyLocalization(
      supportedLocales: [Locale("en"), Locale("ar")],
      path: "assets/translations",
      assetLoader: CodegenLoader(),
      fallbackLocale: Locale('en'),
      child: MultiProvider(providers: [
        ChangeNotifierProvider(create: ((_) => UserProvide())),
        ChangeNotifierProvider(create: ((_) => ProfileProvider()))
      ], child: MyApp())));
}

ThemeManager themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
// TODO: implement initState

    themeManager.addListener(themeListener);

    super.initState();
  }

  @override
  void dispose() {
// TODO: implement dispose

    themeManager.removeListener(themeListener);

    super.dispose();
  }

  void themeListener() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      title: 'Kencan',
      home: StreamBuilder(
        stream: AuthMethod().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            LightSplashScreenLoadingScreen();
          }
          if (snapshot.hasData) {
            AuthMethod().setToProvider(context);
            return const Home();
          }
          return LightSplashScreenLoadingScreen();
        },
      ),
    );
  }
}
