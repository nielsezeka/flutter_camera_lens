import 'package:flutter_lens/service/service_index.dart';
import 'package:rxdart/subjects.dart';

class ImageDislayForDetail {
  final String imageThumnail;
  final String imageFull;

  ImageDislayForDetail({this.imageThumnail, this.imageFull});
}

class ItemDetailInformation {
  String name;
  String imageThumnail;
  String imageFull;
  List<ImageDislayForDetail> moreImages;

  Map<String, String> characteristics;
  Map<String, String> ratings;

  ItemDetailInformation.fromDetailApi(DetailsItemResponse apiData) {
    this.name = apiData.fullname;
    this.imageThumnail = apiData.img;
    this.imageFull = apiData.img.replaceFirst("__tmp/80_80_", "");
    this.characteristics = Map<String, String>.fromIterable(
      apiData.characteristics,
      key: (item) => item.name,
      value: (item) => item.value,
    );
    this.moreImages = apiData.pictures
        .map((e) => ImageDislayForDetail(
              imageFull: e.url.replaceFirst("__tmp/80_80_", ""),
              imageThumnail: e.preview,
            ))
        .toList();
    this.ratings = Map<String, String>.fromIterable(
      apiData.ratings,
      key: (item) => item.name,
      value: (item) => item.value,
    );
  }
}

class ItemDetailBloc {
  final LensDetailsApi lensDetailApiService = ServiceFacade.getService<LensDetailsApi>();
  PublishSubject<ItemDetailInformation> _item = PublishSubject<ItemDetailInformation>();
  getDetails(String id) {
    lensDetailApiService.getDetail(id).then(
      (value) {
        _item.sink.add(ItemDetailInformation.fromDetailApi(value));
      },
    );
  }

  Stream<ItemDetailInformation> observeDetail() {
    return _item.stream;
  }
}
