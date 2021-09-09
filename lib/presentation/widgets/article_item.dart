import 'package:egypt_news/data/model/article_model.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  final ArticleModel article;

  ArticleItem({required this.article});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color:Colors.grey[300],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          //mainAxisSize: MainAxisSize.max,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
                height: 120.0,
                width: 120.0,
                image:AssetImage('assets/images/running2.jpg',
                )),
            SizedBox(width: 5.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.max,
              children:[
                Row(
                  children: [
                    Text('News Title',
                      style: TextStyle(
                        fontSize:13.0,
                        color: Colors.deepOrange[700],
                      ),
                    ),
                  ],
                ),
                SizedBox(height:9.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text('Your Full Marathun Training \n'
                        'plan- 20Weeks ',
                      // textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),),
                    SizedBox(height: 10.0,),
                    Row(
                      children: [
                        Icon(Icons.date_range,
                          size: 14.0,
                          color: Colors.deepOrange,),
                        SizedBox(width: 5.0,),
                        Text('May 12- 2021 ',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 11.0
                          ),),
                      ],
                    ),
                    SizedBox(height: 7.0,),

                  ],

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
