import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:expandable/expandable.dart';

import '../domain/modle/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  PostWidget(this.post);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        children: <Widget>[
          Container(
            height: 15,
          ),
          //HeroWidget(imagtag: ..., img: ...),
          GestureDetector(
              child: Hero(
                tag: 'photo' + post.title,
                child: Image.asset(post.image),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return DetailScreen(
                      postTag: 'photo' + post.title, postImage: post.image);
                }));
              }
              // Container(
              //   height: 280,
              //   decoration: BoxDecoration(
              //     //Заменить На HeroPhotoWidjet

              //     image: DecorationImage(
              //       image: Image.asset(post.image).image,
              //       fit: BoxFit.fill,
              //     ),
              //     //borderRadius: BorderRadius.only(
              //     //topLeft: Radius.circular(25.0),
              //     // topRight: Radius.circular(25.0),
              //     // ),
              //   ),
              // ),),
              ),
          Container(
            decoration: BoxDecoration(
              color:
                  //Colors.white
                  //Color.fromRGBO(30, 30, 30, 10) vk
                  Color.fromRGBO(50, 50, 51, 20).withOpacity(0.9),
            ),
            child: Column(
              children: [
                // Container(
                //   padding: EdgeInsets.only(top: 15, bottom: 15),
                //   child: Text(
                //     post.title,
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //         fontFamily: 'Tahoma',
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.white),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.only(right: 10, left: 10, top: 10),
                  child: ExpandablePanel(
                    iconColor: Colors.white, //не удалять
                    header: Text(
                      post.title,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      textAlign: TextAlign.left,
                    ),
                    collapsed: Text(
                      post.text,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      softWrap: true,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Text(
                      post.text,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      softWrap: true,
                    ),
                    tapHeaderToExpand: true,
                    hasIcon: true,
                    // Text(
                    //   post.text,
                    //   textAlign: TextAlign.left,
                    //   style: TextStyle(
                    //       fontFamily: 'Tahoma',
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.normal,
                    //       color: Colors.white),
                    // ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 34,
            child: FavouriteWidget(),
            decoration: BoxDecoration(
              color: Color.fromRGBO(50, 50, 51, 20).withOpacity(0.9),
              //Colors.white,
              //Color.fromRGBO(30, 30, 30, 10)
              //Color.fromRGBO(100, 149, 237, 20).withOpacity(0.4),
              //borderRadius: BorderRadius.only(
              // bottomLeft: Radius.circular(25.0),
              // bottomRight: Radius.circular(25.0),
              //),
            ),
          ),
        ],
      ),
    );
  }
}

class FavouriteWidget extends StatefulWidget {
  @override
  _FavouriteWidgetState createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      alignment: Alignment.centerRight,
      //margin: EdgeInsets.only(bottom: 15, right: 10, left: 260),
      child: IconButton(
        icon: (_isFavorited
            ? Icon(Icons.star, size: 25)
            : Icon(Icons.star_border, size: 25)),
        onPressed: _tapFavorite,
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 5),
      ),
    );
  }

  void _tapFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }
}

class DetailScreen extends StatelessWidget {
  final String postTag;
  final String postImage;
  DetailScreen({this.postTag, this.postImage});

  @override
  //Duration get transitionDuration => const Duration(milliseconds: 1000);
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: this.postTag,
            child: Image.asset(postImage),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
