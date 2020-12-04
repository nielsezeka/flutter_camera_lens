import 'package:flutter_lens/service/service_index.dart';
import 'package:rxdart/rxdart.dart';

class ItemDataThumbnail {
  String name;
  String description;
  String image;
  String id;
  String imageFull;
  ItemDataThumbnail(this.name, this.image, this.id, this.imageFull);
  ItemDataThumbnail.from({TopBranchResponse topBranchResponse}) {
    var indexOfFirstNumber = topBranchResponse.fullname.indexOf(' ');
    var name = topBranchResponse.fullname;
    var description = '';
    if (indexOfFirstNumber != -1) {
      name = topBranchResponse.fullname.substring(0, indexOfFirstNumber);
      description = topBranchResponse.fullname.substring(
        indexOfFirstNumber + 1,
        topBranchResponse.fullname.length,
      );
    }
    this.name = name;
    this.description = description;
    this.image = topBranchResponse.img;
    this.imageFull = topBranchResponse.img.replaceFirst("__tmp/80_80_", "");
    this.id = topBranchResponse.id;
  }
}

class ListItemBloc {
  final LensApi lensApiService = ServiceFacade.getService<LensApi>();
  final listItems = BehaviorSubject<List<ItemDataThumbnail>>.seeded([]);
  final _seachingBranchName = BehaviorSubject<String>.seeded("");
  final _isLoading = BehaviorSubject<bool>.seeded(false);
  final _pageToLoad = BehaviorSubject<int>.seeded(1);
  ListItemBloc() {
    _seachingBranchName
        .switchMap(
      (value) => Stream.value(value),
    )
        .listen(
      (event) {
        this.loadItemOfBranch(event, forceReload: true);
      },
    );
  }

  dispose() {
    listItems.close();
    _isLoading.close();
    _seachingBranchName.close();
  }

  acceptBranchSearch(String searchBranch) {
    _seachingBranchName.sink.add(searchBranch);
  }

  Stream<bool> observeLoading() {
    return _isLoading.stream;
  }

  loadItemOfBranch(String branchName, {bool forceReload = false}) {
    if (forceReload) {
      listItems.sink.add([]);
      _pageToLoad.sink.add(1);
    }
    if (branchName != null) {
      if (!_isLoading.value) {
        _isLoading.sink.add(true);
        lensApiService.search(branchName, _pageToLoad.value).then((value) {
          var currentItems = listItems.value;
          currentItems.addAll(
            value
                .map(
                  (TopBranchResponse e) => ItemDataThumbnail.from(topBranchResponse: e),
                )
                .toList(),
          );
          listItems.sink.add(currentItems);
          _isLoading.sink.add(false);
          _pageToLoad.sink.add(_pageToLoad.value + 1);
        });
      }
    } else {
      if (!_isLoading.value) {
        _isLoading.sink.add(true);
        lensApiService
            .getNextManafactures(
          _pageToLoad.value,
        )
            .then((value) {
          var currentItems = listItems.value;
          currentItems.addAll(value.map((e) => ItemDataThumbnail.from(topBranchResponse: e)).toList());
          listItems.sink.add(currentItems);
          _isLoading.sink.add(false);
          _pageToLoad.sink.add(_pageToLoad.value + 1);
        });
      }
    }
  }

  void loadMoreItemThumbs() {
    loadItemOfBranch(_seachingBranchName.value);
  }
}
