import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lens/bloc/bloc_index.dart';
import 'package:flutter_lens/bloc/list_item_bloc.dart';
import 'package:flutter_lens/screens/widgets/list_of_thumnail_product/list_view_of_thumnail_products.dart';
import '../view_index.dart';

class ListOfManafacture extends StatefulWidget {
  static const String tag = 'ListOfManafacture';
  @override
  _ListOfManafactureState createState() => _ListOfManafactureState();
}

class _ListOfManafactureState extends State<ListOfManafacture> {
  // ScrollController controller;
  // @override
  // void initState() {
  //   super.initState();
  //   controller = new ScrollController()..addListener(_listenScrollListener);
  // }

  @override
  void dispose() {
    // controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: FadeIn(
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Stack(
              children: [
                Image.asset('assets/images/bg_top.png'),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 21),
                  child: Column(
                    children: [
                      SearchInfo(),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          child: StreamBuilder<List<ItemDataThumbnail>>(
                            stream: GlobalBloc.listItemBloc.listItems,
                            builder: (context, snapshot) {
                              final List<ItemDataThumbnail> items = snapshot.hasData ? snapshot.data : [];
                              return ListOfThumnailProducts(items: items);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
