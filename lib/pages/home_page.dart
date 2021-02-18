import 'package:find_gif/service/api.dart';
import 'package:find_gif/widgets/gif_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

import 'gif_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset = 0;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Find GIF", style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Pesquisar",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder()
              ),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.start,
              onSubmitted: (text) {
                  setState(() {
                    _search = text;
                    _offset = 0;
                  });
                },
            ),
          ),
          Expanded(
            child: GifList(searchGIfs(_search,_offset),_search, () => _offset+=19)
            ),
        ],
      ),
    );
  }

  int _getCount(List data){
    if (_search == null){
      return data.length;
    }
    else {
      return data.length + 1;
    }
  }

  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot){
    return GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0
        ),
        itemCount: _getCount(snapshot.data),
        itemBuilder: (context, index){
          if (_search == null || index < snapshot.data.length){
            return GestureDetector(
              child: FadeInImage.memoryNetwork(
                image: snapshot.data[index].source,
                  placeholder: kTransparentImage,
                  height: 300.0,
                  fit: BoxFit.cover,
              ),
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GifPage(snapshot.data[index]))
                );
              },
              onLongPress: (){
                Share.share(snapshot.data[index].source);
              },
            );
          } else {
            return Container(
              child: GestureDetector(
                child: Icon(Icons.add, color: Colors.white, size: 70.0),
                onTap: (){
                  setState(() {
                    _offset += 19;
                  });
                },
              ),
            );
          }
        }
    );
  }
}
