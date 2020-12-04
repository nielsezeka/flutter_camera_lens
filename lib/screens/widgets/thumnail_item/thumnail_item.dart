import 'package:flutter/material.dart';
import 'package:flutter_lens/screens/view_index.dart';
import 'package:progressive_image/progressive_image.dart';

class ItemColor {
  final Color mainColor;
  final Color textColor;

  ItemColor({this.mainColor, this.textColor});
}

class ThumnailColors {
  static List<ItemColor> allColors = [
    ItemColor(mainColor: Color(0xFFFF88B5), textColor: Color(0xFFCDFF65)),
    ItemColor(mainColor: Color(0xFFB388FF), textColor: Color(0xFF3D4591)),
    ItemColor(mainColor: Color(0xFFFF8888), textColor: Color(0xFFD43A3A)),
    ItemColor(mainColor: Color(0xFFFFC788), textColor: Color(0xFF3D915F)),
    ItemColor(mainColor: Color(0xFFDC88FF), textColor: Color(0xFF3D5F91)),
    ItemColor(mainColor: Color(0xFF88B0FF), textColor: Color(0xFF43913D)),
  ];
}

class ThumbnailItem extends StatefulWidget {
  final String name;
  final String imageURLThumb;
  final String description;
  final String imageURLFull;
  final int index;
  const ThumbnailItem({
    Key key,
    @required this.name,
    @required this.imageURLThumb,
    @required this.description,
    @required this.index,
    this.imageURLFull,
  }) : super(key: key);
  @override
  _ThumbnailItemState createState() => _ThumbnailItemState();
}

class _ThumbnailItemState extends State<ThumbnailItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: Container(
          height: 210,
          child: Column(
            children: [
              Container(
                height: 108,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: AppImage(
                  thumbUrl: widget.imageURLThumb,
                  url: widget.imageURLFull,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 6, right: 0, top: 6),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.name}\n',
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),
                        ),
                        Text(
                          '${widget.description}\n',
                          // softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
