// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/museums/Alexandria_National_Museum.dart';
// import 'package:flutter_application_2/museums/Coptic_Museum.dart';
// import 'package:flutter_application_2/museums/Grand_Egyptian.dart';
// import 'package:flutter_application_2/museums/Islamic_Art.dart';
// import 'package:flutter_application_2/museums/Royal_Jewelry_Museum.dart';
// import 'package:flutter_application_2/museums/graeco_roman_museum.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:flutter_application_2/Historical%20Sites/Citadel_of%20_Salah%20_ElDin.dart';
// import 'package:flutter_application_2/Historical%20Sites/library_of_alexandria.dart';
// import 'package:flutter_application_2/Historical%20Sites/pyramids.dart';
// import 'package:flutter_application_2/Historical%20Sites/qaitbay_citadel.dart';
// import 'package:flutter_application_2/Historical%20Sites/the_hanging_church.dart';
// import 'package:flutter_application_2/Historical%20Sites/the_roman%20_theater.dart';

// class Fav extends StatefulWidget {
//   final String cname;
//   final String cimg;

//   const Fav({super.key, required this.cname, required this.cimg});

//   @override
//   State<Fav> createState() => _FavState();
// }

// class _FavState extends State<Fav> {
//   final supabase = Supabase.instance.client;

//   List<dynamic> museums = [
//     ["images/salahel.jpg", "Citadel Salah El Din", citadel()],
//     ["images/22.jpg", "The Hanging Church", Thehangingchurch()],
//     ["images/99.jpg", "Pyramids and Sphinx", Pyramids()],
//     ["images/8.jpg", "Qaitbay Citadel", qaitbay()],
//     ["images/R.jpg", "Alexandria Library", librarry()],
//     ["images/55.jpg", "The Roman Theater", roman()],
//     ["images/m1.jpg", "Graeco Roman Museums", graeco()],
//     ["images/m2.jpg", "Alexandria National Museums", alex()],
//     ["images/m3.jpg", "Royal Jewelry Museums", royal()],
//     ["images/m4.jpg", "The Coptic Museums", coptic()],
//     ["images/m5.jpg", "Great Egyptian Museum", grand()],
//     ["images/m6.jpg", "Museum of Islamic Art", islamicart()],
//   ];

//   List<int> favIndices = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchFavorites();
//   }

//   Future<void> fetchFavorites() async {
//     final user = supabase.auth.currentUser;

//     if (user == null) {
//       // Handle user not logged in
//       setState(() => isLoading = false);
//       return;
//     }

//     try {
//       final response = await supabase
//           .from('fav')
//           .select('index')
//           .eq('user-id', user.id);

//       // Extract indices as a list of ints
//       favIndices = List<int>.from(response.map((item) => item['index'] as int));

//       setState(() {
//         isLoading = false;
//       });
//     } catch (e) {
//       print("Error fetching favorites: $e");
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final favMuseums = favIndices.map((i) => museums[i]).toList();
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           child: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
//           onTap: () => Navigator.pop(context),
//         ),
//         backgroundColor: const Color.fromARGB(255, 33, 33, 33),
//         title: Text(
//           widget.cname,
//           style: const TextStyle(
//             fontSize: 40,
//             fontWeight: FontWeight.w500,
//             color: Color.fromARGB(255, 254, 140, 1),
//             fontFamily: "norse-bold",
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Container(
//         color: const Color.fromARGB(255, 33, 33, 33),
//         child: isLoading
//             ? const Center(
//                 child: CircularProgressIndicator(
//                   color: Color.fromARGB(255, 254, 140, 1),
//                 ),
//               )
//             : favMuseums.isEmpty
//             ? const Center(
//                 child: Text(
//                   "No favorites yet!",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               )
//             : ListView.builder(
//                 itemCount: favMuseums.length,

//                 itemBuilder: (context, index) {
//                   final museum = favMuseums[index];
//                   return Card(
//                     color: const Color.fromARGB(255, 54, 54, 54),
//                     margin: const EdgeInsets.all(10),
//                     child: ListTile(
//                       leading: Image.asset(
//                         museum[0],
//                         width: 70,
//                         height: 70,
//                         fit: BoxFit.cover,
//                       ),
//                       title: Text(
//                         museum[1],
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => museum[2]),
//                         );
//                       },
//                     ),

//                   );

//                 },
//               ),

