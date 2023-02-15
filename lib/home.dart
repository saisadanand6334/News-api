import 'package:flutter/material.dart';
import 'package:newsapp/newsapp_model.dart';
import 'package:newsapp/wheatherclass.dart';

import 'more.dart';

class
News extends StatelessWidget {

  Serv Client = Serv();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Color(0xff85194A),
        centerTitle: true,
        title: Text(
          "News Today",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
      ),
      drawer: Drawer(),
      body: FutureBuilder<List<Article>>(
        future: Client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  var article = snapshot.data![index];
                  return Column(children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Detail(article),
                            ));
                      },
                      child: Column(
                        children: [
                          snapshot.data![index].urlToImage != null
                              ? Container(
                                  height: 300,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(snapshot
                                            .data![index].urlToImage
                                            .toString()),
                                        fit: BoxFit.cover),
                                  ),
                                )
                              : Container(
                                  // height: 100,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage('https://www.google.com/imgres?imgurl=https%3A%2F%2Fimg.olympicchannel.com%2Fimages%2Fimage%2Fprivate%2Ft_social_share_thumb%2Ff_auto%2Fprimary%2Fpyqaawxxfwzeiib35hsm&imgrefurl=https%3A%2F%2Folympics.com%2Fen%2Fnews%2Fuefa-champions-league-ucl-winners-list-football-club-teams&tbnid=0v8CELX8fa0ZvM&vet=12ahUKEwi1iZyrg4j9AhVxxXMBHfdjDgoQMygAegUIARC5AQ..i&docid=eUEjw46ZDUnYUM&w=1200&h=630&q=real%20madrid%20champions%20league%20wins&ved=2ahUKEwi1iZyrg4j9AhVxxXMBHfdjDgoQMygAegUIARC5AQ'),
                                          fit: BoxFit.cover),
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                          SizedBox(height: 10,),
                          Container(decoration: BoxDecoration(

                          ),
                          child: Text(snapshot.data![index].tittle.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),)
                        ],
                      ),
                    ),
                  ]);
                },
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
