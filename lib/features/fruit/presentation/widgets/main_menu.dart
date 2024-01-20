import 'package:flutter/material.dart';
import 'package:flutter_bloc_tugas2/features/fruit/presentation/pages/fruit_list_page.dart';
import 'package:flutter_bloc_tugas2/features/fruit/presentation/shared/themes.dart';

import '../pages/grid_screen_page.dart';
import '../pages/list_screen_page.dart';
import '../pages/profile_page.dart';
import '../pages/datetime_picker_page.dart';

enum _SelectedTab { tab1, tab2, tab3, tab4, tab5 }

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final List<Widget> _tabWidgets = [
    const FruitListPage(),
    const DateTimePickerPage(),
    const GridScreenPage(),
    const ListScreenPage(),
    const ProfilePage(),
  ];

  int _selectedIndex = 0;
  String _appBarTitle = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: kBlackColor,
        leading: Icon(
          Icons.menu,
          color: kWhiteColor,
        ),
        title: Text(
          _appBarTitle,
          style: TextStyle(color: kWhiteColor).copyWith(fontWeight: bold,),
        ),
        centerTitle: true,
      ),
      body: _tabWidgets[_selectedIndex],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _handleIndexChanged,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              color: kBlackColor,
            ),
            label: 'fruits',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.date_range_rounded,
                color: kBlackColor,
              ),
              label: 'datetime'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.grid_4x4_rounded,
                color: kBlackColor,
              ),
              label: 'grid'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt_rounded,
                color: kBlackColor,
              ),
              label: 'list'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_rounded,
                color: kBlackColor,
              ),
              label: 'profile'),
        ],
      ),
    );
  }

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (_SelectedTab.values[index]) {
      case _SelectedTab.tab1:
        updateAppBarTitle("Fruits");
        break;
      case _SelectedTab.tab2:
        updateAppBarTitle("DateTime Picker");
        break;
      case _SelectedTab.tab3:
        updateAppBarTitle("Grid View");
        break;
      case _SelectedTab.tab4:
        updateAppBarTitle("List View");
        break;
      case _SelectedTab.tab5:
        updateAppBarTitle("Profile");
        break;
    }
  }

  void updateAppBarTitle(String title) {
    setState(() {
      _appBarTitle = title;
    });
  }
}
