import 'package:flutter/material.dart';
import '../../data/repository/postrepo.dart';
import '../postswidget.dart';

class FavoritesPage extends StatelessWidget {
  final containers = posts.map((post) => PostWidget(post)).toList();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.all(15),
                        child: Text('Постов в избранном: 1',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        height: 280,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Image.asset('assets/images/git_courses.jpg')
                                .image,
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(100, 149, 237, 20)
                              .withOpacity(0.4),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              child: Text(
                                'КУРСЫ ПО ГИТ!!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Tahoma',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25))),
                              padding: EdgeInsets.only(right: 10, left: 10),
                              child: Text(
                                'Со следующей недели начинается курс по GitHub, организуемый студентами 2 курса ФИИТ. Они помогут разобраться в азах пользования гитом на практических заданиях. Факультатив будет состоять из 4-5 занятий с вводной лекционной частью и будет проводиться дистанционно. Для закрепления знаний возможны дополнительные задания на дом. Скорее заполняй форму внизу!https://forms.gle/kL4keKG4rNwdcqnX8',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'Tahoma',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(100, 149, 237, 20)
                              .withOpacity(0.4),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ],
        ),
      ),
    );
  }
}
