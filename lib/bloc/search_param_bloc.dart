import 'package:flutter_lens/bloc/bloc_index.dart';
import 'package:flutter_lens/service/service_index.dart';
import 'package:rxdart/rxdart.dart';

class InfoParam {
  final List<BranchSeach> response;
  final int selectedIndex;

  InfoParam(
    this.response,
    this.selectedIndex,
  );
}

class BranchSeach {
  final String branchName;
  final String branchId;
  final bool isSelected;
  BranchSeach(this.branchName, this.branchId, this.isSelected);
}

class SearchParamBloc {
  final SearchParamApi _searchParams = ServiceFacade.getService<SearchParamApi>();
  BehaviorSubject<SearchParamResponse> _searchSubject = BehaviorSubject<SearchParamResponse>.seeded(null);
  BehaviorSubject<int> _selectedIndex = BehaviorSubject<int>.seeded(0);
  SearchParamBloc() {}
  initSearch() {
    _searchParams.getAllSearchParams().then((value) {
      _searchSubject.sink.add(value);
    });
    this.observeBranchSeach().listen((event) {
      GlobalBloc.listItemBloc.acceptBranchSearch(event[_selectedIndex.value].branchId);
    });
  }

  bool acceptIndex(int index) {
    if (index != _selectedIndex.value) {
      _selectedIndex.sink.add(index);
      return true;
    }
    return false;
  }

  Stream<List<BranchSeach>> observeBranchSeach() {
    return Rx.combineLatest2(
      _selectedIndex,
      _searchSubject,
      (int t, SearchParamResponse s) {
        List<BranchSeach> newInfo = s.brands
            .asMap()
            .map(
              (index, element) =>
                  MapEntry(index, BranchSeach(element.brand, element.id, (index + 1) == _selectedIndex.value)),
            )
            .values
            .toList();
        newInfo.insert(0, BranchSeach("All", "", _selectedIndex.value == 0));
        return newInfo;
      },
    );
  }

  dispose() {
    _searchSubject.close();
  }
}
