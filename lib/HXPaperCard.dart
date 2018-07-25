import 'dart:convert' show json;
import 'HXExamData.dart';

class HXPaperCard {

  int currServerDate;
  int s;
  String m;
  HXPaperCardData data;
  List<HXExamQuestionVo> _exams;

  HXPaperCard.fromParams({this.currServerDate, this.s, this.m, this.data});

  factory HXPaperCard(jsonStr) => jsonStr is String ? HXPaperCard.fromJson(json.decode(jsonStr)) : HXPaperCard.fromJson(jsonStr);

  HXPaperCard.fromJson(jsonRes) {
    currServerDate = jsonRes['currServerDate'];
    s = jsonRes['s'];
    m = jsonRes['m'];
    data = new HXPaperCardData.fromJson(jsonRes['data']);

  }

  @override
  String toString() {
    return '{"currServerDate": $currServerDate,"s": $s,"m": ${m != null?'${json.encode(m)}':'null'},"data": $data}';
  }

  List<HXExamQuestionVo> getExams(){
    if (_exams == null) _exams = List<HXExamQuestionVo>();
    for(HXPaperCategoryVo cate in data.paperCategoryVos){
      for (HXExamQuestionVo exam in cate.examQuestionVos){
        _exams.add(exam);
      }
    }
    return _exams;
  }
}



class HXPaperCardData {

  List<HXPaperCategoryVo> paperCategoryVos;
  HXPaperVo paperVo;


  HXPaperCardData.fromParams({this.paperCategoryVos, this.paperVo});

  HXPaperCardData.fromJson(jsonRes) {
    paperCategoryVos = [];

    for (var paperCategoryVosItem in jsonRes['paperCategoryVos']){

      paperCategoryVos.add(new HXPaperCategoryVo.fromJson(paperCategoryVosItem));
    }

    paperVo = new HXPaperVo.fromJson(jsonRes['paperVo']);

  }

  @override
  String toString() {
    return '{"paperCategoryVos": $paperCategoryVos,"paperVo": $paperVo}';
  }
}



class HXPaperVo {

  int adviseAnswerTime;
  int paperId;
  int status;
  int takeTotalTime;
  String paperName;


  HXPaperVo.fromParams({this.adviseAnswerTime, this.paperId, this.status, this.takeTotalTime, this.paperName});

  HXPaperVo.fromJson(jsonRes) {
    adviseAnswerTime = jsonRes['adviseAnswerTime'];
    paperId = jsonRes['paperId'];
    status = jsonRes['status'];
    takeTotalTime = jsonRes['takeTotalTime'];
    paperName = jsonRes['paperName'];

  }

  @override
  String toString() {
    return '{"adviseAnswerTime": $adviseAnswerTime,"paperId": $paperId,"status": $status,"takeTotalTime": $takeTotalTime,"paperName": ${paperName != null?'${json.encode(paperName)}':'null'}}';
  }
}



class HXPaperCategoryVo {

  int paperCategoryId;
  int paperCategoryTypeId;
  List<HXExamQuestionVo> examQuestionVos;


  HXPaperCategoryVo.fromParams({this.paperCategoryId, this.paperCategoryTypeId, this.examQuestionVos});

  HXPaperCategoryVo.fromJson(jsonRes) {
    paperCategoryId = jsonRes['paperCategoryId'];
    paperCategoryTypeId = jsonRes['paperCategoryTypeId'];
    examQuestionVos = [];

    for (var examQuestionVosItem in jsonRes['examQuestionVos']){

      examQuestionVos.add(new HXExamQuestionVo.fromJson(examQuestionVosItem));
    }


  }

  @override
  String toString() {
    return '{"paperCategoryId": $paperCategoryId,"paperCategoryTypeId": $paperCategoryTypeId,"examQuestionVos": $examQuestionVos}';
  }
}



class HXExamQuestionVo {

  int answerQuestionStatus;
  int examQuestionId;
  int examQuestionTypeId;
  String examQuestionType;
  HXExamData examData;


  HXExamQuestionVo.fromParams({this.answerQuestionStatus, this.examQuestionId, this.examQuestionTypeId, this.examQuestionType});

  HXExamQuestionVo.fromJson(jsonRes) {
    answerQuestionStatus = jsonRes['answerQuestionStatus'];
    examQuestionId = jsonRes['examQuestionId'];
    examQuestionTypeId = jsonRes['examQuestionTypeId'];
    examQuestionType = jsonRes['examQuestionType'];

  }

  @override
  String toString() {
    return '{"answerQuestionStatus": $answerQuestionStatus,"examQuestionId": $examQuestionId,"examQuestionTypeId": ${examQuestionType != null?'${json.encode(examQuestionType)}':'null'}Id,"examQuestionType": ${examQuestionType != null?'${json.encode(examQuestionType)}':'null'}}';
  }
}

