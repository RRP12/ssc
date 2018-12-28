import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

        void main()
        {
          runApp(App());
        }
class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final String url="https://newsapi.org/v2/top-headlines?sources=the-times-of-india&apiKey=59f765685b8a4364854ffc3581681cc9" ;

        List data;
        Future  getapi() async{
          var res = await http.get (Uri.encodeFull(url));
        
          setState(() { 
                      var resbody  =json.decode(res.body);
                      data =  resbody ["articles"];
                    });
        print(res.body);
        }
  @override
  Widget build(BuildContext context) {
    if (data==null) {
      return Padding(padding: EdgeInsets.all(16.0),
              child: new CircularProgressIndicator(strokeWidth: 20.0,semanticsLabel: "RRP",
        ),
      );
    } else {
    }
    return new MaterialApp(
       home: Scaffold(
         appBar: AppBar(
           title: new Text("TOP HEADLINES",style: TextStyle(fontSize: 30.0),),
           centerTitle: true,

         ),
         body: PageView(pageSnapping: true,
         
                    children: <Widget>[
    ListView.builder(
      padding: EdgeInsets.all(12.0),
      
      controller: ScrollController(),
      
  
               itemCount: data.length,
  
               itemBuilder: (BuildContext context ,int index){

  
                return new Column(
  
                  crossAxisAlignment: CrossAxisAlignment.stretch,
  
                  mainAxisSize: MainAxisSize.max,
  
                  children: <Widget>[
  
                    Card(
                      shape: Border.all(style: BorderStyle.solid),
                      child: new Container(


        
  
                        child: new Text(data[index]["title"],style: TextStyle(
                          fontStyle: FontStyle.italic,fontWeight: FontWeight.w900,fontSize: 40.0
                        ),
                        
                        
                        ),
                        
                        padding: EdgeInsets.all(40.0),
                        


  
                      ),
                    ),
                    new Text( data[index]["url"],style: TextStyle(
                      fontSize: 30.0,color: Colors.blue
                    ),),
                 Card(
                                    child: new Container(
                    child: new CachedNetworkImage(
                      imageUrl:(data[index]["urlToImage"]),
                     fit: BoxFit.fitHeight,matchTextDirection: true,
                     
                    ),
                   ),
                 ),
               
                  ],
  
                );
  
               }
 
             ),
],
         ),
       ),
    );
   
  }
  @override
   void initState() { 
    super.initState();
    this.getapi();
  }

}