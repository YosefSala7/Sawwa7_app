// import 'package:flutter/material.dart';

// class museums extends StatefulWidget {
//   final String cname;
//   final String cimg;
//   final List<dynamic> dataa;
//   const museums({
//     super.key,
//     required this.cname,
//     required this.cimg,
//     required this.dataa,
//   });
//   @override
//   State<museums> createState() => _museumsState();
// }

// class _museumsState extends State<museums> {
//   // ✅ Constructor
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           child: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
//           onTap: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Color.fromARGB(255, 33, 33, 33),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(
//               widget.cname,
//               style: const TextStyle(
//                 fontSize: 40,
//                 fontWeight: FontWeight.w500,
//                 color: Color.fromARGB(255, 254, 140, 1),
//                 fontFamily: "norse-bold",
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         color: Color.fromARGB(255, 33, 33, 33),
//         child: Column(
//           children: [
//             Center(child: Image.asset(widget.cimg, height: 100, width: 100)),
//             Expanded(
//               child: GridView(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   // mainAxisExtent: 140,
//                   // childAspectRatio: 0.9,
//                   // mainAxisSpacing: 0.7,
//                 ),
//                 padding: EdgeInsets.all(40),
//                 physics: BouncingScrollPhysics(),
//                 cacheExtent: 100,
//                 children: [
//                   for (int i = 0; i < widget.dataa.length; i++)
//                     myBox(widget.dataa[i][0], widget.dataa[i][1]),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget myBox(String pho, String placeName) {
//   bool isFavorite = false;

//   return StatefulBuilder(
//     builder: (context, setState) {
//       return Card(
//         color: const Color.fromARGB(255, 33, 33, 33),
//         shadowColor: const Color.fromARGB(255, 88, 33, 1),
//         elevation: 10,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.vertical(
//                 top: Radius.circular(20),
//               ),
//               child: Stack(
//                 children: [
//                   Image.asset(
//                     pho,
//                     fit: BoxFit.cover,
//                     height: 120,
//                     width: double.infinity,
//                   ),
//                   Positioned(
//                     top: 8,
//                     right: 8,
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         color: Colors.black45,
//                         shape: BoxShape.circle,
//                       ),
//                       child: IconButton(
//                         icon: Icon(
//                           isFavorite ? Icons.favorite : Icons.favorite_border,
//                           color: isFavorite
//                               ? Colors.red
//                               : const Color.fromARGB(255, 88, 33, 1),
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             isFavorite = !isFavorite;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
//               child: Text(
//                 placeName,
//                 style: const TextStyle(
//                   color: Color.fromARGB(255, 254, 140, 1),
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: "lekton-regular",
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 4, right: 12, bottom: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 254, 140, 1),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 8,
//                       ),
//                     ),
//                     onPressed: () {
//                       print("View button clicked on ");
//                     },
//                     child: const Text(
//                       "Explore Now",
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 0, 0, 0),
//                         fontFamily: "lekton-regular",
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class museums extends StatefulWidget {
  final String cname;
  final String cimg;
  final List<dynamic> dataa; // كل عنصر: [image, name, pageWidget]

  const museums({
    super.key,
    required this.cname,
    required this.cimg,
    required this.dataa,
  });

  @override
  State<museums> createState() => _MuseumsState();
}

class _MuseumsState extends State<museums> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
          onTap: () => Navigator.pop(context),
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
        child: Column(
          children: [
            Center(child: Image.asset(widget.cimg, height: 100, width: 100)),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // mainAxisSpacing: 20,
                  // crossAxisSpacing: 20,
                  childAspectRatio: 0.6,
                ),
                itemCount: widget.dataa.length,
                itemBuilder: (context, i) {
                  return myBox(
                    widget.dataa[i][0],
                    widget.dataa[i][1],
                    widget.dataa[i][2],
                    i,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget myBox(String pho, String placeName, Widget page, int i) {
  bool isFavorite = false;

  return StatefulBuilder(
    builder: (context, setState) {
      return Card(
        color: const Color.fromARGB(255, 33, 33, 33),
        shadowColor: const Color.fromARGB(255, 88, 33, 1),
        elevation: 10,
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
                    height: 120,
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
                              ? const Color.fromARGB(255, 88, 24, 0)
                              : const Color.fromARGB(255, 88, 33, 1),
                        ),
                        onPressed: () async {
                          final supabase = Supabase.instance.client;
                          final User? user = supabase.auth.currentUser;
                          try {
                            await supabase.from('fav').insert({
                              'user-id': user!.id,

                              'index': i,
                            });
                          } catch (error) {
                            print(error);
                          }
                          setState(() => isFavorite = !isFavorite);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                placeName,
                style: const TextStyle(
                  color: Color.fromARGB(255, 254, 140, 1),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: "lekton-regular",
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 5,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 254, 140, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => page),
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
