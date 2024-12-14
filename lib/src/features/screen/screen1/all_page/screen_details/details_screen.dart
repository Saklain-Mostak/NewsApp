import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher.dart';

class HeadLineDetailsScreen extends StatelessWidget {
  
  final String srcName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urltoImage;
  final String publishedAt;
  final String content;

  const HeadLineDetailsScreen({
    super.key,
   
    required this.srcName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urltoImage,
    required this.publishedAt,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    var height = size.height;
    // ignore: unused_local_variable
    var width = size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: ListView(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32)),
                    child: Image.network(
                      urltoImage,
                      height: height / 2.5,
                      // width: width / .1,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    height: height / 25,
                    color: Colors.white,
                    child: TextButton(
                        onPressed: () async {
                          try {
                            final Uri url1 = Uri.parse(url);
                            await launchUrl(url1,
                                mode: LaunchMode.inAppWebView);
                          } catch (e) {
                            if (kDebugMode) {
                              print("$e");
                            }
                          }
                        },
                        child: Center(
                          child: Text(
                            srcName,
                            style: const TextStyle(color: Colors.red),
                          ),
                        )),
                  ),
                ),
                Positioned(
                    right: 10,
                    bottom: 10,
                    child: Container(
                      height: height / 25,
                      color: Colors.white,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          Jiffy.parse(publishedAt)
                              .format(pattern: 'dd, MMM yyyy'),
                          style: GoogleFonts.adamina(color: Colors.black),
                        ),
                      )),
                    ))
              ],
            ),
            SizedBox(
              height: height / 20,
            ),
            Text(
                // maxLines: 2,
                title,
                textAlign: TextAlign.justify,
                style: GoogleFonts.sahitya(
                    letterSpacing: 1,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: height / 65,
            ),
            Text(
              description,
              textAlign: TextAlign.justify,
              style: GoogleFonts.actor(fontSize: 20),
            ),
            SizedBox(
              height: height / 65,
            ),
            Text("- $author",
                textAlign: TextAlign.end,
                style: GoogleFonts.sail(
                    fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(
              height: height / 65,
            ),
            SizedBox(
              height: height / 65,
            ),
            Text(
              textAlign: TextAlign.justify,
              content,
              style: GoogleFonts.actor(letterSpacing: 1, fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
