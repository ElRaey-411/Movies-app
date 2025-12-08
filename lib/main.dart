import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_app/core/di/service_locator.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies_app/features/movies/presentation/main_layout/tabs/profile_tab/presentation/cubit/profile_cubit.dart';
import 'package:provider/provider.dart';
import 'config/theme_manager.dart';
import 'core/resources/routes_manager.dart';
import 'features/auth/data/data_sources/local/auth_shared_prefs_local_data_source.dart';
import 'features/auth/presentation/provider/auth_provider.dart';
import 'features/movies/presentation/main_layout/tabs/profile_tab/data/models/movie_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  await Hive.initFlutter();
  Hive.registerAdapter(MovieHiveAdapter());
  await Hive.openBox<MovieHive>('historyBox');

  final authLocalDataSource = AuthSharedPrefsLocalDataSource();
  String? token;
  try {
    token = await authLocalDataSource.getToken();
  } catch (e) {
    token = null;
  }

  runApp(
    MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        BlocProvider(create: (_) => serviceLocator.get<AuthCubit>()),
        BlocProvider(create: (_) => serviceLocator.get<ProfileCubit>()),
      ],
      child: MoviesApp(token: token),
    ),
  );
}

class MoviesApp extends StatelessWidget {
  final String? token;
  const MoviesApp({super.key, required this.token});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.generateRoute,
        initialRoute: RoutesManager.splashScreen,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
