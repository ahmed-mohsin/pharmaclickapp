import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:pharmaclickapp/NavDcreans/ContactUs.dart';
import 'package:pharmaclickapp/func.dart';
import 'package:pharmaclickapp/pharmacyAccount/PharmacyAccount.dart';
import 'package:url_launcher/url_launcher.dart';

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
      backgroundColor: Colors.white,
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
        title: Text(
          'آخر التحديثات',
          style: TextStyle(
            fontFamily: "arn",
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          updateElemnt('شرح تحديث برنامج Pharmaclick لاخر اصدار',
              'تفعيل تخصيم المرتجعات من الديون عند تنفيذ ارجاع من العملاء- تحسين بيانات تقفيل المبيعات اليومية لتكون اوضح- تحسين فى مراجعة بيانات فواتير العملاء قبل الحفظ- امكانية مراجعة فواتير البيع من تقارير العملاء الكاملة- تحسين بيانات الاحصائيات العامة- تحسين البحث و الاضافة الى الطلبيات- تحسين اقسام النواقص وتفعيل اعادة التحميل من داخل البرنامج- تحسين عرض الكميات فى فواتير العملاء المطبوعة-امكانية تصدير النواقص الغير متوفرة الى اكسيل- تفعيل فلتر لمعرفة الادوية التى تحت نظام المخزون التلقائي و الغير مفعلة فى قسم الادوية'),
          updateElemnt('اطبع باركود لكل المخزون و للطلبيات بكليك واحدة',
              'التحكم فى سيستم الديون بالايقاف و التفعيل او وضع حد اقصي لكل العملاء او لعميل معين- اضافة اداة صيانة لفحص الاصناف المكررة وحذفها- تحسين عرض حسابات الشركات فى الشركات - قسم المشتروات- امكانية استعراض النواقص كلها بغض النظر عن حالة الطلب- امكانية استعراض النواقص اليدوية فقط- تفعيل امكانية اعادة فتح الفاتورة مع العلم انه عند فتح الفاتورة مرة اخري سيتم حذف الدين و المرتجع المتعلق بهذه الفاتورة- لا يمكن فتح فاتورة تم عمل اغلاق يومي بعد بيعها او تم دفع جزء من الدين المرتبط بها- غلق مشكلة تمرير باركود بالخطاء مكان كمية التكويد او الكمية المباعة- غلق مشكلة ادخال خصم تكويد بالسالب'),
          updateElemnt('ضبط اعدادات طباعة الباركود فى Pharmaclick',
              'تفعيل متابعة تعديل المخزون يدويا وظهوره في حركة الصنف- تفعيل البيع بالسالب لجميع الاصناف بشكل افتراضي يمكنك تعديل الضبط من الاعدادت العامة- تفعيل تسجيل النواقص يدويا وتم اضافتها للقائمة السريعة اللي بتظهر تحت اسم الصنف- عند تسجيل النواقص يمكنك ربطها بالعملاء وسيصلك تنبيه عند توفر الصنف- تفعيل المتابعة الشهرية لطلبات العملاء- تفعيل اظهار واخفاء الضريبة و الموظف فى الفاتورة من الاعدادات- تفعيل امكانية حفظ باك اب فى مسار اضافي ثالث- تحسينات في عرض المخزون في الاقسام المختلفة'),
          SizedBox(
            height: 75,
          )
        ],
      )),
    );
  }
}

class updateElemnt extends StatelessWidget {
  String a, b;

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
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontFamily: "arn",
                      fontWeight: FontWeight.bold),
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(), shrinkWrap: true,
                  children: b
                      .split('-') // split the text into an array
                      .map((String text) => Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Text(
                              ' # ' + text,
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "arn",
                              ),
                            ),
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

class tutsElemnt extends StatelessWidget {
  String a, url;

