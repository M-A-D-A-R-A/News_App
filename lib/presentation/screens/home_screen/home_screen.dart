import 'package:flutter/material.dart';
import 'package:news_app/data/data_providers/data_provider.dart';
import 'package:news_app/data/data_providers/news.dart';
import 'package:news_app/data/models/article.dart';
import 'package:news_app/data/models/categorie_model.dart';
import 'package:news_app/presentation/screens/home_screen/widgets/blog_tile.dart';
import 'package:news_app/presentation/screens/home_screen/widgets/catagory_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategorieModel> categories = [];
  var newslist;

  bool _loading = true;
  @override
  void initState() {
    getNews();
    categories = getCategories();
    super.initState();
  }

  getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  /// Categories
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 70,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            imageAssetUrl: categories[index].imageAssetUrl,
                            categoryName: categories[index].categorieName,
                          );
                        }),
                  ),

                  /// News Article
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: ListView.builder(
                        itemCount: newslist.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NewsTile(
                            imgUrl: newslist[index].urlToImage ?? "",
                            title: newslist[index].title ?? "",
                            desc: newslist[index].description ?? "",
                            content: newslist[index].content ?? "",
                            posturl: newslist[index].articleUrl ?? "",
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
  }
}
