import 'dart:io';

import 'package:flutter/material.dart';
import 'package:travel/introduction.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Container(
         child: ListView(
           children: [
              DrawerHeader(
                
                child:Image(image:AssetImage("images/photo.png") ) ),
                 ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text("My Favorite"),
                  onTap: (){},
                ),
                 ListTile(
                  leading: Icon(Icons.share),
                  title: Text("Share"),
                  onTap: (){},
                ),
                 ListTile(
                  leading: Icon(Icons.mobile_screen_share),
                  title: Text("App tour"),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Introscreen()));
                  },
                ),
                 ListTile(
                  leading: Icon(Icons.person),
                  title: Text("About"),
                  onTap: (){},
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Exit"),
                  onTap: (){
                  showDialog(context: context, builder: (BuildContext context){
                   return AlertDialog(
                     title: Text("Are you sure to exit"),
                     actions: [
                       TextButton(onPressed: (){
                         exit(0);
                       }, child: Text("Yes")),
                       TextButton(onPressed: (){
                         Navigator.pop(context);
                       }, child: Text("No"))
                     ],
                   );
                  });
                  },
                )
           ],
         ),
      ),
      
    );
  }
}