import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/Homepage.dart';
import 'package:travel/introduction.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({ Key? key }) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  
  setvalue()async{
    bool visitedflag= await getvisitingflag();
    setvisitingflag();
    if(visitedflag==true){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
    }else{
  Navigator.push(context, MaterialPageRoute(builder: (context)=>Introscreen()));
    }
   }

@override
  void initState() {
    
    Future.delayed(Duration(seconds: 5),() {
      setvalue();
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset("images/photo.png"),
              ),
           Center(child: Text("Welcome",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),

            ],
          ),
    );
    
  }
}

setvisitingflag()async{
  SharedPreferences preferences= await SharedPreferences.getInstance();
  preferences.setBool("alreadyvisited", true);
}

getvisitingflag()async{
SharedPreferences preferences= await SharedPreferences.getInstance();
bool? alreadyvisited=preferences.getBool("alreadyvisited") ?? false;
return alreadyvisited;

}