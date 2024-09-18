// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_app/http/api_services.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/screen/all_page/screen_details/details_screen.dart';
import 'package:news_app/screen/headline_of_home_screen/headline.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();
  // Headline headline=  Headline(articles:articles );

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<NewsModel?>(
          future: apiService.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data != null) {
              var articles = snapshot.data!.articles;
              var newsHeadLineModel =
                  snapshot.data!.newsHeadLineModel!.articles;
              if ((articles != null && articles.isNotEmpty) &&
                  (newsHeadLineModel != null ||
                      newsHeadLineModel!.isNotEmpty)) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: height / 25,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, top: 12),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            Jiffy.now().format(pattern: 'MMM do yy, EEEE'),
                            style: GoogleFonts.abel(fontSize: height / 50),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xfff3d8e6),
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        height: height / 10,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: height / 100),
                                  const Text(
                                    'Good morning',
                                    style: TextStyle(
                                      color: Color(0xFF94A5AA),
                                      fontSize: 17,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w400,
                                      height: 0.10,
                                    ),
                                  ),
                                  SizedBox(height: height / 30),
                                  const Text(
                                    'Bangladesh',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF1A434E),
                                      fontSize: 26,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w700,
                                      height: 0.05,
                                    ),
                                  )
                                ],
                              ),
                              InkWell(
                                child: SvgPicture.asset(
                                  'images/notification-bing.svg',
                                  height: height / 15,
                                  width: width / 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Horizontal List of Images

                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SizedBox(
                        height: height / 4,
                        width: width / 1.10,
                        child: ListView.builder(
                          // itemExtent: ,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            var imageUrl = articles[index].urlToImage;
                            // var articles=snapshot.data!.articles![index];
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => HeadLineDetailsScreen(
                                          urltoImage: articles[index]
                                              .urlToImage
                                              .toString(),
                                          srcName: articles[index]
                                              .source!
                                              .name
                                              .toString(),
                                          author:
                                              articles[index].author.toString(),
                                          title:
                                              articles[index].title.toString(),
                                          description: articles[index]
                                              .description
                                              .toString(),
                                          url: articles[index].url.toString(),
                                          publishedAt: articles[index]
                                              .publishedAt
                                              .toString(),
                                          content: articles[index]
                                              .content
                                              .toString(),
                                        )));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: SizedBox(
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          imageUrl ?? 'assets/placeholder.png',
                                          fit: BoxFit.cover,
                                          height: height / 4,
                                          width: width / 1.10,
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          right: 13,
                                          left: 13,
                                          //top: 1,

                                          child: Container(
                                            decoration: const BoxDecoration(
                                                // ignore: use_full_hex_values_for_flutter_colors
                                                color: Color(0xff55f000000),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(25),
                                                    topRight:
                                                        Radius.circular(25))),
                                            height: height / 8,
                                            width: width / 1.5,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    articles[index]
                                                        .title
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(
                                                    height: height / 60,
                                                  ),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          articles[index]
                                                              .source!
                                                              .name
                                                              .toString(),
                                                          style: const TextStyle(
                                                              letterSpacing: 2,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              backgroundColor:
                                                                  Colors.white,
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                        // Text(articles[index]
                                                        //     .publishedAt
                                                        //     .toString()),

                                                        Text(
                                                          Jiffy.parse(articles[
                                                                      index]
                                                                  .publishedAt
                                                                  .toString())
                                                              .format(
                                                                  pattern:
                                                                      'MMMM do yyyy, h:mm a'),
                                                          style: const TextStyle(
                                                              letterSpacing:
                                                                  0.7,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              backgroundColor:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black),
                                                        )
                                                      ])
                                                ],
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: height / 25),

                    headlineBase(context),
                    headlinehomepage(
                        snapshot,
                        newsHeadLineModel.length

                        // snapshot.data!.newsHeadLineModel!.articles!.length
                        ,
                        context)
                  ],
                );
              } else {
                return const Center(child: Text("No articles found."));
              }
            } else {
              return const Center(child: Text("No data available."));
            }
          },
        ),
      ),
    );
  }
}
