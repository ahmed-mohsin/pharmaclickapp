import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mccounting_text/mccounting_text.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class PharmacyAccount extends StatelessWidget {
  const PharmacyAccount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: TabBarView(
              children: [
                Today(),
                Month(),
                Year(),
                General(),
              ],
            ),
            appBar: AppBar(
              centerTitle: true,actions:[Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Main Branch'), Icon(Icons.keyboard_arrow_down)
                ],
              ),
            )]   ,
              title: Text("الإحصائيات ",
                  style: TextStyle(
                    fontFamily: 'arn',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
              backgroundColor: Colors.green,
              bottom: TabBar(
                labelStyle: TextStyle(fontWeight: FontWeight.w700),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                isScrollable: true,
                indicator: MD2Indicator(
                  indicatorSize: MD2IndicatorSize.full,
                  indicatorHeight: 3,
                  indicatorColor: Colors.white,
                ),
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'اليوم',
                      style: TextStyle(fontFamily: 'arn'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'الشهر',
                      style: TextStyle(fontFamily: 'arn'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'السنة',
                      style: TextStyle(fontFamily: 'arn'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'عامة',
                      style: TextStyle(fontFamily: 'arn'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class General extends StatelessWidget {
  const General({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.greenAccent[100].withAlpha(50),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                generalStaticsUnit(
                    'إجمالي مخزون الصيدلية بسعر الجمهور', 170000.23, 1000),
                generalStaticsUnit(
                    'إجمالي مخزون الصيدلية بسعر التكلفة', 250000.23, 900),
                generalStaticsUnit('عدد عبوات المخزون', 3256, 700),
                generalStaticsUnit(
                    'عدد الأصناف المسجلة بقاعدة البيانات', 4000.23, 600),
                generalStaticsUnit('صافي المديونية كاملة', 1900.23, 600),
                generalStaticsUnit('إجمالي المديونية كاملة', 3000.23, 600),
                generalStaticsUnit('عدد التي تنتهي الشهر القادم', 9.23, 600),
                generalStaticsUnit(
                    'عدد الاصناف التي تنتهي بعد شهرين', 15.23, 600),
                generalStaticsUnit(
                    'عدد الاصناف التي تنتهي خلال 3 أشهر', 30.23, 600),
                generalStaticsUnit(
                    'عدد الاصناف التي تنتهي خلال 6 أشهر', 40.23, 600),
                SizedBox(
                  height: 75,
                )
              ],
            ),
          ),
        ));
  }
}
class Today extends StatelessWidget {
  const Today({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.greenAccent[100].withAlpha(50),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                generalStaticsUnit(
                    'صـافي الاربـاح', 979.23, 1000),
                generalStaticsUnit(
                    'الأربـاح', 1300.23, 900),
                generalStaticsUnit('إجمال المبيعات بعد الخصم و المرتجع', 3256, 700),
                generalStaticsUnit(
                    'مبيعات كاش', 4000.23, 600),
                generalStaticsUnit('مبيعات آجلة علي النوتة', 1900.23, 600),
                generalStaticsUnit('مرتجعات عملاء', 3000.23, 600),
                generalStaticsUnit('صافي المديونية', 9.23, 600),
                generalStaticsUnit(
                    'تسديد مديونات', 15.23, 600),
                generalStaticsUnit(
                    'مصروفات مشتروات شركات', 30.23, 600),
                generalStaticsUnit(
                    'اجمالي الخصم', 40.23, 600),
                generalStaticsUnit(
                    'اجمالي ضريبة القيمة المضافة', 40.23, 600),
                generalStaticsUnit(
                    'عدد الطلبيات التي تم دفعها ', 40.23, 600),
                generalStaticsUnit(
                    'الطلبيات التي تم استلامها', 40.23, 600),
                SizedBox(
                  height: 75,
                )
              ],
            ),
          ),
        ));
  }
}

class Month extends StatelessWidget {
  const Month({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.greenAccent[100].withAlpha(50),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                generalStaticsUnit(
                    'صـافي الاربـاح', 979.23, 1000),
                generalStaticsUnit(
                    'الأربـاح', 1300.23, 900),
                generalStaticsUnit('إجمال المبيعات بعد الخصم و المرتجع', 3256, 700),
                generalStaticsUnit(
                    'مبيعات كاش', 4000.23, 600),
                generalStaticsUnit('مبيعات آجلة علي النوتة', 1900.23, 600),
                generalStaticsUnit('مرتجعات عملاء', 3000.23, 600),
                generalStaticsUnit('صافي المديونية', 9.23, 600),
                generalStaticsUnit(
                    'تسديد مديونات', 15.23, 600),
                generalStaticsUnit(
                    'مصروفات مشتروات شركات', 30.23, 600),
                generalStaticsUnit(
                    'اجمالي الخصم', 40.23, 600),
                generalStaticsUnit(
                    'اجمالي ضريبة القيمة المضافة', 40.23, 600),
                generalStaticsUnit(
                    'عدد الطلبيات التي تم دفعها ', 40.23, 600),
                generalStaticsUnit(
                    'الطلبيات التي تم استلامها', 40.23, 600),
                SizedBox(
                  height: 75,
                )
              ],
            ),
          ),
        ));
  }
}
class Year extends StatelessWidget {
  const Year({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.greenAccent[100].withAlpha(50),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                generalStaticsUnit(
                    'صـافي الاربـاح', 979.23, 1000),
                generalStaticsUnit(
                    'الأربـاح', 1300.23, 900),
                generalStaticsUnit('إجمال المبيعات بعد الخصم و المرتجع', 3256, 700),
                generalStaticsUnit(
                    'مبيعات كاش', 4000.23, 600),
                generalStaticsUnit('مبيعات آجلة علي النوتة', 1900.23, 600),
                generalStaticsUnit('مرتجعات عملاء', 3000.23, 600),
                generalStaticsUnit('صافي المديونية', 9.23, 600),
                generalStaticsUnit(
                    'تسديد مديونات', 15.23, 600),
                generalStaticsUnit(
                    'مصروفات مشتروات شركات', 30.23, 600),
                generalStaticsUnit(
                    'اجمالي الخصم', 40.23, 600),
                generalStaticsUnit(
                    'اجمالي ضريبة القيمة المضافة', 40.23, 600),
                generalStaticsUnit(
                    'عدد الطلبيات التي تم دفعها ', 40.23, 600),
                generalStaticsUnit(
                    'الطلبيات التي تم استلامها', 40.23, 600),
                SizedBox(
                  height: 75,
                )
              ],
            ),
          ),
        ));
  }
}
class generalStaticsUnit extends StatelessWidget {
  String title;

  double value;

  int time;

  generalStaticsUnit(this.title, this.value, this.time);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(

            color: Colors.white38, border: Border.all(color: Colors.pinkAccent),borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * .60,
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.green,fontSize: 17, fontFamily: 'arn'),
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 4,left: 4),
                child: McCountingText(
                  begin: 0,
                  end: value,
                  precision: 0,
                  style: TextStyle(fontSize: 20, fontFamily: 'arn',color: Colors.grey),
                  duration: Duration(milliseconds: time),
                  curve: Curves.linear,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
