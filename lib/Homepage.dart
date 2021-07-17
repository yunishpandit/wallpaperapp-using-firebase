import 'package:flutter/material.dart';
import 'package:travel/Search.dart';
import 'package:travel/drawer.dart';
import 'package:travel/tabs/Catogery.dart';
import 'package:travel/tabs/Exclusive.dart';
import 'package:travel/tabs/Trending.dart';
import 'package:travel/tabs/Wallpaper.dart';

class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Colors.white,
        title: Text("Wallpaper",style: TextStyle(color: Colors.black),),
        bottom: TabBar(
          isScrollable: true,
          automaticIndicatorColorAdjustment: true,
          indicatorColor: Colors.black,
          physics: BouncingScrollPhysics(),
          labelColor: Colors.black,
          tabs: [
          Tab(
          
            text: "Trending",),
          Tab(text: "Category",),
          Tab(text: "Wallpaper",),
          Tab(text: "Exclusive",)
        ],),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
          }, icon: Icon(Icons.search))
        ],
        ),
        drawer: Mydrawer(),
        body: TabBarView(children: [
          Trending(),
          Catogery(),
          Wallpaper(),
          Exclusive()
        ],),

      ),
      length: 4,
      initialIndex: 0,

    );
  }
}