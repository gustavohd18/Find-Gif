import 'package:find_gif/model/gif.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class GifPage extends StatelessWidget {

  final GIF _gif;
  GifPage(this._gif);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(_gif.title,
          style: TextStyle(color: Colors.white)
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){
              Share.share(_gif.source);
            },
          )
        ],
      ),
      body: Center(
        child: Image.network(_gif.source),
      ),
      backgroundColor: Colors.black,
    );
  }
}
