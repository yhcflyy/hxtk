import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'HXTKOption.dart';
import 'HXPaperCard.dart';
import 'package:dio/dio.dart';

class HXTKPager extends StatefulWidget {
  HXTKPager({Key key}) : super(key: key);

  @override
  _HXTKPagerState createState() => new _HXTKPagerState();
}

class _HXTKPagerState extends State<HXTKPager> {
  HXPaperCard resp;

  @override
  void initState() {
    super.initState();
    getPaperCard();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("text"),
        backgroundColor: Colors.white,
        elevation: 0.0,
        brightness: Brightness.light,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.settings), onPressed: null),
          new IconButton(icon: new Icon(Icons.favorite), onPressed: null),
          new IconButton(icon: new Icon(Icons.face), onPressed: null),
          new IconButton(icon: new Icon(Icons.search), onPressed: null),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: new PageView.custom(
            childrenDelegate:
            MySliverChildBuilderDelegate((BuildContext context, int index) {
              return new HXTKOption(resp.getExams()[index]);
            }, childCount: resp == null ? 0 : resp
                .getExams()
                .length)),
//        child: new PageView.builder(
//            itemCount: resp == null ? 0 : resp.getExams().length,
//            itemBuilder: (BuildContext context, int index) {
//              print(index);
//              return new Padding(
//                padding: EdgeInsets.all(10.0),
//                child: new HXTKOption(resp.getExams()[index]),
//              );
//            }),
      ),
    );
  }

  void getPaperCard() async {
    Dio dio = new Dio();
    Response response = await dio.get(
        "http://a1.highso.com.cn/newexam/v1/getByPaperId.do?categoryId=9&uid=11259025&sk=076b2f92-8fb0-4b5d-bf64-b968c83f030b.1532413782839.11259025.489E41D9-FCCD-4DCD-8DB4-419549874D96.34c4a9274bec5a1e75ea088fc13e75a7&kernel=11.4&app_version=2.5.4&rom=iOS_com.haixue.app.haixue_2.5.4&subjectId=1&token=489E41D9-FCCD-4DCD-8DB4-419549874D96&paperId=5513&sig=eb49cd2e0066d5e28cf00877df5843e7&device=iPhone_X&v=3.0&app_key=ho2dxs9g");
    resp = HXPaperCard(response.data);
    setState(() {});
  }
}

class MySliverChildBuilderDelegate extends SliverChildBuilderDelegate {
  MySliverChildBuilderDelegate(Widget Function(BuildContext, int) builder,
      {int childCount,
        bool addAutomaticKeepAlives = true,
        bool addRepaintBoundaries = true})
      : super(builder,
      childCount: childCount,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries);

  @override
  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    // TODO: implement didFinishLayout
    print('firstIndex: $firstIndex, lastIndex: $lastIndex');
//    super.didFinishLayout(firstIndex, lastIndex);
  }
}
