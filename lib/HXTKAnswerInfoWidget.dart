import 'package:flutter/material.dart';
import 'HXExamData.dart';

class HXTKAnswerInfoWidget extends StatelessWidget {
  final HXExamQuestionDetail detail;
  HXTKAnswerInfoWidget(this.detail);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        new Container(
          margin: EdgeInsets.fromLTRB(15.0, 30.0, 0.0, 0.0),
          child:   new Row(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Text(
                    "正确答案",
                    style: TextStyle(
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.w300,
                        fontSize: 17.0),
                  ),
                  new Container(
                    margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: new Text(
                      detail.examAnswer,
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0XFF01A827),
                          fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
              new Container(
                margin: EdgeInsets.fromLTRB(36.0, 0.0, 0.0, 0.0),
                child: new Row(
                  children: <Widget>[
                    new Text(
                      "我的答案",
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.w300,
                          fontSize: 17.0),
                    ),
                    new Container(
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: new Text(
                        detail.myexamAnswer,
                        style: TextStyle(
                            fontSize: 17.0,
                            color: detail.myexamAnswer == detail.examAnswer ? Color(0XFF01A827) : Color(0XFFFF5555),
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
    return null;
  }
}
