import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lens/bloc/bloc_index.dart';
import 'package:flutter_lens/screens/view_index.dart';

class LenHeaderWithImages extends StatefulWidget {
  final ItemDetailInformation item;
  const LenHeaderWithImages({Key key, this.item}) : super(key: key);

  @override
  _LenHeaderWithImagesState createState() => _LenHeaderWithImagesState();
}

class _LenHeaderWithImagesState extends State<LenHeaderWithImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    if (widget.item == null) return Container();
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 40),
          child: AppImage(
            thumbUrl: widget.item.moreImages[this.selectedImage].imageThumnail,
            url: widget.item.moreImages[this.selectedImage].imageFull,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80,
            margin: EdgeInsets.symmetric(horizontal: 34),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: MediaQuery.removePadding(
                  context: context,
                  removeLeft: true,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Center(
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                this.selectedImage = index;
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(29),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 58,
                                    height: 58,
                                    child: Image.network(
                                      widget.item.moreImages[index].imageThumnail,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    width: 58,
                                    height: 58,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(28),
                                      border: Border.all(color: Colors.grey, width: 0.1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: widget.item.moreImages.length,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _renderImage(String thumbUrl, String url) {
    return SizedBox.expand(
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => Image.network(
          thumbUrl,
          fit: BoxFit.cover,
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.cover,
      ),
    );
  }
}
