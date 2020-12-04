import 'package:flutter_lens/bloc/search_param_bloc.dart';

import 'item_detail_bloc.dart';
import 'list_item_bloc.dart';
export 'list_item_bloc.dart';
export 'item_detail_bloc.dart';
export './search_param_bloc.dart';

class GlobalBloc {
  static final listItemBloc = ListItemBloc();
  static final itemDetailBloc = ItemDetailBloc();
  static final searchParamBloc = SearchParamBloc();
  static acceptNewInfo(int index) {
    GlobalBloc.searchParamBloc.acceptIndex(index);
  }
}
