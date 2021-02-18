import 'package:find_gif/model/gif.dart';
import 'package:flutter/material.dart';

class GifList extends StatelessWidget {
  final Future<List<GIF>> _gifs;
  GifList(this._gifs);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _gifs,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container(
                width: 250.0,
                height: 250.0,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 5.0,
                ),
              );
            default:
              if (snapshot.hasError)
                return Center(
                    child:
                        Text("Aconteceu um erro", textAlign: TextAlign.center));
              else
                return Container();
          }
        });
  }
}
