import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:travel/Homepage.dart';


class Introscreen extends StatelessWidget {
  const Introscreen({ Key? key }) : super(key: key);

  List<PageViewModel> getpage(){
    return [
      PageViewModel(
        image: Image.asset("images/space.jpg",),
       title: "BEST WALLPAPER",
       body: "YOU CAN FIND BEST WALLPAER HERE"
      ),
       PageViewModel(
        image: Image.asset("images/download.jpg",),
       title: "NATURAL WALLPAPER",
       body: "AMAZING COLLECTION OF NATURAL WALLPAPER"
      ),
      PageViewModel(
        image: Image.asset("images/hdimage.jpg",),
       title: "4K WALLPAPER",
       body: "AMAZING COLLECTION OF HD WALLPAPER"
      ),
      PageViewModel(
        image: Image.asset("images/vehicles.jpg",),
       title: "QUOTES WALLPAPER",
       body: "STAY MOTIVATED WITH MAIN QUOTES WALLPAPER"
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: IntroductionScreen(
          done: Text("Done"),
          pages: getpage(),
          showNextButton: true,
          next: Text("Next"),
         doneColor: Colors.black,
         nextColor: Colors.black,


         onDone: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage())),
          
        ),
      ),
      
    );
  }
}