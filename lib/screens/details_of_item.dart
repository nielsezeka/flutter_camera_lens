import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lens/bloc/bloc_index.dart';
import 'package:flutter_lens/screens/view_index.dart';

class DetailOfItem extends StatefulWidget {
  static const String tag = 'DetailOfItem';
  final String itemId;
  final String imageThumb;
  const DetailOfItem({
    Key key,
    this.itemId,
    this.imageThumb,
  }) : super(key: key);
  @override
  _DetailOfItemState createState() => _DetailOfItemState();
}

class _DetailOfItemState extends State<DetailOfItem> {
  final itemDetailBloc = GlobalBloc.itemDetailBloc;
  @override
  void initState() {
    super.initState();
    itemDetailBloc.getDetails(widget.itemId);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: StreamBuilder<ItemDetailInformation>(
          stream: GlobalBloc.itemDetailBloc.observeDetail(),
          builder: (context, snapshot) {
            ItemDetailInformation item = snapshot.data;
            if (item == null) {
              return _renderWaitingView();
            }
            return FadeIn(
              duration: Duration(milliseconds: 2000),
              child: Stack(
                children: [
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: 1.0,
                    child: CustomScrollView(
                      physics: BouncingScrollPhysics(),
                      slivers: <Widget>[
                        SliverAppBar(
                          stretch: true,
                          expandedHeight: 311.0,
                          collapsedHeight: 80.0,
                          flexibleSpace: FlexibleSpaceBar(
                            background: LenHeaderWithImages(item: item),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              _renderRatings(item),
                              _renderSpecifications(item),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  _renderWaitingView() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: 1.0,
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Image.asset(
          'assets/images/loading.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _renderSpecifications(ItemDetailInformation item) {
    if (item == null) return Container();
    return Column(
      children: [
        Center(
          child: Text(
            'Specifications in detail',
            style: Theme.of(context).textTheme.headline6.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        ListOfText(
          characteristics: item.characteristics,
        ),
      ],
    );
  }

  _renderRatings(ItemDetailInformation item) {
    if (item == null) return Container();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).canvasColor,
        border: Border.all(
          color: Color(0xFFE8E8E8),
          width: 1,
        ),
      ),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      child: ListOfText(
        characteristics: item.ratings,
        textColor: Colors.black,
      ),
    );
  }
}