//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_2/navbar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_application_2/museums/Alexandria_National_Museum.dart';
import 'package:flutter_application_2/museums/Coptic_Museum.dart';
import 'package:flutter_application_2/museums/Grand_Egyptian.dart';
import 'package:flutter_application_2/museums/Islamic_Art.dart';
import 'package:flutter_application_2/museums/Royal_Jewelry_Museum.dart';
import 'package:flutter_application_2/museums/graeco_roman_museum.dart';
import 'package:flutter_application_2/Historical%20Sites/Citadel_of%20_Salah%20_ElDin.dart';
import 'package:flutter_application_2/Historical%20Sites/library_of_alexandria.dart';
import 'package:flutter_application_2/Historical%20Sites/pyramids.dart';
import 'package:flutter_application_2/Historical%20Sites/qaitbay_citadel.dart';
import 'package:flutter_application_2/Historical%20Sites/the_hanging_church.dart';
import 'package:flutter_application_2/Historical%20Sites/the_roman%20_theater.dart';

class Fav extends StatefulWidget {
  final String cname;
  final String cimg;

  const Fav({super.key, required this.cname, required this.cimg});

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  final supabase = Supabase.instance.client;

  List<dynamic> historical = [
    ["images/salahel.jpg", "Citadel Salah El Din", citadel()],
    ["images/22.jpg", "The Hanging Church", Thehangingchurch()],
    ["images/99.jpg", "Pyramids and Sphinx", Pyramids()],
    ["images/8.jpg", "Qaitbay Citadel", qaitbay()],
    ["images/R.jpg", "Alexandria Library", librarry()],
    ["images/55.jpg", "The Roman Theater", roman()],
  ];

  List<dynamic> museums = [
    ["images/m1.jpg", "Graeco Roman Museum", graeco()],
    ["images/m2.jpg", "Alexandria National Museum", alex()],
    ["images/m3.jpg", "Royal Jewelry Museum", royal()],
    ["images/m4.jpg", "The Coptic Museum", coptic()],
    ["images/m5.jpg", "Great Egyptian Museum", grand()],
    ["images/m6.jpg", "Museum of Islamic Art", islamicart()],
  ];

  List<Map<String, dynamic>> favItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFavorites();
  }

  Future<void> fetchFavorites() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      setState(() => isLoading = false);
      return;
    }

    try {
      final response = await supabase
          .from('fav')
          .select('index, category_type')
          .eq('user-id', user.id);

      List<Map<String, dynamic>> loadedFavs = [];

      for (final fav in response) {
        final idx = fav['index'] as int;
        final type =
            (fav['category_type'] as String?)?.toLowerCase() ?? 'historical';

        if (type == 'museum' && idx < museums.length) {
          loadedFavs.add({
            'data': museums[idx],
            'type': 'museum',
            'index': idx,
          });
        } else if (type == 'historical' && idx < historical.length) {
          loadedFavs.add({
            'data': historical[idx],
            'type': 'historical',
            'index': idx,
          });
        }
      }

      setState(() {
        favItems = loadedFavs;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching favorites: $e");
      setState(() => isLoading = false);
    }
  }

  Future<void> toggleFavorite(int index, String categoryType) async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    final exists = favItems.any(
      (item) => item['index'] == index && item['type'] == categoryType,
    );

    if (exists) {
      await supabase
          .from('fav')
          .delete()
          .eq('user-id', user.id)
          .eq('index', index)
          .eq('category_type', categoryType);
    } else {
      await supabase.from('fav').insert({
        'user-id': user.id,
        'index': index,
        'category_type': categoryType,
        'created_at': DateTime.now().toIso8601String(),
      });
    }

    await fetchFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavBar()),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        title: Text(
          widget.cname,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 254, 140, 1),
            fontFamily: "norse-bold",
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 33, 33, 33),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 254, 140, 1),
                ),
              )
            : favItems.isEmpty
            ? const Center(
                child: Text(
                  "No favorites yet!",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            : ListView.builder(
                itemCount: favItems.length,
                itemBuilder: (context, index) {
                  final fav = favItems[index];
                  final item = fav['data'];
                  final category = fav['type'];
                  final isFav = true;

                  return Card(
                    color: const Color.fromARGB(255, 54, 54, 54),
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        item[0],
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        item[1],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          toggleFavorite(fav['index'], category);
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => item[2]),
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
