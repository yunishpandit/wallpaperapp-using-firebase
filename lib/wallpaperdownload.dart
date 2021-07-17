
import 'dart:isolate';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
class Wallpaperdownload extends StatefulWidget {
 final DocumentSnapshot post;

  const Wallpaperdownload({Key? key,  required this.post}) : super(key: key);

  @override
  _WallpaperdownloadState createState() => _WallpaperdownloadState();
}

class _WallpaperdownloadState extends State<Wallpaperdownload> {
    Future<void> setwallpaper()async{
      int location= WallpaperManagerFlutter.BOTH_SCREENS;
      var file= await DefaultCacheManager().getSingleFile(widget.post["image"]);
      await WallpaperManagerFlutter().setwallpaperfromFile(file, location);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wallpaper set",style: TextStyle(fontWeight: FontWeight.bold),)));


     
    }



  void imagedownload()async{
   final status= await Permission.storage.request();
   if(status.isGranted){
     final externaldict= await getExternalStorageDirectory();
 final id=  await FlutterDownloader.enqueue(url:widget.post["image"], 
 savedDir:externaldict!.path,
   fileName: "${widget.post["name"]}",
   showNotification: true,
   openFileFromNotification: true,

    );
   }else{
     print("Allow preminision");
   }
  }
  int progess=0;
  ReceivePort receivePort=ReceivePort();
  @override
  void initState() {
    IsolateNameServer.registerPortWithName(receivePort.sendPort, "downloading image");
    receivePort.listen((message) { 
      setState(() {
        progess=message;
      });
    });
    super.initState();
    
    FlutterDownloader.registerCallback(download);
  }

 static download(id, status, progress) { 
 SendPort? sendPort= IsolateNameServer.lookupPortByName("downloading image");
 sendPort!.send(progress);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(widget.post["image"]),
          fit: BoxFit.cover
          )
        ),
        child:Stack(
          
          children: [
            Positioned(
              bottom: 5,
              left: 80,
                child: Column(

           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,

           children: [
               InkWell(
                 onTap: () => setwallpaper(),
                  child: Container(

                   height: 40,
                   width: 200,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                   ),
                   child: Center(child: Text("Set Wallpaper",style:TextStyle(fontWeight: FontWeight.bold)
                 ),
                  ))),
                  SizedBox(height: 10,),
                  InkWell(
                 onTap: () => imagedownload(),
                  child: Container(

                   height: 40,
                   width: 200,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                   ),
                   child: Center(child: Text("Download",style:TextStyle(fontWeight: FontWeight.bold)
                 ),
                  )))
           ]
                       
         ),
            ),
            Positioned(
             left: 0,
             top: 10,
              
              child: IconButton(
                color: Colors.black,
                onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back)))
          ],
        )
      ),
      
    );
  }
}