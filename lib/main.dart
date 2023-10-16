import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsflutter/features/presentation/bloc/article/remote/article_remote_bloc.dart';
import 'package:newsflutter/features/presentation/bloc/article/remote/article_remote_event.dart';
import 'package:newsflutter/features/presentation/pages/home/daily_news.dart';
import 'package:newsflutter/injection_container.dart';

import 'config/routes/routes.dart';
import 'config/theme/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalizeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => s1()..add(GetArticles()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const DailyNews()),
    );
  }
}
