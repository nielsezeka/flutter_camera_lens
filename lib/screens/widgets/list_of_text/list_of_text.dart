import 'package:flutter/material.dart';

class ListOfText extends StatelessWidget {
  final Map<String, String> characteristics;
  final Color textColor;
  const ListOfText({
    Key key,
    @required this.characteristics,
    this.textColor = Colors.white,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: characteristics.entries
          .map(
            (key) => Container(
              constraints: BoxConstraints(minHeight: 30),
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6),
                padding: EdgeInsets.all(6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '${key.key}',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: this.textColor,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${_getText(key.value)}',
                        textAlign: TextAlign.end,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: this.textColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  String _getText(String text) {
    if (text == null || text.trim().isEmpty) {
      return '-';
    }
    return text;
  }
}
