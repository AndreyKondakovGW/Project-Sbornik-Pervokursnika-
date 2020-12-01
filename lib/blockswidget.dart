import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'block.dart';
//import 'package:menu_of_collection/block.dart';

class BlockWidget extends StatelessWidget {
  final Block block;
  final int index;
  BlockWidget(this.block, this.index);
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () => {Navigator.pushNamed(context, '/block/$index')},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset(block.image).image,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            height: 40,
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Text(block.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                )),
          ),
        
        ],

      ),
    );
  }
}
