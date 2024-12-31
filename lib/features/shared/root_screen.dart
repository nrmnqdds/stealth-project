import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stealth/components/stealth_appbar.dart';

class RootScreen extends StatefulWidget {
  final Widget child;

  const RootScreen({
    super.key,
    required this.child,
  });

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class AppBarItem {
  final String path;
  final bool showBackgroundColour;
  final bool showActions;

  AppBarItem({
    required this.path,
    required this.showBackgroundColour,
    this.showActions = false,
  });
}

class MuisBottomNavigationBarItemData {
  final IconData? icon;
  final IconData? activeIcon;
  final String label;
  final String? badgeContent;
  final Widget Function()? iconBuilder;
  final Widget Function()? activeIconBuilder;

  MuisBottomNavigationBarItemData({
    required this.label,
    this.icon,
    this.activeIcon,
    this.iconBuilder,
    this.activeIconBuilder,
    this.badgeContent,
  });
}

class _RootScreenState extends State<RootScreen> {
  final List<AppBarItem> homePages = [
    AppBarItem(path: '/', showBackgroundColour: false, showActions: true),
    AppBarItem(path: '/qibla', showBackgroundColour: false),
    AppBarItem(path: '/quran', showBackgroundColour: false),
    AppBarItem(path: '/profile', showBackgroundColour: false),
  ];

  final List<MuisBottomNavigationBarItemData> bottomNavItems = [
    MuisBottomNavigationBarItemData(
      icon: CupertinoIcons.house,
      activeIcon: CupertinoIcons.house_fill,
      label: 'Home',
    ),
    MuisBottomNavigationBarItemData(
      icon: CupertinoIcons.heart,
      activeIcon: CupertinoIcons.heart_fill,
      label: 'Qibla',
    ),
    MuisBottomNavigationBarItemData(
      icon: CupertinoIcons.book,
      activeIcon: CupertinoIcons.book_fill,
      label: "Qur'an",
    ),
    MuisBottomNavigationBarItemData(
      icon: CupertinoIcons.person_alt_circle,
      activeIcon: CupertinoIcons.person_alt_circle_fill,
      label: 'Profile',
    ),
  ];

  int currentPage = 0;

  void handlePageChange(int index) {
    setState(() {
      currentPage = index;
    });
    context.go(homePages[index].path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: StealthAppbar(
          navbarItem: NavbarItem(
            title: 'Stealth',
            showBackgroundColour: homePages[currentPage].showBackgroundColour,
          ),
        ),
      ),
      body: widget.child,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          showUnselectedLabels: false,
          selectedFontSize: 12,
          onTap: handlePageChange,
          currentIndex: currentPage,
          items: bottomNavItems.asMap().entries.map(
            (entry) {
              //final key = entry.key;
              final item = entry.value;

              return BottomNavigationBarItem(
                icon: item.iconBuilder?.call() ?? Icon(item.icon),
                activeIcon:
                    item.activeIconBuilder?.call() ?? Icon(item.activeIcon),
                label: item.label,
              );

              //return MuisBottomNavigationBarItem(
              //  index: key,
              //  icon: item.iconBuilder?.call() ?? Icon(item.icon),
              //  activeIcon:
              //      item.activeIconBuilder?.call() ?? Icon(item.activeIcon),
              //  label: item.label,
              //);
            },
          ).toList(),
        ),
      ),
    );
  }
}
