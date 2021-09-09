import 'package:clinic_web/Screens/services_screen/add_patient_screen.dart';
import 'package:clinic_web/Screens/services_screen/profile_admin_screen.dart';
import 'package:clinic_web/Screens/services_screen/search_patient_screen.dart';
import 'package:clinic_web/Screens/services_screen/show_patient_screen.dart';
import 'package:clinic_web/Widgets/home_screen_card_item.dart';
import 'package:clinic_web/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Clinic Home'),
      ),
      body: Center(
        child: Container(
          height: height * 0.7,
          width: width * 0.7,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    HomeScreenCardItem(
                      title: 'Add Patient',
                      onTap: () {
                        Constants.navigatorPush(
                          screen: AddPatientScreen(),
                          context: context,
                        );
                      },
                      icon: Icons.add,
                    ),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    HomeScreenCardItem(
                      title: 'Patients',
                      icon: Icons.people,
                      onTap: () {
                        Constants.navigatorPush(
                          screen: ShowPatientScreen(),
                          context: context,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Expanded(
                child: Row(
                  children: [
                    HomeScreenCardItem(
                      title: 'Profile',
                      icon: Icons.person,
                      onTap: () {
                        Constants.navigatorPush(
                          screen: ProfileAdminScreen(),
                          context: context,
                        );
                      },
                    ),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    HomeScreenCardItem(
                      title: 'Search',
                      icon: Icons.search,
                      onTap: () {
                        Constants.navigatorPush(
                          screen: SearchPatientScreen(),
                          context: context,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
