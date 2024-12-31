import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavbarItem {
  final String title;
  final bool showBackgroundColour;

  NavbarItem({
    required this.title,
    required this.showBackgroundColour,
  });
}

class StealthAppbar extends StatefulWidget {
  const StealthAppbar({
    super.key,
    required this.navbarItem,
    this.scrollUnderElevation,
    this.bottom,
    this.actions = const [],
    this.leading,
  });

  final NavbarItem navbarItem;
  final double? scrollUnderElevation;
  final PreferredSizeWidget? bottom;
  final List<Widget> actions;
  final Widget? leading;

  @override
  State<StealthAppbar> createState() => _StealthAppbarState();
}

class _StealthAppbarState extends State<StealthAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: widget.leading,
      scrolledUnderElevation: widget.scrollUnderElevation,
      foregroundColor: Colors.white,
      systemOverlayStyle: (Platform.isIOS)
          ? (widget.navbarItem.showBackgroundColour
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark)
          : SystemUiOverlayStyle(
              statusBarIconBrightness: widget.navbarItem.showBackgroundColour
                  ? Brightness.light
                  : Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
      backgroundColor:  Colors.transparent,
      titleSpacing: 0,
      title: Text(
        widget.navbarItem.title,
        style: const TextStyle(
          // fontWeight: FontWeight,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      bottom: widget.bottom,
      actions: widget.actions,
    );
  }
}
