import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel/wallpaperdownload.dart';

class Search extends StatefulWidget {
  const Search({ Key? key }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _controller=TextEditingController();
  String _issearch="";
   navigatordetailes(DocumentSnapshot post){
 Navigator.push(context, MaterialPageRoute(builder: (context)=>Wallpaperdownload(post: post)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            
        child: Stack(children: [
          if(_issearch.isEmpty)
            Center(child: Text("Search here",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
          else
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection("Wallpaper").orderBy("name").startAt([_issearch]).endAt(["$_issearch\uf8ff"]).snapshots(),
          builder:(_, snapshot){
            if(snapshot.hasError){
              return Text('Error = ${snapshot.error}');
              
            } 
            if(snapshot.hasData){
              final docs=snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 80),
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
                      return  InkWell(
                        onTap: () =>navigatordetailes(docs[i])

                        ,
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
                        
                      );
                 } ),
              );

            }
            return Center(
              child: CircularProgressIndicator()
            );
          }
        ),

         Padding(
            padding: const EdgeInsets.only(
              top: 45.0,
              left: 10
            ),
            child: Card(
              elevation: 13,
                          child: TextField(
                            controller: _controller,
                onSubmitted: (value) {
                  setState(() {
                    _issearch = value;
                  });
                },
                decoration:InputDecoration(
                 prefixIcon: IconButton(onPressed: (){
                   Navigator.pop(context);
                 }, icon: Icon(Icons.arrow_back)),
                  suffixIcon: IconButton(onPressed: ()=>_controller.clear(), 
                  icon: Icon(Icons.clear)),

                  border: InputBorder.none,
                  hintText: "Search here"
                ) ,
              ),
            ),
          ),
        
      
    
        ],),
        
      ),
    );
  }
}