import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';


// Future<List<Album>> fetchAlbum() async {
//   final response =
//   await http.get(Uri.parse('https://hiit.ria.rocks/videos_api/cdn/com.rstream.crafts?versionCode=40&lurl=Canvas%20painting%20ideas'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     List jsonResponse = json.decode(response.body);
//     return jsonResponse.map((data) => new Album.fromJson(data)).toList();
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// class Album {
//   late String id;
//   late String channelname;
//   late String title;
//   late String highThumbnail;
//   late String lowThumbnail;
//
//
//   Album(
//       {required this.id,
//         required this.channelname,
//         required this.title,
//         required this.highThumbnail,
//         required this.lowThumbnail,
//       });
//
//   Album.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     channelname = json['channelname'];
//     title = json['title'];
//     highThumbnail = json['high thumbnail'];
//     lowThumbnail = json['low thumbnail'];
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['channelname'] = this.channelname;
//     data['title'] = this.title;
//     data['high thumbnail'] = this.highThumbnail;
//     data['low thumbnail'] = this.lowThumbnail;
//
//     return data;
//   }
// }

Future<List<Users>> fetchUser() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new Users.fromJson(data)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
class Users {
  late int albumId;
  late int id;
  late String title;
  late String url;
  late String thumbnailUrl;

  Users({required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl});

  Users.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Users>> futureUser;
  late bool onpresss = true;
  late bool isSaved = true;
  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body:
      FutureBuilder<List<Users>>(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Users>? data = snapshot.data;
            return
              ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return   Column(
                      children: [
                        ListTile(contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 2),
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            backgroundImage: NetworkImage(data[index].thumbnailUrl),
                            radius: 18,
                          ),
                          title: Text(data[index].title,style: TextStyle(fontWeight: FontWeight.bold),),
                          trailing: Icon(Icons.more_vert,color: Colors.black,),

                        ),
                        Container(height: 250,width: MediaQuery.of(context).size.width,
                          child:  Image.network(data[index].url,fit: BoxFit.cover,),
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
