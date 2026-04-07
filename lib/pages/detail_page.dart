import 'package:flutter/material.dart';
import '../core/models/place_model.dart';

/// الصفحة الواحدة اللي بتشتغل مع كل حاجة:
/// Historical Sites / Museums / Hotels / Tours
///
class DetailPage extends StatelessWidget {
  final PlaceModel place;

  const DetailPage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── image ──
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    place.imagePath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 16),

                // ── Address ────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    place.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // ── location ───
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text(
                        place.location,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // ── details ──
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      place.description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ──Elـ Animated Ticket ────
                TicketAnimated(
                  egyptianPrice: place.egyptianPrice,
                  foreignPrice: place.foreignPrice,
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Animated Ticket Widget —

class TicketAnimated extends StatefulWidget {
  final String egyptianPrice;
  final String foreignPrice;

  const TicketAnimated({
    super.key,
    required this.egyptianPrice,
    required this.foreignPrice,
  });

  @override
  State<TicketAnimated> createState() => _TicketAnimatedState();
}

class _TicketAnimatedState extends State<TicketAnimated> {
  bool isEgyptian = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => setState(() => isEgyptian = !isEgyptian),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          width: 300,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: isEgyptian
                  ? [Colors.orangeAccent, Colors.deepOrange]
                  : [
                      const Color.fromARGB(246, 57, 124, 91),
                      const Color.fromARGB(255, 18, 37, 22),
                    ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: isEgyptian
                ? _ticketContent("For Egyptians", widget.egyptianPrice)
                : _ticketContent("For Foreigners", widget.foreignPrice),
          ),
        ),
      ),
    );
  }

  Widget _ticketContent(String title, String price) {
    return Column(
      key: ValueKey(title),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          price,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "Tap to switch",
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }
}
