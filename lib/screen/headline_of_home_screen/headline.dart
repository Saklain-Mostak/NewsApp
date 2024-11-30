import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/screen/all_page/screen_details/details_screen.dart';

Widget headlineBase(BuildContext context) {
  // ignore: prefer_typing_uninitialized_variables
  var size, height, width;
  size = MediaQuery.of(context).size;
  height = size.height;
  width = size.width;

  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Top Headline',
          style: TextStyle(
            color: Color(0xFF1A434E),
            fontSize: 24,
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w700,
            height: 0.05,
          ),
        ),
        InkWell(
          child: SvgPicture.asset(
            'images/setting-5.svg',
            height: height / 20,
            width: width / 20,
          ),
          onTap: () {},
        )
      ],
    ),
  );
}

Widget headlinehomepage(
    AsyncSnapshot<NewsModel?> snapshot, int index, BuildContext context) {
  // ignore: prefer_typing_uninitialized_variables
  var size, height, width;
  size = MediaQuery.of(context).size;
  height = size.height;
  width = size.width;
  return Expanded(
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: snapshot.data?.newsHeadLineModel?.articles?.length,
      // snapshot.data!.newsHeadLineModel!.articles!.length,
      itemBuilder: (context, index) {
        var articlesHeadline =
            snapshot.data!.newsHeadLineModel!.articles?[index];

        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => HeadLineDetailsScreen(
                        srcName: articlesHeadline.source!.name.toString(),
                        author: articlesHeadline.author.toString(),
                        title: articlesHeadline.title.toString(),
                        description: articlesHeadline.description.toString(),
                        url: articlesHeadline.url.toString(),
                        urltoImage: articlesHeadline.urlToImage.toString(),
                        publishedAt: articlesHeadline.publishedAt.toString(),
                        content: articlesHeadline.content.toString())));
          },
          child: SizedBox(
            child: Padding(
                padding: const EdgeInsets.only(right: 14, left: 14),
                child: ListTile(
                    title: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      articlesHeadline!.title.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "By ${articlesHeadline.source!.name.toString()}",
                      style: const TextStyle(fontSize: 15),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: articlesHeadline.urlToImage.toString(),
                        height: height / 4,
                        width: width / 5,
                        fit: BoxFit.cover,
                      ),
                    ))),
          ),
        );
      },
    ),
  );
}
