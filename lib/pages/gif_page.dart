import 'package:find_gif/model/gif.dart';
import 'package:find_gif/service/api.dart';
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
        title: Text(_gif.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(_gif.source),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.share),
                color: Colors.white,
                iconSize: 22,
                onPressed: () {
                  Share.share(_gif.source);
                },
              ),
              IconButton(
                icon: Icon(Icons.file_download),
                color: Colors.white,
                iconSize: 22,
                onPressed: () {
                  //for now dowload just work with android devices
                 downloadImage(_gif.source);
                },
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
