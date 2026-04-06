import 'package:flutter/material.dart';
import 'package:flutter_application_2/musums.dart';
import 'package:flutter_application_2/Historical Sites/Citadel_of _Salah _ElDin.dart';
import 'package:flutter_application_2/Historical Sites/library_of_alexandria.dart';
import 'package:flutter_application_2/Historical Sites/pyramids.dart';
import 'package:flutter_application_2/Historical Sites/qaitbay_citadel.dart';
import 'package:flutter_application_2/Historical Sites/the_hanging_church.dart';
import 'package:flutter_application_2/Historical Sites/the_roman _theater.dart';
import 'package:flutter_application_2/museums/Alexandria_National_Museum.dart';
import 'package:flutter_application_2/museums/Coptic_Museum.dart';
import 'package:flutter_application_2/museums/Grand_Egyptian.dart';
import 'package:flutter_application_2/museums/Islamic_Art.dart';
import 'package:flutter_application_2/museums/Royal_Jewelry_Museum.dart';
import 'package:flutter_application_2/museums/graeco_roman_museum.dart';
import 'package:flutter_application_2/Hotels/AlexHilton.dart';
import 'package:flutter_application_2/Hotels/CPH.dart';
import 'package:flutter_application_2/Hotels/Luxorhotel.dart';
import 'package:flutter_application_2/Hotels/aswanhotel.dart';
import 'package:flutter_application_2/Hotels/hurghadahotel.dart';
import 'package:flutter_application_2/Hotels/sharmhotel.dart';
import 'package:flutter_application_2/Tours/Aswantour.dart';
import 'package:flutter_application_2/Tours/alextour.dart';
import 'package:flutter_application_2/Tours/ctour.dart';
import 'package:flutter_application_2/Tours/luxortour.dart';
import 'profile-settings.dart';

