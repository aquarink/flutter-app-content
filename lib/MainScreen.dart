import 'package:flutter/material.dart';
import 'screen/Home.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Home(),
          Home(),
          Home(),
          Home(),
          Home(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 7),
            IconButton(
              icon: Icon(
                Icons.home,
                size: 24.0,
              ),
              color: _page == 0
                  ? Colors.limeAccent // warna icon ada menu bottom bar
                  : Theme.of(context).textTheme.caption.color,
              onPressed: () => _pageController.jumpToPage(0),
            ),
            IconButton(
              icon: Icon(
                Icons.label,
                size: 24.0,
              ),
              color: _page == 1
                  ? Colors.brown // warna icon ada menu bottom bar
                  : Theme.of(context).textTheme.caption.color,
              onPressed: () => _pageController.jumpToPage(1),
            ),
            IconButton(
              icon: Icon(Icons.add,
                  size: 24.0,
                  color: Colors.pinkAccent // warna icon ada menu bottom bar
                  ),
              color: _page == 2
                  ? Colors.greenAccent
                  : Theme.of(context).textTheme.caption.color,
              onPressed: () => _pageController.jumpToPage(2),
            ),
            IconButton(
              icon: Icon(
                Icons.notifications,
                size: 24.0,
              ),
              color: _page == 3
                  ? Colors.greenAccent // warna icon ada menu bottom bar
                  : Theme.of(context).textTheme.caption.color,
              onPressed: () => _pageController.jumpToPage(3),
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                size: 24.0,
              ),
              color: _page == 4
                  ? Colors.yellowAccent // warna icon ada menu bottom bar
                  : Theme.of(context).textTheme.caption.color,
              onPressed: () => _pageController.jumpToPage(4),
            ),
            SizedBox(width: 7),
          ],
        ),
        color: Colors.redAccent, // warna theme/background menu bottom bar
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _pageController.jumpToPage(2),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
