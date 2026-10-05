import 'package:flutter/material.dart';
import 'package:news_provider/src/pages/pages.dart';
import 'package:news_provider/src/providers/providers.dart';
import 'package:news_provider/src/theme/global_themes.dart';
import 'package:provider/provider.dart';

class TabPages extends StatelessWidget {
  const TabPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _pages(), bottomNavigationBar: _navegacion());
  }
}

class _navegacion extends StatelessWidget {
  const _navegacion({super.key});

  @override
  Widget build(BuildContext context) {
    final providerItem = Provider.of<ProviderItem>(context);
    return BottomNavigationBar(
      selectedItemColor: GlobalThemes.primary,
      currentIndex: providerItem.itemSelected,
      onTap: (i) =>providerItem.itemSelected=i,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados'),
      ],
    );
  }
}

class _pages extends StatelessWidget {
  const _pages({super.key});

  @override
  Widget build(BuildContext context) {
    final providerItem = Provider.of<ProviderItem>(context);
    return PageView(
      controller: providerItem.pageController,
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),

      children: <Widget>[
        Tab1Pages(),
        Tab2Pages(),
        
      ],
    );
  }
}
