import 'package:flutter/material.dart';
import 'package:newsapp/newsapp_model.dart';

class Detail extends StatelessWidget {
  final Article articles;
  Detail(this.articles);
  // const Detail({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Color(0xff6EB2D5),
      title: Text(articles.urlToImage.toString()),
      elevation: 0,
    ),
      backgroundColor: Color(0xff6EB2D5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [articles.urlToImage!=null?
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: 300,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(articles.urlToImage.toString()),
                          fit: BoxFit.fill)),
                ),
              ):
              Container(
                // height: 100,
                width: double.maxFinite,
                decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.resfu.com%2Fmedia%2Fimg_news%2Freal-madrid--champions-league-winner-2021-22--besoccer.jpg%3Fsize%3D1000x%26lossy%3D1&imgrefurl=https%3A%2F%2Fwww.besoccer.com%2Fnew%2Freal-madrid-win-their-14th-champions-league-1144493&tbnid=stFvu30XrhgPZM&vet=12ahUKEwi1iZyrg4j9AhVxxXMBHfdjDgoQMygDegUIARC_AQ..i&docid=8kdFazquXmXS5M&w=1000&h=563&q=real%20madrid%20champions%20league%20wins&ved=2ahUKEwi1iZyrg4j9AhVxxXMBHfdjDgoQMygDegUIARC_AQ'),
                fit: BoxFit.cover),

                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                // height: 100,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(articles.tittle.toString()
                 ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
              ),
              SizedBox(height: 8,),
              Text(articles.description.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
