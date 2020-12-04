import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lens/bloc/bloc_index.dart';
import 'package:flutter_lens/screens/view_index.dart';

class ListOfBranch extends StatefulWidget {
  static const String tag = 'ListOfBranch';
  @override
  _ListOfBranchState createState() => _ListOfBranchState();
}

class _ListOfBranchState extends State<ListOfBranch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: FadeIn(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 17),
            color: Theme.of(context).primaryColor,
            child: Row(
              children: [
                Expanded(
                  child: StreamBuilder<List<ItemDataThumbnail>>(
                    stream: GlobalBloc.listItemBloc.listItems,
                    builder: (context, snapshot) {
                      final List<ItemDataThumbnail> items = snapshot.hasData ? snapshot.data : [];
                      return ListOfThumnailProducts(items: items);
                    },
                  ),
                ),
                Container(
                  width: 68,
                  height: double.infinity,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: BranchInfo(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
