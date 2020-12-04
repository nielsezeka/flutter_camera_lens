import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class SearchInfo extends StatefulWidget {
  @override
  _SearchInfoState createState() => _SearchInfoState();
}

class _SearchInfoState extends State<SearchInfo> {
  var textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    textController.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 93,
      child: Column(
        children: [
          Container(
            height: 93,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Color(0xFF707070),
                width: 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                        margin: EdgeInsets.only(
                          left: 12,
                        ),
                        child: Text(
                          'What are you looking for?',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black),
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 12,
                    right: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Typicons.zoom_outline,
                        color: Theme.of(context).unselectedWidgetColor,
                        size: 24,
                      ),
                      Expanded(
                        child: TextField(
                          controller: textController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter a search term',
                            hintStyle: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
