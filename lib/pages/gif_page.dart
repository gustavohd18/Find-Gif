import 'package:find_gif/model/gif.dart';
import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
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
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              ImageDownloader.downloadImage(_gif.source);
              Share.share(_gif.source);
            },
          )
        ],
      ),
      body: Column(
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
                iconSize: 18,
                onPressed: () {
                  Share.share(_gif.source);
                },
              ),
              IconButton(
                icon: Icon(Icons.file_download),
                color: Colors.white,
                iconSize: 18,
                onPressed: ()  {
                  //for now dowload just work with android devices
                   ImageDownloader.downloadImage(_gif.source);
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
