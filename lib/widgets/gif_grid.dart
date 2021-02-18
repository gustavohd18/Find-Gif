import 'package:find_gif/pages/gif_page.dart';
import 'package:find_gif/widgets/plus_button.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class GifGrid extends StatelessWidget {
  final String _search;
  final Function _handleWithPlusButton;
  final AsyncSnapshot _snapshot;

  GifGrid(this._search, this._snapshot, this._handleWithPlusButton);

  int _getCount(List data) {
    if (_search == null && data != null) {
      return data.length;
    } else if (data == null && _search == null) {
      return 0;
    } else {
      return data.length + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
        itemCount: _getCount(_snapshot.data),
        itemBuilder: (context, index) {
          if (_search == null || index < _snapshot.data.length) {
            return GestureDetector(
              child: FadeInImage.memoryNetwork(
                image: _snapshot.data[index].source,
                placeholder: kTransparentImage,
                height: 300.0,
                fit: BoxFit.cover,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GifPage(_snapshot.data[index])));
              },
              onLongPress: () {
                Share.share(_snapshot.data[index].source);
              },
            );
          } else {
            return PlusButton(_handleWithPlusButton);
          }
        });
  }
}
