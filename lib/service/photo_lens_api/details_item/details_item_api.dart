import 'package:http/http.dart' as http;
import 'details_item_response.dart';

class LensDetailsApi {
  static final host = 'https://allphotolenses.com/';
  static final imagePrefix = 'https://allphotolenses.com';
  static final topBranchLink = 'enlens-about.php';
  Future<DetailsItemResponse> getDetail(String id) async {
    var url = '$host$topBranchLink?id=$id';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final item = detailsItemResponseFromMap(response.body);
      return Future.value(
        item.copyWith(
          img: '$host${item.img.replaceFirst("__tmp/80_80_", "")}',
          pictures: item.pictures
              .map(
                (e) => Picture(
                  preview: '$imagePrefix${e.preview}',
                  url: '$imagePrefix${e.url}',
                ),
              )
              .toList(),
        ),
      );
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