  tutsElemnt(this.a, this.url);

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
            child: InkWell(
              onTap: () async {
                if (Platform.isIOS) {
                  if (await canLaunch(url)) {
                    await launch(url, forceSafariVC: false);
                  } else {
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  }
                } else {
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    a,
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontFamily: "arn",
                        fontWeight: FontWeight.bold),
                  ),
                  Image.network(
                    'https://cdn.havecamerawilltravel.com/photographer/files/2020/01/youtube-logo-new.jpg',
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class Tuts extends StatelessWidget {
  const Tuts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[100].withAlpha(50),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          'شروحات البرنامج',
          style: TextStyle(
            fontFamily: "arn",
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          tutsElemnt('شرح تحديث برنامج Pharmaclick لاخر اصدار',
              'https://www.youtube.com/watch?v=Nz29foLXXKc'),
          tutsElemnt('اطبع باركود لكل المخزون و للطلبيات بكليك واحدة',
              'https://www.youtube.com/watch?v=Nz29foLXXKc'),
          tutsElemnt('ضبط اعدادات طباعة الباركود فى Pharmaclick',
              'https://www.youtube.com/watch?v=Nz29foLXXKc'),
          tutsElemnt('ضبط اعدادات طباعة الباركود فى Pharmaclick',
              'https://www.youtube.com/watch?v=Nz29foLXXKc'),
          SizedBox(
            height: 75,
          )
        ],
      )),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key key,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> _images = List();
  List<String> _headers = List();
  List<String> _features = List();

  @override
  void initState() {
    _features
      ..add(
          'https://scontent.fcai21-1.fna.fbcdn.net/v/t1.6435-9/178368903_306612707501399_7927093819376549802_n.png?_nc_cat=108&ccb=1-3&_nc_sid=973b4a&_nc_ohc=UoALy6f3K40AX-fS4a2&_nc_ht=scontent.fcai21-1.fna&oh=6a90908125b375ea32ed7abd2f1c1dd2&oe=60E9E4B4')
      ..add(
          'https://scontent.fcai21-1.fna.fbcdn.net/v/t1.6435-9/151994890_268969037932433_7259992956132354806_n.jpg?_nc_cat=105&ccb=1-3&_nc_sid=973b4a&_nc_ohc=ZuPe1J9j-koAX-XY9uO&_nc_ht=scontent.fcai21-1.fna&oh=b0947f9ce32f72042e3b8b125412aeea&oe=60E8C161')
      ..add(
          'https://scontent.fcai21-1.fna.fbcdn.net/v/t1.6435-9/178368903_306612707501399_7927093819376549802_n.png?_nc_cat=108&ccb=1-3&_nc_sid=973b4a&_nc_ohc=UoALy6f3K40AX-fS4a2&_nc_ht=scontent.fcai21-1.fna&oh=6a90908125b375ea32ed7abd2f1c1dd2&oe=60E9E4B4')
      ..add(
          'https://scontent.fcai21-1.fna.fbcdn.net/v/t1.6435-9/146826091_259335388895798_347846442415628470_n.jpg?_nc_cat=107&ccb=1-3&_nc_sid=973b4a&_nc_ohc=VbcDHP6D408AX9dAq4S&_nc_ht=scontent.fcai21-1.fna&oh=67d7c9fa1f000651e4a99dc8feeb7204&oe=60E7B2E9');

    _images
      ..add(
          'https://scontent.fcai21-1.fna.fbcdn.net/v/t1.6435-9/178368903_306612707501399_7927093819376549802_n.png?_nc_cat=108&ccb=1-3&_nc_sid=973b4a&_nc_ohc=UoALy6f3K40AX-fS4a2&_nc_ht=scontent.fcai21-1.fna&oh=6a90908125b375ea32ed7abd2f1c1dd2&oe=60E9E4B4')
      ..add(
          'https://scontent.fcai21-1.fna.fbcdn.net/v/t1.6435-9/151994890_268969037932433_7259992956132354806_n.jpg?_nc_cat=105&ccb=1-3&_nc_sid=973b4a&_nc_ohc=ZuPe1J9j-koAX-XY9uO&_nc_ht=scontent.fcai21-1.fna&oh=b0947f9ce32f72042e3b8b125412aeea&oe=60E8C161')
      ..add(
          'https://scontent.fcai21-1.fna.fbcdn.net/v/t1.6435-9/178368903_306612707501399_7927093819376549802_n.png?_nc_cat=108&ccb=1-3&_nc_sid=973b4a&_nc_ohc=UoALy6f3K40AX-fS4a2&_nc_ht=scontent.fcai21-1.fna&oh=6a90908125b375ea32ed7abd2f1c1dd2&oe=60E9E4B4')
      ..add(
          'https://scontent.fcai21-1.fna.fbcdn.net/v/t1.6435-9/146826091_259335388895798_347846442415628470_n.jpg?_nc_cat=107&ccb=1-3&_nc_sid=973b4a&_nc_ohc=VbcDHP6D408AX9dAq4S&_nc_ht=scontent.fcai21-1.fna&oh=67d7c9fa1f000651e4a99dc8feeb7204&oe=60E7B2E9');
    _headers
      ..add(
          'البرنامج ادارة كاملة للصيدلية 100% بكل نواحيها التجارية و المالية ومتابعة العملاء و الشركات')
      ..add(
          'تحديث قاعدة البيانات لتحتوى على اكثر من 27 الف صنف بالاسعار الجديدة والباركود الدولي')
      ..add(
          'التحكم فى كل اقسام البرنامج بالتفعيل والايقاف مثال سيستم المخزون التلقائي و تجهيز الطلبيات و الحضور و الانصراف و الديون')
      ..add(
          ' امكانية ربط اي عدد من نقاط البيع بكل بساطة و فصل درج الكاشير لكل جهاز')
      ..add('نظام ادارة المخزون حسب رغبة وامكانيات المستخدم Optimised Stock')
      ..add(
          'طورنا مستوي الامان فهتلاقي حفظ تلقائي لكل لمسة في البرنامج كل ثانية و كمان فى باك اب بيتاخد بشكل تلقائي ممكن تتحكم فى معدل الوقت بدءا من ساعة وحتي 12 ساعة وكمان تقدر تحفظ الباك اب يدويا في اي وقت')
      ..add(
          'Backup Files بتتحفظ في 3 اماكن مختلفة على جهازك ممكن تظبطه يحفظ على فلاشة او هارد خارجي ودا هيديلك امان اعلى وكمان استعادة باك اب لو احتجت تنزل ويندوز جديد بتكون فى اقل من دقيقة')
      ..add(
          'نظام تتبع طلبات العملاء و متابعة الاصناف المطلوبة وووصلها فى المخزون')
      ..add(
          'تحديد الصلاحيات لكل فئة فى الصيدلية كاشير او مسؤول او مدير وامكانية اتاحة او غلق اي خاصية لاي فئة')
      ..add('اضافة و تعديل بكل بساطة للاصناف و الموردين والعملاء')
      ..add(
          'تقدر تحفظ اي تقرير فى البرنامج على اكسيل زى الطلبيات و النواقص و المبيعات و تقفيل الايام و الاحصائيات حتي بيانات المخزون')
      ..add(' نظام توصيل للمنازل ومتابعة الطلب حتي عودة عامل التوصيل');
    super.initState();
  }

  Widget _customScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 250.0,
          floating: false,
          pinned: true,
          backgroundColor: Colors.pinkAccent,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("PharmaCLick",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  )),
              background: Container(
                decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(4),
                        bottomLeft: Radius.circular(4))),
                height: 250,
                child: Center(
                    child: Text(
                  'أول برنامج عملي لادارة الصيدليات',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'arn',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              )),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          color: Colors.white,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Swiper(
                              scrollDirection: Axis.horizontal,
                              itemCount: _headers.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Container(
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _headers[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontFamily: 'arn',
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                              ),
                              autoplay: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            height: MediaQuery.of(context).size.height - 250,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.pinkAccent),
                                color: Colors.pinkAccent.withAlpha(5),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ],
                    ),
                  ),
              childCount: 1),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: Colors.pinkAccent,elevation: 0,),
      body: _customScrollView(),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.grey.shade200
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
