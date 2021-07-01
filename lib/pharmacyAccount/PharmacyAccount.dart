import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mccounting_text/mccounting_text.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:pharmaclickapp/auth/login.dart';
import 'package:pharmaclickapp/pharmacyAccount/statics.dart';

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

