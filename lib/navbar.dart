import 'package:flutter/material.dart';
import 'package:flutter_application_2/fav.dart';
import 'package:flutter_application_2/features/historical_sites/data/sites_data.dart';
import 'package:flutter_application_2/features/hotels/data/hotels_data.dart';
import 'package:flutter_application_2/features/museums/data/museums_data.dart';
import 'package:flutter_application_2/features/tours/data/tours_data.dart';
import 'package:flutter_application_2/home.dart';
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
        ...HistoricalSitesData.sites.map((p) => [p.imagePath, p.title, p]),
        ...MuseumsData.museums.map((p) => [p.imagePath, p.title, p]),
        ...HotelsData.hotels.map((p) => [p.imagePath, p.title, p]),
        ...ToursData.tours.map((p) => [p.imagePath, p.title, p]),
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
