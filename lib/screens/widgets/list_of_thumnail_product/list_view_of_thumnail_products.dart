import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lens/bloc/bloc_index.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:quiver/iterables.dart';

import '../../view_index.dart';

class ListOfThumnailProducts extends StatefulWidget {
  final List<ItemDataThumbnail> items;

  const ListOfThumnailProducts({Key key, this.items}) : super(key: key);
  @override
  _ListOfThumnailProductsState createState() => _ListOfThumnailProductsState();
}

class _ListOfThumnailProductsState extends State<ListOfThumnailProducts> {
  ScrollController controller;
  List<List<ItemDataThumbnail>> chunkedList = [];
  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_listenScrollListener);
  }

  @override
  void didUpdateWidget(covariant ListOfThumnailProducts oldWidget) {
    super.didUpdateWidget(oldWidget);
    chunkedList = partition<ItemDataThumbnail>(widget.items, 2).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: ListView.builder(
            controller: controller,
            itemBuilder: (context, index) {
              final item = chunkedList[index];
              return Container(
                  height: 175,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(DetailOfItem.tag, arguments: item[0]);
                          },
                          padding: EdgeInsets.all(0),
                          child: ThumbnailItem(
                            name: item[0].name,
                            description: item[0].description,
                            imageURLThumb: item[0].image,
                            imageURLFull: item[0].imageFull,
                            index: index,
                          ),
                        ),
                      ),
                      Container(
                        width: 15,
                      ),
                      Expanded(
                        child: CupertinoButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(DetailOfItem.tag, arguments: item[0]);
                          },
                          padding: EdgeInsets.all(0),
                          child: ThumbnailItem(
                            name: item[1].name,
                            description: item[1].description,
                            imageURLThumb: item[1].image,
                            imageURLFull: item[1].imageFull,
                            index: index,
                          ),
                        ),
                      ),
                    ],
                  ));
            },
            itemCount: chunkedList.length,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: StreamBuilder<bool>(
              stream: GlobalBloc.listItemBloc.observeLoading(),
              builder: (context, snapshot) {
                bool isLoading = snapshot.hasData ? snapshot.data : false;
                if (!isLoading) {
                  return Container();
                }
                return Flash(
                  infinite: true,
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    color: Theme.of(context).accentColor,
                  ),
                );
              }),
        )
      ],
    );
  }

  void _listenScrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent && !controller.position.outOfRange) {
      GlobalBloc.listItemBloc.loadMoreItemThumbs();
    }
  }
}
