import 'package:http/http.dart' as http;

import 'search_branch_api.dart';

class SearchParamApi {
  int currentPage = 1;
  int lastPageLoaded = 0;
  static final host = 'allphotolenses.com';
  static final searchPath = 'enlens-search.php';
  Future<List<SearchBranchResponse>> search(String name) async {
    var url = '$host$searchPath';
    var uri = Uri.https(host, searchPath, {
      'lens': name,
    });
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final items = searchBranchResponseFromMap(response.body);
      return Future.value(items);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
