import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tayal/themes/constant.dart';
import 'package:tayal/views/help_screen.dart';
import 'package:tayal/views/order_list_screen.dart';
import 'package:tayal/views/wallet_statement_screen.dart';
import 'package:tayal/widgets/navigation_drawer_widget.dart';

class MyBizScreen extends StatefulWidget {
  const MyBizScreen({Key key}) : super(key: key);

  @override
  _MyBizScreenState createState() => _MyBizScreenState();
}

class _MyBizScreenState extends State<MyBizScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      backgroundColor: kBackgroundShapeColor,
      drawer: NavigationDrawerWidget(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.indigo,
          child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0xffBCBEFD),
        child: Container(
            width: size.width,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/home.svg', fit: BoxFit.fill),
                        Text("Home")
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyBizScreen()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/mybiz.svg', fit: BoxFit.fill),
                        Text("My Biz")
                      ],
                    ),
                  ),
                  SizedBox.shrink(),
                  InkWell(
                    onTap: (){},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/reward.svg', fit: BoxFit.fill),
                        Text("Campaign")
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HelpScreen()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/help.svg', fit: BoxFit.fill),
                        Text("Help")
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                      child: SvgPicture.asset('assets/images/menu.svg',
                          fit: BoxFit.fill),
                    ),
                    const Text("My Biz", textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.normal, fontSize: 21, fontWeight: FontWeight.bold)),
                    SvgPicture.asset('assets/images/notifications.svg',
                        fit: BoxFit.fill),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: size.height * 0.15,
                        width: size.width * 0.50,
                        child: SvgPicture.asset('assets/images/profile_card.svg', fit: BoxFit.fill),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OrderlistScreen()));
                        },
                        child: Container(
                          height: size.height * 0.15,
                          width: size.width * 0.50,
                          child: SvgPicture.asset('assets/images/order_card.svg', fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height * 0.15,
                      width: size.width * 0.50,
                      child: SvgPicture.asset('assets/images/ledger_card.svg', fit: BoxFit.fill),
                    ),
                    Container(
                      height: size.height * 0.15,
                      width: size.width * 0.50,
                      child: SvgPicture.asset('assets/images/payment_card.svg', fit: BoxFit.fill),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap : (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WalletStatementScreen()));
                      },
                      child: Container(
                        height: size.height * 0.15,
                        width: size.width * 0.50,
                        child: SvgPicture.asset('assets/images/referral_card.svg', fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      height: size.height * 0.15,
                      width: size.width * 0.50,
                      child: SvgPicture.asset('assets/images/help_card.svg', fit: BoxFit.fill),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height * 0.15,
                    width: size.width * 0.50,
                    child: SvgPicture.asset('assets/images/notification_card.svg', fit: BoxFit.fill),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
