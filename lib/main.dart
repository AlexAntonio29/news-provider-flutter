import 'package:flutter/material.dart';
import 'package:news_provider/src/pages/pages.dart';
import 'package:news_provider/src/providers/providers.dart';
import 'package:news_provider/src/services/news_service.dart';
import 'package:news_provider/src/theme/global_themes.dart';
import 'package:provider/provider.dart';

void main() => 
runApp(MultiProvider(providers: [
  ChangeNotifierProvider(create: (_)=>ProviderItem()),
  ChangeNotifierProvider(create: (_)=>NewsService())
],
child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: GlobalThemes.globalThemeData,
      initialRoute: 'tab',
      routes: {
        'tab':(context) => TabPages()
      },

    );
  }
}