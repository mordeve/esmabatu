// import 'package:esmabatu/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class DugunPage extends StatelessWidget {
//   const DugunPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             const Text("Tarih: 11.11.2023"),
//             const Text("Saat: 19:00 - 23:00"),
//             const Text(
//                 "Adres: Fatih mahallesi aydos caddesi yörük caddesi, Serinpınar Sk. çamlık sok no:1, 34885 Sancaktepe/İstanbul"),
//             // https://www.google.com/maps/dir/40.9611111,29.2669434/bervaze/@40.9625274,29.2015412,13z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x14cadb704477ec21:0xd527375e81aba30c!2m2!1d29.2181304!2d40.9551708?entry=ttu
//             ElevatedButton(
//               onPressed: () {
//                 _launchMapsUrl(40.9551708, 29.2181304);
//               },
//               child: const Text("Yol Tarifi"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _launchMapsUrl(double lat, double lon) async {
//     if (await canLaunchUrl(Uri.parse(weddingLocation))) {
//       await launchUrl(Uri.parse(weddingLocation));
//     } else {
//       throw 'Could not launch $weddingLocation';
//     }
//   }
// }

import 'package:esmabatu/route.dart';
import 'package:esmabatu/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DugunPage extends StatelessWidget {
  const DugunPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const NetworkImage(
              "https://i.pinimg.com/originals/36/d4/c4/36d4c42bbf14cd05a61e970fd58f7f56.png",
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.multiply,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Get.rootDelegate.offNamed(MyRoute.main);
                },
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.black,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Card(
                    color: Colors.black45,
                    margin: const EdgeInsets.all(16),
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 420,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Düğün",
                              style: GoogleFonts.pacifico(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              "Tarih: 11.11.2023",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              "Saat:  19:00 - 23:00",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              "Adres:",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const SelectableText(
                              "Fatih Mahallesi Aydos Caddesi Yörük Caddesi, Serinpınar Sk. Çamlık Sok No:1, 34885, Sancaktepe/İstanbul",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 36.0),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  _launchMapsUrl();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 53, 160, 66),
                                  textStyle: const TextStyle(fontSize: 18),
                                  minimumSize: const Size(150, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(Icons.location_on_outlined,
                                        color: Colors.white),
                                    SizedBox(width: 8),
                                    Text("Yol Tarifi Al ",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchMapsUrl() async {
    if (await canLaunchUrl(Uri.parse(weddingLocation))) {
      await launchUrl(Uri.parse(weddingLocation));
    } else {
      throw 'Could not launch $weddingLocation';
    }
  }
}
