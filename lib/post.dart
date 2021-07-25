import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';


Future<List<Album>> fetchAlbum() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new Album.fromJson(data)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
class Album {
  late int userId;
  late int id;
  late String title;
  late String body;

  Album({required this.userId, required this.id, required this.title, required this.body});

  Album.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}



class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  late Future<List<Album>> futureAlbum;
  late bool onpresss = true;
  late bool isSaved = true;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body:
      FutureBuilder<List<Album>>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Album>? data = snapshot.data;
            return
              ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return   Container(margin: EdgeInsets.all(10),
                      child: Card(
                        child: Container(padding: EdgeInsets.all(20),
                          child: Column(
                            children: [

                              Row(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Title: ',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Expanded(
                                    child: Container(width: MediaQuery.of(context).size.width,
                                      child:  Text(data[index].title),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Body: ',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Expanded(
                                    child: Container(width: MediaQuery.of(context).size.width,
                                      child:  Text(data[index].body),
                                    ),
                                  ),
                                ],
                              ),




                              // Container(height: 20,
                              //   child: FutureBuilder<List<Users>>(
                              //     future: futureUser,
                              //     builder: (context, snapshot) {
                              //       if (snapshot.hasData) {
                              //         List<Users>? data = snapshot.data;
                              //         return ListView.builder(
                              //             itemCount: data!.length,
                              //             itemBuilder: (BuildContext context, int index) { return Container(
                              //                 margin: EdgeInsets.symmetric(
                              //                     horizontal: 15, vertical: 5),
                              //                 alignment: Alignment.centerLeft,
                              //                 child: GestureDetector(
                              //
                              //                   child: onpresss?Text('View all Comments',
                              //                       style: TextStyle(color: Colors.grey)):
                              //                   Row(
                              //                     children: [
                              //                       Text(data[index].username,
                              //                           style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                              //                       SizedBox(width: 5,),
                              //                       Text(data[index].comments,
                              //                           style: TextStyle(color: Colors.black)),
                              //                     ],
                              //                   )
                              //
                              //                   ,onTap: (){
                              //                   setState(() {
                              //                     onpresss=!onpresss;
                              //                   });
                              //                 },
                              //                 ));}
                              //         );
                              //       } else if (snapshot.hasError) {
                              //         return Text("${snapshot.error}");
                              //       }return CircularProgressIndicator();
                              //     },
                              //
                              //
                              //
                              //   ),
                              // )

                            ],
                          ),
                        ) ,
                      ),
                    );


                  }
              );
          }
          else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),


    );
  }
}