class Home extends StatefulWidget {
  final List<dynamic> data;
  const Home({super.key, required this.data});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData = List.from(widget.data);
  }

  void _filter(String query) {
    final q = query.toLowerCase();
    setState(() {
      if (q.isEmpty) {
        filteredData = List.from(widget.data);
      } else {
        filteredData = widget.data
            .where((item) => item[1].toString().toLowerCase().contains(q))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: screenHeight * 0.11, 
            collapsedHeight: screenHeight * 0.06, // ← 8% = مثالي (~65px)
            toolbarHeight: screenHeight * 0.06,

            backgroundColor: const Color.fromRGBO(33, 33, 33, 1),

            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.zero, 

              title: SizedBox(
                height: screenHeight * 0.07, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Transform.scale(
                        scale: 0.9,
                        child: SizedBox(
                          width: screenWidth * 0.12,
                          height: screenHeight * 0.07,
                          child: Image.asset(
                            "images/FINAL LOGO.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    // Profile
                    Padding(
                      padding: EdgeInsets.only(left: 10,right: 5,top: 10,bottom: 10),
                      child: Transform.scale(
                        scale: 0.9,
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(),
                            ),
                          ),
                          child: Container(
                            width: screenWidth * 0.12, 
                            height: screenHeight * 0.07,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("images/user.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey[900]!.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: const Text(
                        "Explore Egypt",
                        style: TextStyle(
                          fontSize: 34,
                          fontFamily: "norse-bold",
                          color: Color.fromARGB(255, 254, 141, 0),
                          shadows: [
                            Shadow(
                              offset: Offset(4, 4),
                              blurRadius: 8,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              screenWidth * 0.03,
              screenHeight * 0.015,
              screenWidth * 0.03,
              screenHeight * 0.015,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Search Bar
                _buildSearchBar(screenWidth, screenHeight),

                // Title
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: screenWidth * 0.07,
                    color: Colors.white,
                    fontFamily: "norse-bold",
                  ),
                ),
              ]),
            ),
          ),

          // 2. Categories Row
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03,
              vertical: screenHeight * 0.015,
            ),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCategoryButton(
                    "images/category1.png",
                    "Historical Places",
                    [
                      ["images/salahel.jpg", "Citadel Salah El Din", citadel()],
                      [
                        "images/22.jpg",
                        "The Hanging Church",
                        Thehangingchurch(),
                      ],
                      ["images/99.jpg", "Pyramids and Sphinx", Pyramids()],
                      ["images/8.jpg", "Qaitbay Citadel", qaitbay()],
                      ["images/R.jpg", "Alexandria Library", librarry()],
                      ["images/55.jpg", "The Roman Theater", roman()],
                    ],
                  ),

                  _buildCategoryButton("images/category2.png", "Museums", [
                    ["images/m1.jpg", "Graeco Roman Museums", graeco()],
                    ["images/m2.jpg", "Alexandria National Museums", alex()],
                    ["images/m3.jpg", "Royal Jewelry Museums", royal()],
                    ["images/m4.jpg", "The Coptic Museums", coptic()],
                    ["images/m5.jpg", "Great Egyptian Museum", grand()],
                    ["images/m6.jpg", "Museum of Islamic Art", islamicart()],
                  ]),

                  _buildCategoryButton("images/HHH.png", "Hotels", [
                    ["images/h1.jpg", "Cairo Pyramids Hotel", cairo_hotel()],
                    [
                      "images/h2.jpg",
                      "Hilton Alexandria GreenPlaza",
                      Alex_hotel(),
                    ],
                    ["images/h3.jpg", "Hilton Luxor Resort Spa", luxor_hotel()],
                    ["images/h4.jpg", "Movenpick Aswan Hotel", Aswan_hotel()],
                    ["images/h5.jpg", "Barcelo Tiran Sharm Resort", sharm()],
                    ["images/h6.jpg", "Hilton Hurghada Plaza", hurghada()],
                  ]),

                  _buildCategoryButton("images/category4.png", "City Tours", [
                    ["images/c1.jpg", "Cairo", Cairo_tour()],
                    ["images/c2.jpg", "Alex", Alex_tour()],
                    ["images/c3.jpg", "Aswan", Aswan_tour()],
                    ["images/c4.jpg", "Luxor", luxor_tour()],
                  ]),
                ],
              ),
            ),
          ),

          // 3. Popular Destinations Title
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              screenWidth * 0.03,
              screenHeight * 0.03,
              screenWidth * 0.03,
              screenHeight * 0.02,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Popular Destinations",
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  color: Colors.white,
                  fontFamily: "norse-bold",
                ),
              ),
            ),
          ),

          // 4. Sliver Grid للـ Popular Destinations 🔥
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              screenWidth * 0.03,
              0,
              screenWidth * 0.03,
              screenHeight * 0.05, // padding تحت
            ),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: screenWidth < 600 ? 2 : 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: screenWidth < 400 ? 0.65 : 0.75,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                return _buildDestinationCard(
                  filteredData[index][0],
                  filteredData[index][1],
                  filteredData[index][2],
                  screenWidth,
                );
              }, childCount: filteredData.length),
            ),
          ),
        ],
      ),
    );
  }

  // 1. Search Bar Function
  Widget _buildSearchBar(double screenWidth, double screenHeight) {
    return Center(
      child: SizedBox(
        height: screenHeight * 0.06,
        width: screenWidth * 0.9,
        child: TextField(
          controller: _searchController,
          onChanged: _filter,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: const TextStyle(color: Colors.white54),
            prefixIcon: const Icon(Icons.search, color: Colors.white70),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.white70),
                    onPressed: () {
                      _searchController.clear();
                      _filter('');
                    },
                  )
                : null,
            filled: true,
            fillColor: const Color.fromRGBO(60, 60, 60, 1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  // 2. Category Button Function
  Widget _buildCategoryButton(String img, String title, List data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => museums(cname: title, cimg: img, dataa: data),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 85,
        width: 85,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 40, 40, 40),
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(49, 254, 140, 0),
              offset: Offset(4, 4),
              blurRadius: 3,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Flexible(child: Image.asset(img, fit: BoxFit.contain)),
              const SizedBox(height: 4),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "norse-regular",
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 3. Destination Card Function
  Widget _buildDestinationCard(
    String image,
    String title,
    dynamic page,
    double screenWidth,
  ) {
    bool isFavorite = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return Card(
          color: const Color.fromARGB(255, 33, 33, 33),
          shadowColor: const Color.fromARGB(255, 88, 33, 1),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الصورة + Heart Button
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      image,
                      fit: BoxFit.cover,
                      height: screenWidth * 0.3,
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black45,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: const Color.fromARGB(255, 88, 33, 1),
                          ),
                          onPressed: () =>
                              setState(() => isFavorite = !isFavorite),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // العنوان
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 254, 140, 1),
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                    fontFamily: "lekton-regular",
                  ),
                ),
              ),

              // Explore Button
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 254, 140, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => page),
                    ),
                    child: const Text(
                      "Explore Now",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "lekton-regular",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
