import 'package:flutter/material.dart';
import 'package:instagram_clone/views/screens/pages/home/home.dart';
import '../pages/add_post/add_post.dart';
import '../pages/favourite/favourite.dart';
import '../pages/profile/profile.dart';
import '../pages/search/search.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController();
  int _pageSelected = 0; // default first page
  final _pages = const <Widget>[HomeScreen(), SearchScreen(), AddPostScreen(), FavouriteScreen(), ProfileScreen()];

  // @override
  // Future<bool?> _onWillPop() async {
  //   setState(() {
  //     if (_pageSelected == 0) {
  //       Navigator.of(context).pop();
  //     } else {
  //       _pageSelected = 0;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 28,
        currentIndex: _pageSelected,
        onTap: (index) {
          setState(() {
            _pageSelected = index;
            _pageController.animateToPage(_pageSelected, duration: const Duration(milliseconds: 200), curve: Curves.linear);
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home,),
              label: 'Home',
              backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.search,),
              label: 'Search',
              backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.add_box_outlined,),
              label: 'Add Post',
              backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_outline,),
              label: 'Favourite',
              backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person,),
              label: 'Profile',
              backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _pageSelected = index;
          });
        },
        children: _pages,
      ),
    );
  }
}
