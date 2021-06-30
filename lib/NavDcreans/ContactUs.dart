import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'تواصل معانا',
            style: TextStyle(
              fontFamily: "arn",
            ),
          ),
          centerTitle: true,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'للتواصل و الاستعلام عن البرنامج يسعدنا تواصلك معانا عن طريق قنواتنا المختلفة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20, fontFamily: "arn", color: Colors.green),
                    ),
                  ),
                ),
                GridView.count(shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                          //width: MediaQuery.of(context).size.width * .5,
                          child: InkWell( onTap: () async {
                            String url ='https://www.youtube.com/channel/UCpPA1IFtYQMdOuY08_5Svkg' ;
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
                            child: Image.asset(
                              'assets/youtube.png',
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                         // width: MediaQuery.of(context).size.width * .5,
                          child: InkWell( onTap: () async {
                            String url ='https://www.facebook.com/PharmaclickRealAssistant' ;
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
                            child: Image.asset(
                              'assets/facebook.png',
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        //  width: MediaQuery.of(context).size.width * .5,
                          child: InkWell( onTap: () async {
                            String url ='https://l.facebook.com/l.php?u=https%3A%2F%2Fm.me%2FPharmaclickRealAssistant%3Ffbclid%3DIwAR3HPK68zb_z-A-_L17nk5-Jbu2zwT8Sg-FLlBk1E_FjhTdJwaylirMbckY&h=AT3LsjxicZpPcSBGJ2fffkjwA7P0ptlkNim1Sg3qbfHB02lkefSFW_zW0U5-mdjbVDdlXbZsOOa2Wyi9GopLd5T1wK1ADjpdgYkz3XSqYVzuFdVJw_I5mcRKhASvtwFlmg&__tn__=-UK-R&c[0]=AT2BTqKc_SI_bQqT3ELbcfnKwq8LM1rhvroKsvlB5v1pD6HpBxp31qqMbT0BqDWOFMyoFXM_f0FtJxbbW9G4ylmbUPRO8r6Ijk3BafRMeHvw_xL9rT7AcEsr-6J6JV0K9bLAC18IEc-zpRqCEvBF2IoCNwreWbKGO9ewnUHbVxqVKw' ;
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
                            child: Image.asset(
                              'assets/messenger.png',
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                       //   width: MediaQuery.of(context).size.width * .5,
                          child: InkWell( onTap: () async {
                            String url ='https://api.whatsapp.com/send?phone=201096329003' ;
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
                            child: Image.asset(
                              'assets/whats.png',
                            ),
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
