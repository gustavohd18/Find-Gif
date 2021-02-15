import 'dart:convert';

import 'package:find_gif/model/gif.dart';
import 'package:http/http.dart' as http;

  Future<List<GIF>> searchGIfs(String search, int offset) async{
    http.Response response;

    if (search == null || search.isEmpty){
      response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=f2rQ49y3pFHvAv5g0Oez49ZhfceF39Ll&limit=20&rating=g");
    } else {
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=f2rQ49y3pFHvAv5g0Oez49ZhfceF39Ll&q=$search&limit=19&offset=$offset&rating=g&lang=pt");
    }

    final data =  json.decode(response.body);
    final list = (data['data'] as List)
      .map((listGifs) => GIF.fromJSON(listGifs))
      .toList();

    return list;
  }
