import 'package:care_plus_doctor/data/my_profile_data/my_profile_data.dart';
import 'package:care_plus_doctor/data/profile_data/profile_data.dart';
import 'package:care_plus_doctor/model/ui_model/my_profile_model/my_profile_model.dart';
import 'package:care_plus_doctor/model/ui_model/profile_model/profile_model.dart';
import 'package:care_plus_doctor/view/screen/add_hospital/add_hospital.dart';
import 'package:care_plus_doctor/view/screen/add_services/add_services.dart';
import 'package:care_plus_doctor/view/screen/change_password/change_password.dart';
import 'package:care_plus_doctor/view/screen/manage_schedule/manage_schedule.dart';
import 'package:care_plus_doctor/view/screen/my_profile/my_profile.dart';
import 'package:care_plus_doctor/view/screen/navbar_pages/bottomnevigation.dart';
import 'package:care_plus_doctor/view/screen/notificaitonUi/notificaitonUi.dart';
import 'package:care_plus_doctor/view/screen/reviewUI/reviewUI.dart';
import 'package:care_plus_doctor/view/screen/splash_screen/splash_Screen.dart';
import 'package:care_plus_doctor/view/screen/transfer_money_back/transfer_money_bank.dart';
import 'package:care_plus_doctor/view/screen/wallet/wallet.dart';
import 'package:care_plus_doctor/widget/profile_widget_widget/profile_page_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //List<Profile_Model> profileModel = List.of(profile_data);
  List<MyProfileModel> myProfile = List.of(myProfileData);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNevigation()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Center(
                child: Text(
                  "Profile",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    //padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    // height: 750,
                    child: ListView.builder(
                        physics:
                            NeverScrollableScrollPhysics(), // <-- this will disable scroll
                        shrinkWrap: true,
                        //controller: PageController(viewportFraction: 0.3),
                        scrollDirection: Axis.vertical,
                        itemCount: myProfile.length,
                        itemBuilder: (context, index) {
                          return Profile_Page(myProfile[index], context);
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
                childAspectRatio: (1 / .55),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  GridTile(
                    child: GestureDetector(
                      child: new Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Container(
                                // padding: EdgeInsets.only(left: 20, ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Wallet',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                      left: 20,
                                    ),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Quick payment',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 10),
                                  child: Icon(
                                    Icons.account_balance_wallet,
                                    color: Colors.black.withOpacity(0.5),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => walletUi()));
                      },
                    ),
                  ),
                  GridTile(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyProfile()));
                      },
                      child: new Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Container(
                                // padding: EdgeInsets.only(left: 20, ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'My Profile',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                      left: 20,
                                    ),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Set up Profile',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 10),
                                  child: Icon(
                                    Icons.person_pin_outlined,
                                    color: Colors.black.withOpacity(0.5),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),



                  GridTile(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddServicesPage()));
                      },
                      child: new Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    left: 20,
                                  ),
                                  child: Container(
                                    // padding: EdgeInsets.only(left: 20, ),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Add Specializations ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                      left: 20,
                                    ),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Add Specializations',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(top: 20, right: 10),
                                  child: Icon(
                                    Icons.medical_services_outlined,
                                    color: Colors.black.withOpacity(0.5),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  GridTile(
                    child: new Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 20,
                            ),
                            child: Container(
                              // padding: EdgeInsets.only(left: 20, ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Invite',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 5,
                                    left: 20,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Invite friends',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(top: 20, right: 10),
                                child: Icon(
                                  Icons.card_giftcard,
                                  color: Colors.black.withOpacity(0.5),
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  GridTile(
                    child: new Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 20,
                            ),
                            child: Container(
                              // padding: EdgeInsets.only(left: 20, ),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Change Language',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 5,
                                    left: 20,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Change Language',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, right: 10),
                                child: Icon(
                                  Icons.vpn_lock_outlined,
                                  color: Colors.black.withOpacity(0.5),
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  GridTile(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ManageSchedule()));
                      },
                      child: new Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Container(
                                // padding: EdgeInsets.only(left: 20, ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Manage Schedule',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                      left: 20,
                                    ),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Scheduling',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(top: 20, right: 10),
                                  child: Icon(
                                    Icons.manage_accounts_sharp,
                                    color: Colors.black.withOpacity(0.5),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GridTile(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangePassword()));
                      },
                      child: new Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Container(
                                // padding: EdgeInsets.only(left: 20, ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Change Password',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                      left: 20,
                                    ),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Change Password',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 10),
                                  child: Icon(
                                    Icons.lock,
                                    color: Colors.black.withOpacity(0.5),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  GridTile(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => SplashScreen()));
                      },
                      child: new Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                              ),
                              child: Container(
                                // padding: EdgeInsets.only(left: 20, ),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Logout',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 5,
                                      left: 20,
                                    ),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Logout',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 10),
                                  child: Icon(
                                    Icons.logout,
                                    color: Colors.black.withOpacity(0.5),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}

// Widget Profile_Page(MyProfileModel myProfile, BuildContext context) {
// }
