import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(

        padding: EdgeInsets.only(bottom: 20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/home.png',scale: 2.5,),Image.asset('assets/new.png',scale: 3.9,),Image.asset('assets/you.png',scale: 3.9,),
          ],
        ),
      ),
     body: Container(padding: EdgeInsets.all(40),
       child: SingleChildScrollView(
         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   children: [
                     Image.asset('assets/menu.png',scale: 3.2,),
                     SizedBox(width: 20,),
                     Text('Home',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)
                   ],
                 ),
                 Row(
                   children: [
                     Image.asset('assets/se.png',scale: 2.9,),
                     SizedBox(width: 10,),
                     Image.asset('assets/dp.png',scale: 1.5,),
                   ],
                 )
               ],
             ),
             SizedBox(height: 20,),
             Container(
                 margin: EdgeInsets.symmetric(vertical: 30),
                 child: Text('Featured Articles',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                 children: [
                   Container(height: 290,width: 200,
                     decoration: BoxDecoration(color: Colors.white,
                       borderRadius: BorderRadius.circular(20),
                       image: DecorationImage(
                         image: AssetImage('assets/dp1.jpg',),fit: BoxFit.cover
                       )
                     ),
                     child: Container(height: 40,alignment: Alignment.bottomCenter,

                       child: Container(
                         padding: EdgeInsets.all(15),
                         decoration: BoxDecoration(
                           gradient: LinearGradient(
                               begin: Alignment.topLeft,
                               end:
                               Alignment(0.005, 0.5), // 10% of the width, so there are ten blinds.
                               colors: <Color>[
                                 Colors.white,
                                 Color(0xff1024ED),
                               ], ),

                             borderRadius: BorderRadius.circular(20),),
                           width: 200,height:110,child:

                       Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text('5 Minutes of Daily Yoga',style: TextStyle(
                             color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold
                           ),),
                           Row(mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Text('Read Now',style: TextStyle(
                                 color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500
                               ),),
                               SizedBox(width: 20,),
                               Container(padding: EdgeInsets.all(6),
                                 decoration: BoxDecoration(
color: Colors.white,
                                   borderRadius: BorderRadius.circular(99),),
                                 child: Image.asset('assets/star.png',scale: 2.5,),
                               )
                             ],
                           ),
                         ],
                       )),
                     ),
                   ),
                   SizedBox(width: 20,),
                   Container(height: 290,width: 200,
                     decoration: BoxDecoration(color: Colors.white,
                         borderRadius: BorderRadius.circular(20),
                         image: DecorationImage(
                             image: AssetImage('assets/dp2.png',),fit: BoxFit.cover
                         )
                     ),
                     child: Container(height: 40,alignment: Alignment.bottomCenter,

                       child: Container(
                           padding: EdgeInsets.all(15),
                           decoration: BoxDecoration(
                             gradient: LinearGradient(
                               begin: Alignment.topLeft,
                               end:
                               Alignment(0.005, 0.5), // 10% of the width, so there are ten blinds.
                               colors: <Color>[
                                 Colors.white,
                                 Color(0xff1024ED),
                               ], ),

                             borderRadius: BorderRadius.circular(20),),
                           width: 200,height:110,child:

                       Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text('5 Minutes of Daily Yoga',style: TextStyle(
                               color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold
                           ),),
                           Row(mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Text('Read Now',style: TextStyle(
                                   color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500
                               ),),
                               SizedBox(width: 20,),
                               Container(padding: EdgeInsets.all(6),
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(99),),
                                 child: Image.asset('assets/star.png',scale: 2.5,),
                               )
                             ],
                           ),
                         ],
                       )),
                     ),
                   ),SizedBox(width: 20,),
                   Container(height: 290,width: 200,
                     decoration: BoxDecoration(color: Colors.white,
                         borderRadius: BorderRadius.circular(20),
                         image: DecorationImage(
                             image: AssetImage('assets/dp3.jpg',),fit: BoxFit.cover
                         )
                     ),
                     child: Container(height: 40,alignment: Alignment.bottomCenter,

                       child: Container(
                           padding: EdgeInsets.all(15),
                           decoration: BoxDecoration(
                             gradient: LinearGradient(
                               begin: Alignment.topLeft,
                               end:
                               Alignment(0.005, 0.5), // 10% of the width, so there are ten blinds.
                               colors: <Color>[
                                 Colors.white,
                                 Color(0xff1024ED),
                               ], ),

                             borderRadius: BorderRadius.circular(20),),
                           width: 200,height:110,child:

                       Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text('5 Minutes of Daily Yoga',style: TextStyle(
                               color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold
                           ),),
                           Row(mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Text('Read Now',style: TextStyle(
                                   color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500
                               ),),
                               SizedBox(width: 20,),
                               Container(padding: EdgeInsets.all(6),
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(99),),
                                 child: Image.asset('assets/star.png',scale: 2.5,),
                               )
                             ],
                           ),
                         ],
                       )),
                     ),
                   ),
                 ],
               ),
             ),




             SizedBox(height: 20,),
             Container(
                 margin: EdgeInsets.symmetric(vertical: 30),
                 child: Text('Featured Videos',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                 children: [
                   Container(height: 180,width: 280,
                     decoration: BoxDecoration(color: Colors.white,
                         borderRadius: BorderRadius.circular(20),
                         image: DecorationImage(
                             image: AssetImage('assets/dp1.jpg',),fit: BoxFit.cover
                         )
                     ),
                     child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(height: 60,alignment: Alignment.topLeft,

                           child: Container(
                               padding: EdgeInsets.all(5),
                               decoration: BoxDecoration(
                                 gradient: LinearGradient(
                                   begin: Alignment.topLeft,
                                   end:
                                   Alignment(0.005, 0.5), // 10% of the width, so there are ten blinds.
                                   colors: <Color>[
                                     Colors.white,
                                     Color(0xff1024ED),
                                   ], ),

                                 borderRadius: BorderRadius.only(bottomRight:Radius.circular(20),topLeft:Radius.circular(20), ),),
                               width: 70,height:30,child:

                           Column(mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text('01:25:00',style: TextStyle(
                                   color: Colors.white,fontSize: 11,fontWeight: FontWeight.bold
                               ),),

                             ],
                           )),
                         ),
                         Container(padding: EdgeInsets.all(6),
                     margin: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(99),),
                           child: Image.asset('assets/star.png',scale: 2.5,),
                         )
                       ],
                     ),
                   ),
                   SizedBox(width: 20,),
                   Container(height: 180,width: 280,
                     decoration: BoxDecoration(color: Colors.white,
                         borderRadius: BorderRadius.circular(20),
                         image: DecorationImage(
                             image: AssetImage('assets/dp1.jpg',),fit: BoxFit.cover
                         )
                     ),
                     child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(height: 60,alignment: Alignment.topLeft,

                           child: Container(
                               padding: EdgeInsets.all(5),
                               decoration: BoxDecoration(
                                 gradient: LinearGradient(
                                   begin: Alignment.topLeft,
                                   end:
                                   Alignment(0.005, 0.5), // 10% of the width, so there are ten blinds.
                                   colors: <Color>[
                                     Colors.white,
                                     Color(0xff1024ED),
                                   ], ),

                                 borderRadius: BorderRadius.only(bottomRight:Radius.circular(20),topLeft:Radius.circular(20), ),),
                               width: 70,height:30,child:

                           Column(mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text('01:25:00',style: TextStyle(
                                   color: Colors.white,fontSize: 11,fontWeight: FontWeight.bold
                               ),),

                             ],
                           )),
                         ),
                         Container(padding: EdgeInsets.all(6),
                     margin: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(99),),
                           child: Image.asset('assets/star.png',scale: 2.5,),
                         )
                       ],
                     ),
                   ),                   SizedBox(width: 20,),
                   Container(height: 180,width: 280,
                     decoration: BoxDecoration(color: Colors.white,
                         borderRadius: BorderRadius.circular(20),
                         image: DecorationImage(
                             image: AssetImage('assets/dp1.jpg',),fit: BoxFit.cover
                         )
                     ),
                     child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(height: 60,alignment: Alignment.topLeft,

                           child: Container(
                               padding: EdgeInsets.all(5),
                               decoration: BoxDecoration(
                                 gradient: LinearGradient(
                                   begin: Alignment.topLeft,
                                   end:
                                   Alignment(0.005, 0.5), // 10% of the width, so there are ten blinds.
                                   colors: <Color>[
                                     Colors.white,
                                     Color(0xff1024ED),
                                   ], ),

                                 borderRadius: BorderRadius.only(bottomRight:Radius.circular(20),topLeft:Radius.circular(20), ),),
                               width: 70,height:30,child:

                           Column(mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text('01:25:00',style: TextStyle(
                                   color: Colors.white,fontSize: 11,fontWeight: FontWeight.bold
                               ),),

                             ],
                           )),
                         ),
                         Container(padding: EdgeInsets.all(6),
                     margin: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(99),),
                           child: Image.asset('assets/star.png',scale: 2.5,),
                         )
                       ],
                     ),
                   ),

                 ],
               ),
             ),

           ],
         ),
       ),
     ),

    );
  }
}
