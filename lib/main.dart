import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/auth/presentation/views/sign_in.dart';
import 'package:todo_app/features/auth/presentation/views/sign_up.dart';
import 'package:todo_app/features/home/presentation/views/edit_note_screen.dart';
import 'package:todo_app/features/home/presentation/views/home_screen.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/providers/app_config_provider.dart';
import 'package:todo_app/theme/my_theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.enableNetwork();
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider()
        ..getTheme()
        ..getLanguage(),
      child: const MyApp()));

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      initialRoute: provider.firebaseUser != null
          ? HomeScreen.routeName
          : SignInView.routeName,
      themeMode: provider.mode,
      darkTheme: MyThemeData.darkTheme,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        SignInView.routeName: (context) => const SignInView(),
        SignUpView.routeName: (context) => const SignUpView(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        EditNoteScreen.routeName: (context) => const EditNoteScreen(),
      },
    );
  }
}
