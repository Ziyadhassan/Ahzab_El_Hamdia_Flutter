import 'package:ahzab_el_hamdia/UI/Werd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:video_player/video_player.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> categories = ["أحزاب", "انشاد"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new RaisedButton(
                    onPressed: () {},
                    child: new Text("أحزاب",
                        textDirection: TextDirection.rtl,
                        style: new TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black87)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    height: 3,
                    width: 50,
                    color: Colors.black12,
                  ),
                ],
              ),
              new Column(
                children: <Widget>[
                  new RaisedButton(
                    color: Colors.white54,
                    onPressed: () {},
                    child: new Text("انشاد",
                        textDirection: TextDirection.rtl,
                        style: new TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black87)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    height: 3,
                    width: 50,
                    color: Colors.black12,
                  ),
                ],
              ),
            ],
          ),
          new StaggeredGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 10,
            children: <Widget>[
              new RaisedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Werd()));
              },
                child: new Text("الورد الحامدي"),
              )
            ],
          ),
        ]);
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["أحزاب", "انشاد"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => {
                  setState(() {
                    selectedIndex = index;
                  })
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        categories[index],
                        style: new TextStyle(
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.w300,
                            color: Colors.black87),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 3,
                        width: 50,
                        color: selectedIndex == index
                            ? Colors.black
                            : Colors.black12,
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}

// Icons that was in home Screen
/*    IconButton(
                icon: new Icon(
                  Icons.book,
                  color: Night_Mode
                      ? _pageSelected == 0
                          ? Color.fromRGBO(20, 100, 90, 1)
                          : Color.fromRGBO(20, 200, 90, 1)
                      : _pageSelected == 0
                          ? Color.fromRGBO(32, 96, 101, 1)
                          : Colors.black,
                  size: _pageSelected == 0 ? 25 : 20,
                ),
                onPressed: () {
                  setState(() {
                    _pageSelected = 0;
                    _pageController.animateToPage(0,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.linear);
                  });
                },
              ),
              IconButton(
                icon: new Icon(
                  Icons.volume_up,
                  color: Night_Mode
                      ? _pageSelected == 1
                          ? Color.fromRGBO(98, 71, 136, 1)
                          : Color.fromRGBO(150, 71, 150, 1)
                      : _pageSelected == 1
                          ? Color.fromRGBO(155, 70, 180, 1)
                          : Colors.black,
                  size: _pageSelected == 1 ? 25 : 20,
                ),
                onPressed: () {
                  setState(() {
                    _pageSelected = 1;
                    _pageController.animateToPage(1,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.linear);
                  });
                },
              ),
*/

// Old Desgin
/*
class bt extends StatefulWidget {
  @override
  _btState createState() => _btState();
}

class _btState extends State<bt> {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("أحزاب الحامدية"),
          backgroundColor: Color.fromRGBO(32, 96, 101, 1),
          centerTitle: true,
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: new Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.all(10),
                  child: new ButtonTheme(
                      minWidth: 150.0,
                      height: 150.0,
                      child: new RaisedButton(
                        color: Color.fromRGBO(32, 96, 101, 1),
                        child: new Text(
                          "الجوهرة",
                          textDirection: TextDirection.rtl,
                          style: new TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AlGawhra()));
                        },
                      )),
                ),
                new Container(
                  margin: EdgeInsets.all(10),
                  child: new ButtonTheme(
                      minWidth: 150.0,
                      height: 150.0,
                      child: new RaisedButton(
                        color: Color.fromRGBO(32, 96, 101, 1),
                        child: new Text(
                          "الورد",
                          textDirection: TextDirection.rtl,
                          style: new TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Werd()));
                        },
                      )),
                ),
                new Container(
                  margin: EdgeInsets.all(10),
                  child: new ButtonTheme(
                      minWidth: 150.0,
                      height: 150.0,
                      child: new RaisedButton(
                        color: Color.fromRGBO(32, 96, 101, 1),
                        child: new Text(
                          "حزب البر",
                          textDirection: TextDirection.rtl,
                          style: new TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AlBr()));
                        },
                      )),
                ),
                new Container(
                  margin: EdgeInsets.all(10),
                  child: new ButtonTheme(
                      minWidth: 150.0,
                      height: 150.0,
                      child: new RaisedButton(
                        color: Color.fromRGBO(32, 96, 101, 1),
                        child: new Text(
                          "حزب البحر",
                          textDirection: TextDirection.rtl,
                          style: new TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AlBhr()));
                        },
                      )),
                ),
                new Container(
                  margin: EdgeInsets.all(10),
                  child: new ButtonTheme(
                      minWidth: 150.0,
                      height: 150.0,
                      child: new RaisedButton(
                        color: Color.fromRGBO(32, 96, 101, 1),
                        child: new Text(
                          "فيديو",
                          textDirection: TextDirection.rtl,
                          style: new TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Werd()));
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

// For the Custom VideoPlayer
/*class video extends StatefulWidget {
  @override
  _videoState createState() => _videoState();
}

class _videoState extends State<video> {
  String drive = "https://drive.google.com/uc?export=download&id=11oXtXYvMEojgRnsOIy0KEpbYcop70bK3";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Video"),
          centerTitle: true,
        ),
        body: new OwnVideoPlayer(
          videoPlayerController: VideoPlayerController.network(
              "https://dl.dropboxusercontent.com/s/qqot9pp9n2zie4b/Dount%20Slide.mp4"),
          lopping: true,
        ));
  }
}
*/


/*
child: new RaisedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          },
          child: new Text(
            text,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Night_Mode ? Colors.white : Colors.black),
          ),
          color: Night_Mode
              ? Color.fromRGBO(20, 100, 90, 1)
              : Color.fromRGBO(32, 96, 101, 1),
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.green)),
        ),
 */
