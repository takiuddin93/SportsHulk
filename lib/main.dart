import 'package:SportsHulk/model/posts.dart';
import 'package:SportsHulk/services.dart';
import 'package:SportsHulk/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: UniversalVariables.primaryDodgerBlue));
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    double width = media.width;
    double height = media.height;
    AppBar appBar = AppBar(
      backgroundColor: UniversalVariables.primaryDodgerBlue,
      title: Text("SportsHulk"),
    );
    double appBarHeight = appBar.preferredSize.height;
    return Scaffold(
        appBar: appBar,
        body: Center(
          child: Container(
            color: Colors.white,
            child: Stack(children: <Widget>[
              Positioned(
                  height: height - appBarHeight,
                  child: Center(
                    child: Container(
                      width: width,
                      child: GridView.builder(
                          padding: EdgeInsets.all(0.0),
                          itemCount: 1,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: width / height,
                                  mainAxisSpacing: 0,
                                  crossAxisCount: 1),
                          itemBuilder: (context, index) {
                            return FutureBuilder(
                                future: Services.getPosts(context: context),
                                builder: (context, snapshot) {
                                  return snapshot.data != null
                                      ? makeDashboardItem(snapshot.data, media)
                                      : Center(
                                          child: CircularProgressIndicator());
                                });
                          }),
                    ),
                  )),
            ]),
          ),
        ));
  }

  Widget makeDashboardItem(List<Posts> post, Size media) {
    double width = media.width;
    double height = media.height;
    return Container(
      child: ListView.builder(
          physics: ScrollPhysics(),
          itemCount: post.length,
          itemBuilder: (context, position) {
            return Container(
              width: width * 0.96,
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              height: height * 0.24,
              child: GestureDetector(
                onTap: () {},
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    // Background
                    Container(
                      height: height * 0.18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: position.isEven
                              ? UniversalVariables.primaryDodgerBlue
                              : UniversalVariables.primaryGhost,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 8,
                              color: UniversalVariables.primaryDodgerBlueShadow,
                            ),
                          ]),
                      child: Container(
                        margin: EdgeInsets.only(right: width * 0.02),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    // Image
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        height: height * 0.20,
                        width: width * 0.52,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: FutureBuilder(
                                future: Services.getFeaturedMedia(
                                    context: context,
                                    media: post[position].featuredMedia),
                                builder: (context, snapshot) {
                                  return snapshot.data != null
                                      ? Container()
                                      : Center(
                                          child: CircularProgressIndicator());
                                })),
                      ),
                    ),
                    // Post Title
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SizedBox(
                        height: height * 0.18,
                        width: width - (width * 0.58),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02),
                              child: RichText(
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                    text: post[position].title.rendered,
                                    style: TextStyle(
                                        color: UniversalVariables
                                            .primaryDodgerBlue,
                                        fontSize: 16.0,
                                        fontFamily: 'FuturaPTBold'),
                                  ),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  // Widget getFeaturedMediaID(List<FeaturedMedia> media, int position) {
  //   print("This is featured media: " + media[position].sourceUrl);
  //   return Image.network(
  //     media[position].sourceUrl,
  //     fit: BoxFit.cover,
  //   );
  // }
}
