import 'package:flutter/material.dart';
import 'HXExamData.dart';
import 'HXTKOptionBaseItemWidget.dart';

class HXTKOptionItemWidget extends StatelessWidget {
  final HXExamOption option;

  HXTKOptionItemWidget(this.option);

  Widget getWidget() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Container(
          margin: new EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              border: new Border.all(color: Color(0xFFc8c8d3))),
          width: 30.0,
          height: 30.0,
          child: new Center(
            child: new Text(option.optionName),
          ),
        ),
        new Expanded(
            child: new HXTKOptionBaseItemWidget(option.optionContentArray)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: new EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
      child: getWidget(),
    );
  }
}
