import 'package:flutter/material.dart';
import 'HXExamData.dart';

class HXTKOptionBaseItemWidget extends StatelessWidget{
  final List<HXExamRichData> list;
  HXTKOptionBaseItemWidget(this.list);


  List<Widget> getOptionWidgets() {
    List<Widget> widgets = List<Widget>();
    for (HXExamRichData richData in list) {
      if (richData.type == "img"){
        Container container = new Container(
          margin: new EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.5),
          child: new Image.network(richData.content),
        );
        widgets.add(container);
      }else if (richData.type == "text"){
        Container container = new Container(
          margin: new EdgeInsets.fromLTRB(0.0, 2.5, 0.0, 2.5),
          child: new Text(
              richData.content,textAlign: TextAlign.left,
              style: TextStyle(fontSize: 15.0,color: Color(0xFF333333),fontWeight: FontWeight.w300),
          ),
        );
        widgets.add(container);
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: new EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: getOptionWidgets()
      ),
    );
  }
}