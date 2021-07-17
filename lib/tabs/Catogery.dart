import 'package:flutter/material.dart';
import 'package:travel/pages/Abstract.dart';
import 'package:travel/pages/Space.dart';
import 'package:travel/pages/flowers.dart';
import 'package:travel/pages/nature.dart';
import 'package:travel/pages/vehicles.dart';

class Catogery extends StatefulWidget {
  const Catogery({ Key? key }) : super(key: key);

  @override
  _CatogeryState createState() => _CatogeryState();
}
 
class _CatogeryState extends State<Catogery> {
  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(10.0),
     child: GridView(
       
       gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisSpacing: 10,
         mainAxisSpacing: 10,
         crossAxisCount: 2) ,
       children: [
         Listcatogery(
           name: "Nature",image: "images/nature1.jpg",
         ),
         Listcatogery(
           name: "Vehicles",image: "images/vehicles.jpg",
         ),
         Listcatogery(
           name: "Space",image: "images/space.jpg",
         ),
         Listcatogery(
           name: "Flowers",image: "images/flowers.jpg",
         ),
         Listcatogery(
           name: "Abstract",image: "images/abstract.jpg",
         ),

       ],
     ),
   );
    
  }
}
class Listcatogery extends StatelessWidget {
  final name;
  final image;

  const Listcatogery({Key? key, this.name, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(name=="Nature"){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Nature()));
        }else if(name=="Flowers"){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Flowers()));

        }else if(name=="Space"){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Space()));

        }else if(name=="Vehicles"){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Vehicles()));

        }else if(name=="Abstract"){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Abstarct()));

        }
      },
          child: Container(
        
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage("$image"),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("$name",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
