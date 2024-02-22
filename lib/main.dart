import 'package:flutter/material.dart';
import 'theme/colors/colors.dart';
import 'new_meme_page.dart';
import 'info_page.dart';



void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
        useMaterial3: false,
        fontFamily: 'Comic Sans MS',
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedBottomBarItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedItemPage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.mainColor,
        selectedItemColor: AppColors.mainWhite,
        unselectedItemColor: AppColors.mainWhite.withOpacity(0.3),
        currentIndex: _selectedBottomBarItem,
        iconSize: 36,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: "New meme",
            activeIcon: Icon(Icons.add_box),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: "Info",
            activeIcon: Icon(Icons.info),
          )
        ],
        onTap: (selectedIndex) => {
          setState(() {
            _selectedBottomBarItem = selectedIndex;
          })
        },
      ),
    );
  }

  Widget _selectedItemPage() {
    switch (_selectedBottomBarItem) {
      case 0:
        return const NewMemePage();
      case 1:
        return const InfoPage();
    }
    return const Placeholder();
  }
}
