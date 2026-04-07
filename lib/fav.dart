import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/models/place_model.dart';
import 'package:flutter_application_2/features/historical_sites/data/sites_data.dart';
import 'package:flutter_application_2/features/hotels/data/hotels_data.dart';
import 'package:flutter_application_2/features/museums/data/museums_data.dart';
import 'package:flutter_application_2/features/tours/data/tours_data.dart';
import 'package:flutter_application_2/pages/detail_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_application_2/navbar.dart';

class Fav extends StatefulWidget {
  final String cname;
  final String cimg;
  const Fav({super.key, required this.cname, required this.cimg});

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  final supabase = Supabase.instance.client;
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

        PlaceModel? place;

        // Historical Sites
        if (type == 'historical' && idx < HistoricalSitesData.sites.length) {
          place = HistoricalSitesData.sites[idx];
        }
        // Museums
        else if (type == 'museum' && idx < MuseumsData.museums.length) {
          place = MuseumsData.museums[idx];
        }
        // Hotels
        else if (type == 'hotel' && idx < HotelsData.hotels.length) {
          place = HotelsData.hotels[idx];
        }
        // Tours
        else if (type == 'tour' && idx < ToursData.tours.length) {
          place = ToursData.tours[idx];
        }

        if (place != null) {
          loadedFavs.add({'place': place, 'type': type, 'index': idx});
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
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavBar(title: "")),
          ),
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
                  final place = fav['place'] as PlaceModel;

                  return Card(
                    color: const Color.fromARGB(255, 54, 54, 54),
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        place.imagePath,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        place.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        place.location,
                        style: const TextStyle(color: Colors.white70),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite, color: Colors.red),
                        onPressed: () =>
                            toggleFavorite(fav['index'], fav['type']),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(place: place),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
