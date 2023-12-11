import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }
}

PreferredSizeWidget buildAppBar() {
  return AppBar(
    flexibleSpace: Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        margin: const EdgeInsets.only(top: 60, right: 20),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Consultation',
              style: TextStyle(
                color: Color(0xFF979797),
                fontSize: 11,
                fontFamily: 'Nunito-Regular',
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Appointment',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito-Bold',
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildBody(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Expert box with GestureDetector
        GestureDetector(
          onTap: () {
            // Handle the onTap for Expert
            print("Expert tapped");
            // Add your navigation logic or any other action here
          },
          child: Container(
            width: 113,
            height: 27,
            decoration: BoxDecoration(
              color: Colors.transparent,
              // You can add additional styling here if needed
            ),
            child: Center(
              child: Text(
                'Expert',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                  letterSpacing: -0.022,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),

        // Hospital box with GestureDetector
        GestureDetector(
          onTap: () {
            // Handle the onTap for Hospital
            print("Hospital tapped");
            // Add your navigation logic or any other action here
          },
          child: Container(
            width: 113,
            height: 27,
            decoration: BoxDecoration(
              color: Colors.transparent,
              // You can add additional styling here if needed
            ),
            child: Center(
              child: Text(
                'Hospital',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF888888),
                  letterSpacing: -0.022,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
