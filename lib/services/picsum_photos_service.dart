import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:picsum_photos/models/pic_list_model.dart';
import 'package:http/http.dart' as http;

class PicsumService {
  final _url = 'picsum.photos';

Future<Either<String, List<ListPicResponse>>> getListOfImages(int page) async {
  try {
    final Uri url = Uri.https(_url, '/v2/list', {'page': '$page', 'limit': '30'});
    final response = await http.get(url);
    final List<dynamic> jsonList = json.decode(response.body);
    final List<ListPicResponse> pics = jsonList
        .map((json) => ListPicResponse.fromMap(json))
        .toList();
    return Right(pics);
  } catch (e) {
    final error = e.toString();
    return Left(error);
  }
}
}
