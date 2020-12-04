import 'package:http/http.dart' as http;
import 'search_param_response.dart';

class SearchParamApi {
  int currentPage = 1;
  int lastPageLoaded = 0;
  static final host = 'allphotolenses.com';
  static final topBranchLink = 'enlens-param.php';
  Future<SearchParamResponse> getAllSearchParams() async {
    var uri = Uri.https(
      host,
      topBranchLink,
    );
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final items = searchParamResponseFromMap(response.body);
      return Future.value(items);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
