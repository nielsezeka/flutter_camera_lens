import 'package:http/http.dart' as http;
import 'top_branch_response.dart';

class LensApi {
  static final host = 'allphotolenses.com';
  static final topBranchLink = 'enlens-top-brand.php';
  Future<List<TopBranchResponse>> getNextManafactures(int page) async {
    var uri = Uri.https(
      host,
      topBranchLink,
      {
        'main': '1',
        'page': '$page',
        'rows': '30',
      },
    );
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final items = topBranchResponseFromMap(response.body)
          .where(
            (element) => element.fullname.trim() != 'SPAM',
          )
          .toList();
      final converted = items
          .map(
            (item) => item.copyWith(img: 'https://$host${item.img}'),
          )
          .toList();
      return Future.value(converted);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<List<TopBranchResponse>> search(String id, int page) async {
    var uri = Uri.https(host, topBranchLink, {
      'brand': id,
      'main': '1',
      'page': '$page',
      'rows': '30',
    });
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final items = topBranchResponseFromMap(response.body)
          .where(
            (element) => element.fullname.trim() != 'SPAM',
          )
          .toList();
      final converted = items
          .map(
            (item) => item.copyWith(img: 'https://$host${item.img}'),
          )
          .toList();
      return Future.value(converted);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
