import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/lang_provider.dart';
import 'package:movies_app/config/lang_shared_prefs.dart';
import 'package:movies_app/core/di/service_locator.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'config/theme_manager.dart';
import 'core/resources/routes_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LangSharedPrefs.init();
  configureDependencies();
  runApp(
    BlocProvider(
      create: (context) => serviceLocator.get<AuthCubit>(),
      child: ChangeNotifierProvider(
        create: (contex) => LangProvider(),
        child: MoviesApp(),
      ),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});
  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<LangProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManager.generateRoute,
          initialRoute: RoutesManager.login,
          theme: ThemeManager.light,
          darkTheme: ThemeManager.dark,
          themeMode: ThemeMode.dark,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: Locale(langProvider.currentLang),
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
