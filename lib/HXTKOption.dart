import 'package:flutter/material.dart';
import 'HXPaperCard.dart';
import 'package:dio/dio.dart';
import 'HXExamData.dart';
import 'HXTKOptionBaseItemWidget.dart';
import 'HXTKOptionItemWidget.dart';
import 'HXTKAnswerInfoWidget.dart';

class HXTKOption extends StatefulWidget {
  final HXExamQuestionVo questionVo;

  HXTKOption(this.questionVo);

  @override
  _HXTKOptionState createState() => _HXTKOptionState(questionVo);
}

class _HXTKOptionState extends State<HXTKOption> {
  HXExamData examData;

  final HXExamQuestionVo questionVo;

  _HXTKOptionState(this.questionVo);

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    getExamData();
  }

  @override
  Widget build(BuildContext context) {
    if (examData == null) {
      return new Center(
          child: new SizedBox(
              width: 60.0,
              height: 60.0,
              child: new CircularProgressIndicator()));
    } else {
      return new ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: getShowCount(),
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return new Container(
                  margin: new EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
                  child: new HXTKOptionBaseItemWidget(
                      examData.data.first.examQuestion.examQuestionTitleArray));
            } else if (index >= 1 &&
                index <= examData.data.first.examQuestion.options.length) {
              return new Container(
                child: new InkWell(
                    onTap: () {
                      examData.data.first.isShowAnswer = true;
                      examData.data.first.examQuestion.myexamAnswer = examData.data.first.examQuestion.options[index - 1].optionName;
                      setState(() {
                      });
                    },
                    child: new HXTKOptionItemWidget(
                        examData.data.first.examQuestion.options[index - 1])),
              );
            } else if (index == getShowCount() - 2) {
              return new Container(
                color: Color(0xFFF7F7F7),
                height: 10.0,
              );
            } else if (examData.data.first.isShowAnswer && index == getShowCount() - 1){
              return new HXTKAnswerInfoWidget(examData.data.first.examQuestion);
            }
          });
    }
  }

  int getShowCount() {
    int count = 0;
    if (examData == null) count = 0;
    if (examData.data.first.isShowAnswer) {
      count = examData.data.first.examQuestion.options.length + 3;
    } else {
      count = examData.data.first.examQuestion.options.length + 1;
    }
    return count;
  }

  void getExamData() async {
    if (questionVo.examData != null) {
      examData = questionVo.examData;
    } else {
      Map qesId = Map();
      qesId["questionId"] = questionVo.examQuestionId;

      List questionIds = new List();
      questionIds.add(qesId);

      Map param = Map();
      param["module"] = 107;
      param["includeAnalysis"] = false;
      param["includeExam"] = true;
      param["includeFavorite"] = true;
      param["includeOutline"] = true;
      param["includeQa"] = false;
      param["examQuestions"] = questionIds;

      Dio dio = new Dio();
      Response response = await dio.post(
          "http://a1.highso.com.cn/newexam/v1/getExams.do?token=489E41D9-FCCD-4DCD-8DB4-419549874D96&sig=a2f9b86ef9bca9e499618f19649a5f6d&device=iPhone_X&app_key=ho2dxs9g&v=1.0&sk=9bfd9e1a-b236-45f1-ad82-d6e5f3cf016f.1532485627320.11259025.489E41D9-FCCD-4DCD-8DB4-419549874D96.854746a0cd3345cfe0b018654bc193f0",
          data: param);
      examData = HXExamData(response.data);
      questionVo.examData = examData;
    }
    setState(() {});
  }
}
