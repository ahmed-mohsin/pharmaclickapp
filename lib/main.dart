import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bottom Nav Bar V2',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: Scaffold(body: BottomNavBarV2()),
          );
        }
      },
    );
  }
}

class BottomNavBarV2 extends StatefulWidget {
  @override
  _BottomNavBarV2State createState() => _BottomNavBarV2State();
}

class _BottomNavBarV2State extends State<BottomNavBarV2> {
  int currentIndex = 0;
  final homePageWidgets = <Widget>[
    MainScreen(),
    Tuts(),
    Updates(),
    Contact(),
    PharmacyAccount(),
  ];

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(55),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            homePageWidgets[currentIndex],
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: 80,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: BNBCustomPainter(),
                    ),
                    Center(
                      heightFactor: 0.6,
                      child: FloatingActionButton(
                          backgroundColor: Colors.pinkAccent,
                          child: Icon(
                            Icons.bar_chart,
                            color: Colors.white,
                          ),
                          elevation: 0.1,
                          onPressed: () {
                            setBottomBarIndex(4);
                          }),
                    ),
                    Container(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.home,
                              color: currentIndex == 0
                                  ? Colors.pinkAccent
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(0);
                            },
                            splashColor: Colors.white,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.video_collection,
                                color: currentIndex == 1
                                    ? Colors.pinkAccent
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(1);
                              }),
                          Container(
                            width: size.width * 0.20,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.notification_important,
                                color: currentIndex == 2
                                    ? Colors.pinkAccent
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(2);
                              }),
                          IconButton(
                              icon: Icon(
                                CupertinoIcons.phone,
                                color: currentIndex == 3
                                    ? Colors.pinkAccent
                                    : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(3);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Contact extends StatelessWidget {
  const Contact({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(
        'Contact Us',
        style: TextStyle(fontSize: 65),
      ),
    ));
  }
}

class Updates extends StatelessWidget {
  const Updates({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[100].withAlpha(50),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('آخر التحديثات',style: TextStyle(fontFamily: "arn",),),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          updateElemnt('الجديد فى الاصدار 6.5','تفعيل تخصيم المرتجعات من الديون عند تنفيذ ارجاع من العملاء- تحسين بيانات تقفيل المبيعات اليومية لتكون اوضح- تحسين فى مراجعة بيانات فواتير العملاء قبل الحفظ- امكانية مراجعة فواتير البيع من تقارير العملاء الكاملة- تحسين بيانات الاحصائيات العامة- تحسين البحث و الاضافة الى الطلبيات- تحسين اقسام النواقص وتفعيل اعادة التحميل من داخل البرنامج- تحسين عرض الكميات فى فواتير العملاء المطبوعة-امكانية تصدير النواقص الغير متوفرة الى اكسيل- تفعيل فلتر لمعرفة الادوية التى تحت نظام المخزون التلقائي و الغير مفعلة فى قسم الادوية'),
          updateElemnt('الجديد فى الاصدار 6.4','التحكم فى سيستم الديون بالايقاف و التفعيل او وضع حد اقصي لكل العملاء او لعميل معين- اضافة اداة صيانة لفحص الاصناف المكررة وحذفها- تحسين عرض حسابات الشركات فى الشركات - قسم المشتروات- امكانية استعراض النواقص كلها بغض النظر عن حالة الطلب- امكانية استعراض النواقص اليدوية فقط- تفعيل امكانية اعادة فتح الفاتورة مع العلم انه عند فتح الفاتورة مرة اخري سيتم حذف الدين و المرتجع المتعلق بهذه الفاتورة- لا يمكن فتح فاتورة تم عمل اغلاق يومي بعد بيعها او تم دفع جزء من الدين المرتبط بها- غلق مشكلة تمرير باركود بالخطاء مكان كمية التكويد او الكمية المباعة- غلق مشكلة ادخال خصم تكويد بالسالب'),
          updateElemnt('الجديد فى الاصدار 6.3','تفعيل متابعة تعديل المخزون يدويا وظهوره في حركة الصنف- تفعيل البيع بالسالب لجميع الاصناف بشكل افتراضي يمكنك تعديل الضبط من الاعدادت العامة- تفعيل تسجيل النواقص يدويا وتم اضافتها للقائمة السريعة اللي بتظهر تحت اسم الصنف- عند تسجيل النواقص يمكنك ربطها بالعملاء وسيصلك تنبيه عند توفر الصنف- تفعيل المتابعة الشهرية لطلبات العملاء- تفعيل اظهار واخفاء الضريبة و الموظف فى الفاتورة من الاعدادات- تفعيل امكانية حفظ باك اب فى مسار اضافي ثالث- تحسينات في عرض المخزون في الاقسام المختلفة'),
          SizedBox(
            height: 75,
          )
        ],
      )),
    );
  }
}

class updateElemnt extends StatelessWidget {
  String a,b;

  updateElemnt(this.a, this.b);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  a,
                  style: TextStyle(color: Colors.pinkAccent,fontFamily: "arn",fontWeight: FontWeight.bold),
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(), shrinkWrap: true,
                  children:
                      b.split('-') // split the text into an array
                          .map((String text) =>
                              Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: Text(' # '+text,style: TextStyle(color: Colors.grey,fontFamily: "arn",),),
                              )) // put the text inside a widget
                          .toList(), // convert the iterable to a list
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PharmacyAccount extends StatelessWidget {
  const PharmacyAccount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(
        'PharmacyAccount',
        style: TextStyle(fontSize: 65),
      ),
    ));
  }
}

class Tuts extends StatelessWidget {
  const Tuts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(
        'Tuts',
        style: TextStyle(fontSize: 65),
      ),
    ));
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(
        'MainScreen',
        style: TextStyle(fontSize: 65),
      ),
    ));
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/logo.png',
                width: 150,
                height: 150,
              ),
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.green,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
            )
          ],
        ),
      ),
    );
  }
}
