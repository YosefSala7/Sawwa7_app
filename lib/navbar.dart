import 'package:flutter/material.dart';
import 'package:flutter_application_2/fav.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/museums/Alexandria_National_Museum.dart';
import 'package:flutter_application_2/Historical Sites/pyramids.dart';
import 'package:flutter_application_2/Historical Sites/library_of_alexandria.dart';
import 'package:flutter_application_2/museums/Grand_Egyptian.dart';
import 'package:flutter_application_2/museums/graeco_roman_museum.dart';
import 'package:flutter_application_2/Historical Sites/qaitbay_citadel.dart';
import 'package:flutter_application_2/museums/Islamic_Art.dart';
import 'package:flutter_application_2/museums/Royal_Jewelry_Museum.dart';
import 'package:flutter_application_2/museums/Coptic_Museum.dart';
import 'profile-settings.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.title});

  final String title;

  void toggleTheme(bool value) {
    // ❌ مش هيغير حاجة — مجرد placeholder
  }

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  late final pages = [
    Home(
      dataa: [
        ["images/99.jpg", "Pyramids and sphinx", Pyramids()],
        ["images/m2.jpg", "Alexandria National Museum", alex()],
        ["images/m3.jpg", "Royal Jewelry Museum", royal()],
        ["images/m4.jpg", "The Coptic Museum", coptic()],
        ["images/m5.jpg", "Great Egyptian Museum", grand()],
        ["images/m6.jpg", "Museum of Islamic Art", islamicart()],
        ["images/R.jpg", "Alexandria Library", librarry()],
        ["images/m1.jpg", "Graeco Roman   Museums", graeco()],
        ["images/8.jpg", "Qaitbay Citadel", qaitbay()],
        ["images/m6.jpg", "Museum of Islamic Art", islamicart()],
      ],
    ),
    Center(
      child: Text(
        "Comming Soon",
        style: TextStyle(
          fontSize: 37,
          color: const Color.fromARGB(255, 254, 141, 0),
          fontFamily: "norse-bold",
        ),
      ),
    ),
    Fav(cname: "fav", cimg: "images/f1.jpg"),
    ProfilePage(isLightMode: false, onThemeChange: widget.toggleTheme),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontFamily: "norse-bold",
              color: Color.fromARGB(255, 254, 141, 0),
              fontWeight: FontWeight.bold,
            );
          }
          return const TextStyle(color: Colors.white, fontFamily: "norse-bold");
        }),
        backgroundColor: const Color.fromARGB(121, 42, 42, 42),
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),
        height: 60,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: Colors.white),
            label: "Home",
            selectedIcon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 254, 141, 0),
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.qr_code_scanner, color: Colors.white),
            label: "scan",
            selectedIcon: Icon(
              Icons.qr_code_scanner,
              color: Color.fromARGB(255, 254, 141, 0),
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            label: "favorite",
            selectedIcon: Icon(
              Icons.favorite,
              color: Color.fromARGB(255, 254, 141, 0),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(
                  isLightMode: false,
                  onThemeChange: widget.toggleTheme,
                ),
              ),
            ),
            child: NavigationDestination(
              icon: Icon(Icons.person_outline, color: Colors.white),
              label: "profile",
              selectedIcon: Icon(
                Icons.person,
                color: Color.fromARGB(255, 254, 141, 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
