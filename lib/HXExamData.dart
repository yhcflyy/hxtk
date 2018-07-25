import 'dart:convert' show json;


class HXExamData {

  int currServerDate;
  int s;
  String m;
  List<HXExamQuestion> data;


  HXExamData.fromParams({this.currServerDate, this.s, this.m, this.data});

  factory HXExamData(jsonStr) => jsonStr is String ? HXExamData.fromJson(json.decode(jsonStr)) : HXExamData.fromJson(jsonStr);

  HXExamData.fromJson(jsonRes) {
    currServerDate = jsonRes['currServerDate'];
    s = jsonRes['s'];
    m = jsonRes['m'];
    data = [];

    for (var dataItem in jsonRes['data']){

      data.add(new HXExamQuestion.fromJson(dataItem));
    }

  }

  @override
  String toString() {
    return '{"currServerDate": $currServerDate,"s": $s,"m": ${m != null?'${json.encode(m)}':'null'},"data": $data}';
  }
}



class HXExamQuestion {

  int examQuestionId;
  bool favorite;
  List<HXExamQuestionOutline> outlines;
  HXExamQuestionDetail examQuestion;


  HXExamQuestion.fromParams({this.examQuestionId, this.favorite, this.outlines, this.examQuestion});

  HXExamQuestion.fromJson(jsonRes) {
    examQuestionId = jsonRes['examQuestionId'];
    favorite = jsonRes['favorite'];
    if (jsonRes["outlines"] != null) {
      outlines = [];
      for (var outlinesItem in jsonRes['outlines']) {
        outlines.add(new HXExamQuestionOutline.fromJson(outlinesItem));
      }
    }
    examQuestion = new HXExamQuestionDetail.fromJson(jsonRes['examQuestion']);

  }

  @override
  String toString() {
    return '{"examQuestionId": $examQuestionId,"favorite": $favorite,"outlines": $outlines,"examQuestion": $examQuestion}';
  }
}



class HXExamQuestionDetail {

  int examQuestionId;
  int examQuestionTypeId;
  bool isPastPaper;
  String examAnswer;
  String pastPaperNo;
  List<HXExamRichData> examQuestionTitleArray;
  List<HXExamOption> options;


  HXExamQuestionDetail.fromParams({this.examQuestionId, this.examQuestionTypeId, this.isPastPaper, this.examAnswer, this.pastPaperNo, this.examQuestionTitleArray, this.options});

  HXExamQuestionDetail.fromJson(jsonRes) {
    examQuestionId = jsonRes['examQuestionId'];
    examQuestionTypeId = jsonRes['examQuestionTypeId'];
    isPastPaper = jsonRes['isPastPaper'];
    examAnswer = jsonRes['examAnswer'];
    pastPaperNo = jsonRes['pastPaperNo'];
    examQuestionTitleArray = [];

    for (var examQuestionTitleArrayItem in jsonRes['examQuestionTitleArray']){

      examQuestionTitleArray.add(new HXExamRichData.fromJson(examQuestionTitleArrayItem));
    }

    options = [];

    for (var optionsItem in jsonRes['options']){

      options.add(new HXExamOption.fromJson(optionsItem));
    }


  }

  @override
  String toString() {
    return '{"examQuestionId": $examQuestionId,"examQuestionTypeId": $examQuestionTypeId,"isPastPaper": $isPastPaper,"examAnswer": ${examAnswer != null?'${json.encode(examAnswer)}':'null'},"pastPaperNo": ${pastPaperNo != null?'${json.encode(pastPaperNo)}':'null'},"examQuestionTitleArray": $examQuestionTitleArray,"options": $options}';
  }
}



class HXExamOption {

  String optionName;
  List<HXExamRichData> optionContentArray;


  HXExamOption.fromParams({this.optionName, this.optionContentArray});

  HXExamOption.fromJson(jsonRes) {
    optionName = jsonRes['optionName'];
    optionContentArray = [];

    for (var optionContentArrayItem in jsonRes['optionContentArray']){

      optionContentArray.add(new HXExamRichData.fromJson(optionContentArrayItem));
    }


  }

  @override
  String toString() {
    return '{"optionName": ${optionName != null?'${json.encode(optionName)}':'null'},"optionContentArray": $optionContentArray}';
  }
}


class HXExamRichData {

  String content;
  String type;


  HXExamRichData.fromParams({this.content, this.type});

  HXExamRichData.fromJson(jsonRes) {
    content = jsonRes['content'];
    type = jsonRes['type'];

  }

  @override
  String toString() {
    return '{"content": ${content != null?'${json.encode(content)}':'null'},"type": ${type != null?'${json.encode(type)}':'null'}}';
  }
}



class HXExamQuestionOutline {

  int outlineId;
  int pageStartNo;
  int starLevel;
  String outlineName;


  HXExamQuestionOutline.fromParams({this.outlineId, this.pageStartNo, this.starLevel, this.outlineName});

  HXExamQuestionOutline.fromJson(jsonRes) {
    outlineId = jsonRes['outlineId'];
    pageStartNo = jsonRes['pageStartNo'];
    starLevel = jsonRes['starLevel'];
    outlineName = jsonRes['outlineName'];

  }

  @override
  String toString() {
    return '{"outlineId": $outlineId,"pageStartNo": $pageStartNo,"starLevel": $starLevel,"outlineName": ${outlineName != null?'${json.encode(outlineName)}':'null'}}';
  }
}

