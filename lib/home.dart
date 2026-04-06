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
  final List<dynamic> dataa;
  const Home({super.key, required this.dataa});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, String>> places = [
    {'image': 'img/1.jpg', 'name': 'Aswan'},
    {'image': 'img/2.jpg', 'name': 'Luxor'},
    {'image': 'img/3.jpg', 'name': 'Cairo'},
    {'image': 'img/4.jpg', 'name': 'Alexandria'},
  ];

  void toggleTheme(bool value) {
    // ❌ مش هيغير حاجة — مجرد placeholder
  }

  final List<bool> favorites = [];
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> filteredData = [];
  @override
  void initState() {
    super.initState();
    favorites.addAll(List.generate(places.length, (_) => false));
    // initialize filteredData with all items
    filteredData = List.from(widget.dataa);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filter(String query) {
    final q = query.trim().toLowerCase();
    setState(() {
      if (q.isEmpty) {
        filteredData = List.from(widget.dataa);
      } else {
        filteredData = widget.dataa.where((item) {
          final name = item[1].toString().toLowerCase();
          return name.contains(q);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Image.asset("images/FINAL LOGO.png"),
        ),
        backgroundColor: const Color.fromRGBO(33, 33, 33, 1),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final result = await showSearch(
                context: context,
                delegate: MySearchDelegate(List.from(widget.dataa)),
              );
              if (result != null) {
                if (result is List && result.length >= 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => result[2]),
                  );
                } else if (result is String) {
                  _searchController.text = result;
                  _filter(result);
                }
              }
              
            },
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    isLightMode: false,
                    onThemeChange: toggleTheme,
                  ),
                ),
              ),
              child: Container(
                width: screenWidth * 0.1,
                height: screenWidth * 0.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage("images/user.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.015),
              Center(
                child: SizedBox(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.9,
                  child: StatefulBuilder(
                    builder: (context, setLocalState) {
                      return TextField(
                        controller: _searchController,
                        onChanged: (v) {
                          _filter(v);
                          // update suffix icon state
                          setLocalState(() {});
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: const TextStyle(color: Colors.white54),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white70,
                          ),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.clear,
                                    color: Colors.white70,
                                  ),
                                  onPressed: () {
                                    _searchController.clear();
                                    _filter('');
                                    setLocalState(() {});
                                  },
                                )
                              : null,
                          filled: true,
                          fillColor: const Color.fromRGBO(60, 60, 60, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Explore Egypt",
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  color: const Color.fromARGB(255, 254, 141, 0),
                  fontFamily: "norse-bold",
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  color: Colors.white,
                  fontFamily: "norse-bold",
                ),
              ),

              SizedBox(height: screenHeight * 0.015),

              // كاتيجوريز
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categoryItem(
                      "images/category1.png",
                      "Historical Places",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => museums(
                              cname: 'Historical Places',
                              cimg: "images/category1.png",
                              dataa: [
                                [
                                  "images/salahel.jpg",
                                  "Citadel Salah El Din",
                                  citadel(),
                                ],
                                [
                                  "images/22.jpg",
                                  "The Hanging Church",
                                  Thehangingchurch(),
                                ],
                                [
                                  "images/99.jpg",
                                  "Pyramids and Sphinx",
                                  Pyramids(),
                                ],
                                ["images/8.jpg", "Qaitbay Citadel", qaitbay()],
                                [
                                  "images/R.jpg",
                                  "Alexandria Library",
                                  librarry(),
                                ],
                                ["images/55.jpg", "The Roman Theater", roman()],
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    // Museums
                    categoryItem("images/category2.png", "Museums", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => museums(
                            cname: 'Museums',
                            cimg: "images/category2.png",
                            dataa: [
                              [
                                "images/m1.jpg",
                                "Graeco Roman Museums",
                                graeco(),
                              ],
                              [
                                "images/m2.jpg",
                                "Alexandria National Museums",
                                alex(),
                              ],
                              [
                                "images/m3.jpg",
                                "Royal Jewelry Museums",
                                royal(),
                              ],
                              ["images/m4.jpg", "The Coptic Museums", coptic()],
                              [
                                "images/m5.jpg",
                                "Great Egyptian Museum",
                                grand(),
                              ],
                              [
                                "images/m6.jpg",
                                "Museum of Islamic Art",
                                islamicart(),
                              ],
                            ],
                          ),
                        ),
                      );
                    }),

                    // Hotels
                    categoryItem("images/HHH.png", "Hotels", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => museums(
                            cname: 'Hotels',
                            cimg: "images/HHH.png",
                            dataa: [
                              [
                                "images/h1.jpg",
                                "Cairo Pyramids Hotel",
                                cairo_hotel(),
                              ],
                              [
                                "images/h2.jpg",
                                "Hilton Alexandria GreenPlaza",
                                Alex_hotel(),
                              ],
                              [
                                "images/h3.jpg",
                                "Hilton Luxor Resort Spa",
                                luxor_hotel(),
                              ],
                              [
                                "images/h4.jpg",
                                "Movenpick Aswan Hotel",
                                Aswan_hotel(),
                              ],
                              [
                                "images/h5.jpg",
                                "Barcelo Tiran Sharm Resort",
                                sharm(),
                              ],
                              [
                                "images/h6.jpg",
                                "Hilton Hurghada Plaza",
                                hurghada(),
                              ],
                            ],
                          ),
                        ),
                      );
                    }),

                    // City Tours
                    categoryItem("images/category4.png", "City Tours", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => museums(
                            cname: 'City Tours',
                            cimg: "images/category4.png",
                            dataa: [
                              ["images/c1.jpg", "Cairo", Cairo_tour()],
                              ["images/c2.jpg", "Alex", Alex_tour()],
                              ["images/c3.jpg", "Aswan", Aswan_tour()],
                              ["images/c4.jpg", "Luxor", luxor_tour()],
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              Text(
                "Popular Destinations",
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  color: Colors.white,
                  fontFamily: "norse-bold",
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              SizedBox(
                height: screenHeight * 0.55,
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenWidth < 600 ? 2 : 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: screenWidth < 400 ? 0.65 : 0.75,
                  ),
                  itemCount: filteredData.length,
                  itemBuilder: (context, i) {
                    return cont(
                      filteredData[i][0],
                      filteredData[i][1],
                      filteredData[i][2],
                      screenWidth,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryItem(String img, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
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
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  final List<dynamic> data;

  MySearchDelegate(this.data);

  List<dynamic> _filterResults(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return List.from(data);
    return data.where((item) {
      final name = item[1].toString().toLowerCase();
      return name.contains(q);
    }).toList();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _filterResults(query);
    if (results.isEmpty) {
      return const Center(child: Text('No results'));
    }
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return ListTile(
          leading: SizedBox(
            width: 56,
            height: 56,
            child: Image.asset(item[0], fit: BoxFit.cover),
          ),
          title: Text(item[1].toString()),
          onTap: () {
            // return the selected item to the caller (home) which will handle navigation
            close(context, item);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty ? List.from(data) : _filterResults(query);
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final item = suggestions[index];
        return ListTile(
          leading: SizedBox(
            width: 48,
            height: 48,
            child: Image.asset(item[0], fit: BoxFit.cover),
          ),
          title: Text(item[1].toString()),
          onTap: () {
            // Immediately return the tapped suggestion as the selected item
            close(context, item);
          },
        );
      },
    );
  }
}

Widget cont(
  String pho,
  String placeName,
  dynamic destination,
  double screenWidth,
) {
  bool isFavorite = false;

  return StatefulBuilder(
    builder: (context, setState) {
      return Card(
        color: const Color.fromARGB(255, 33, 33, 33),
        shadowColor: const Color.fromARGB(255, 88, 33, 1),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    pho,
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
                          color: isFavorite
                              ? const Color.fromARGB(255, 88, 33, 1)
                              : const Color.fromARGB(255, 88, 33, 1),
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Text(
                placeName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: const Color.fromARGB(255, 254, 140, 1),
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                  fontFamily: "lekton-regular",
                ),
              ),
            ),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => destination),
                    );
                  },
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
