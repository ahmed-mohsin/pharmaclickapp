import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mccounting_text/mccounting_text.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class PharmacyAccount extends StatefulWidget {
  const PharmacyAccount({
    Key key,
  }) : super(key: key);

  @override
  _PharmacyAccountState createState() => _PharmacyAccountState();
}

class _PharmacyAccountState extends State<PharmacyAccount> {
  bool isUserLoggedIn;

  @override
  void initState() {
    super.initState();
    isUserLoggedIn = false;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: isUserLoggedIn == false ? LoginScreen() : StaticsScreen(),
    );
  }
}

class StaticsScreen extends StatelessWidget {
  const StaticsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Main Branch'),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              )
            ],
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
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText,checkedValue;
  final TextEditingController password = new TextEditingController();
  final TextEditingController userName = new TextEditingController();
  bool _validate = false;

  @override
  void initState() {
    super.initState();
    _obscureText = true;
    checkedValue = true;
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Please log in first \n To Get Your Pharmacy Data',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'arn',
                  fontSize: 20,
                  color: Colors.pink,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Shadow(
                      offset: Offset(1.5, 1.5),
                      blurRadius: 8.0,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Form(
                    key: _formKey,
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      child: TextFormField(
                        controller: userName,
                        autofocus: false,
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                          filled: true,
                          errorText: _validate ? 'Value Can\'t Be Empty' : null,
                          fillColor: Colors.grey[200],
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 6.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        alignment: const Alignment(0, 0),
                        children: <Widget>[
                          TextFormField(
                            controller: password,
                            obscureText: _obscureText,
                            autofocus: false,
                            style: TextStyle(fontSize: 15.0, color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'password',
                              filled: true,
                              errorText: _validate ? 'Value Can\'t Be Empty' : null,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          Positioned(
                              right: 8,
                              child: GestureDetector(
                                  onTap: _toggle,
                                  child: Icon(_obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off)))
                        ],
                      ),
                    ),
                    CheckboxListTile(
                      title: Text("Remember Me"),
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue;
                          print(newValue);
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 10),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton(
                            color: Colors.green,
                            onPressed: () {
                              // Validate returns true if the form is valid, or false
                              // otherwise.
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a Snackbar.
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                              }
                            },
                            child: Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.green)),
                          ),
                        )),
                  ],
                )),
              ),
            )
          ],
        )),
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
                generalStaticsUnit('صـافي الاربـاح', 979.23, 1000),
                generalStaticsUnit('الأربـاح', 1300.23, 900),
                generalStaticsUnit(
                    'إجمال المبيعات بعد الخصم و المرتجع', 3256, 700),
                generalStaticsUnit('مبيعات كاش', 4000.23, 600),
                generalStaticsUnit('مبيعات آجلة علي النوتة', 1900.23, 600),
                generalStaticsUnit('مرتجعات عملاء', 3000.23, 600),
                generalStaticsUnit('صافي المديونية', 9.23, 600),
                generalStaticsUnit('تسديد مديونات', 15.23, 600),
                generalStaticsUnit('مصروفات مشتروات شركات', 30.23, 600),
                generalStaticsUnit('اجمالي الخصم', 40.23, 600),
                generalStaticsUnit('اجمالي ضريبة القيمة المضافة', 40.23, 600),
                generalStaticsUnit('عدد الطلبيات التي تم دفعها ', 40.23, 600),
                generalStaticsUnit('الطلبيات التي تم استلامها', 40.23, 600),
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
                generalStaticsUnit('صـافي الاربـاح', 979.23, 1000),
                generalStaticsUnit('الأربـاح', 1300.23, 900),
                generalStaticsUnit(
                    'إجمال المبيعات بعد الخصم و المرتجع', 3256, 700),
                generalStaticsUnit('مبيعات كاش', 4000.23, 600),
                generalStaticsUnit('مبيعات آجلة علي النوتة', 1900.23, 600),
                generalStaticsUnit('مرتجعات عملاء', 3000.23, 600),
                generalStaticsUnit('صافي المديونية', 9.23, 600),
                generalStaticsUnit('تسديد مديونات', 15.23, 600),
                generalStaticsUnit('مصروفات مشتروات شركات', 30.23, 600),
                generalStaticsUnit('اجمالي الخصم', 40.23, 600),
                generalStaticsUnit('اجمالي ضريبة القيمة المضافة', 40.23, 600),
                generalStaticsUnit('عدد الطلبيات التي تم دفعها ', 40.23, 600),
                generalStaticsUnit('الطلبيات التي تم استلامها', 40.23, 600),
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
                generalStaticsUnit('صـافي الاربـاح', 979.23, 1000),
                generalStaticsUnit('الأربـاح', 1300.23, 900),
                generalStaticsUnit(
                    'إجمال المبيعات بعد الخصم و المرتجع', 3256, 700),
                generalStaticsUnit('مبيعات كاش', 4000.23, 600),
                generalStaticsUnit('مبيعات آجلة علي النوتة', 1900.23, 600),
                generalStaticsUnit('مرتجعات عملاء', 3000.23, 600),
                generalStaticsUnit('صافي المديونية', 9.23, 600),
                generalStaticsUnit('تسديد مديونات', 15.23, 600),
                generalStaticsUnit('مصروفات مشتروات شركات', 30.23, 600),
                generalStaticsUnit('اجمالي الخصم', 40.23, 600),
                generalStaticsUnit('اجمالي ضريبة القيمة المضافة', 40.23, 600),
                generalStaticsUnit('عدد الطلبيات التي تم دفعها ', 40.23, 600),
                generalStaticsUnit('الطلبيات التي تم استلامها', 40.23, 600),
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
            color: Colors.white38,
            border: Border.all(color: Colors.pinkAccent),
            borderRadius: BorderRadius.circular(5)),
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
                    style: TextStyle(
                        color: Colors.green, fontSize: 17, fontFamily: 'arn'),
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 4, left: 4),
                child: McCountingText(
                  begin: 0,
                  end: value,
                  precision: 0,
                  style: TextStyle(
                      fontSize: 20, fontFamily: 'arn', color: Colors.grey),
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
