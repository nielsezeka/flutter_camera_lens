import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lens/bloc/bloc_index.dart';
import 'package:flutter_lens/screens/view_index.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class TabbarMainView extends StatefulWidget {
  static const String tag = 'TabbarMainView';
  @override
  _TabbarMainViewState createState() => _TabbarMainViewState();
}

class _TabbarMainViewState extends State<TabbarMainView> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  final screenList = [ListOfManafacture(), ListOfBranch()];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[_selectedIndex], //ListOfManafacture(),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        backgroundColor: Theme.of(context).backgroundColor,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          GlobalBloc.acceptNewInfo(0);
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Typicons.th_large),
            title: Text('All lens'),
            activeColor: Theme.of(context).accentColor,
          ),
          FlashyTabBarItem(
            icon: Icon(Typicons.world),
            title: Text('Brand'),
            activeColor: Theme.of(context).accentColor,
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.highlight),
            title: Text('Highlights'),
            activeColor: Theme.of(context).accentColor,
          ),
          FlashyTabBarItem(
            icon: Icon(Typicons.spanner),
            title: Text('Settings'),
            activeColor: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
