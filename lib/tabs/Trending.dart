
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:travel/wallpaperdownload.dart';
class Trending extends StatefulWidget {
  const Trending({ Key? key }) : super(key: key);

  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  
  navigatordetailes(DocumentSnapshot post){
 Navigator.push(context, MaterialPageRoute(builder: (context)=>Wallpaperdownload(post: post)));
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection("Popular").snapshots(),
        builder:(_, snapshot){
          if(snapshot.hasError){
            return Text('Error = ${snapshot.error}');
            
          } 
          if(snapshot.hasData){
            final docs=snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount:docs.length,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5,
                  mainAxisExtent: 200,
                  childAspectRatio: 30,
                  crossAxisCount: 3) ,
               itemBuilder:(_, i){
                  final data=docs[i].data();
                    return Hero(
                      tag: data["image"],
                      child: InkWell(
                      onTap: () => navigatordetailes(docs[i]),
                         child: Container(
                          height: 600,
                          width: 80,
                          decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color: Colors.grey,
                            image: DecorationImage(
                              image: NetworkImage(data["image"]),
                              fit: BoxFit.cover
                            )
                          ),
                          
                        ),
                      ),
                    );
               } ),
            );

          }else{
            Center(
              child: CircularProgressIndicator()
            );
          }
          return Center(
            child: CircularProgressIndicator()
          );
        }
      ),
      );
    
  }
}