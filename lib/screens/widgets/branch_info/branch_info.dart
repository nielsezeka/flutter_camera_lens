import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lens/bloc/bloc_index.dart';

class BranchInfo extends StatefulWidget {
  @override
  _BranchInfoState createState() => _BranchInfoState();
}

class _BranchInfoState extends State<BranchInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.5),
      ),
      child: StreamBuilder<List<BranchSeach>>(
        stream: GlobalBloc.searchParamBloc.observeBranchSeach(),
        builder: (context, snapshot) {
          final info = snapshot.hasData ? snapshot.data : null;
          if (info == null) {
            return Container();
          } else {
            return ClipRRect(
              borderRadius: BorderRadius.circular(25.5),
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: info?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          GlobalBloc.acceptNewInfo(index);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          constraints: BoxConstraints(minWidth: 100),
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: info[index].isSelected ? Theme.of(context).accentColor : Colors.transparent,
                          ),
                          padding: EdgeInsets.all(10),
                          child: Container(
                            child: Center(
                              child: Text(
                                info[index]?.branchName ?? '',
                                style: Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      color: info[index].isSelected ? Colors.white : Colors.black,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
