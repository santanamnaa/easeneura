import 'package:ease_neura/widget_book/booking_screen.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: MiddleView(), // Use MiddleView here
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

class ExpertBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the onTap for Expert
        print("Expert tapped");
        // Add your navigation logic or any other action here
      },
      child: Container(
        width: 115,
        height: 27,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),

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
    );
  }
}

class Hospital extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the onTap for Expert
        print("Hospital Tapped");
        // Add your navigation logic or any other action here
      },
      child: Container(
        width: 113,
        height: 27,
        decoration: BoxDecoration(
          color: const Color.fromARGB(0, 177, 177, 177),
          // You can add additional styling here if needed
        ),
        child: Center(
          child: Text(
            'Hospital',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color.fromARGB(255, 101, 101, 101),
              letterSpacing: -0.022,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class Doctor extends StatelessWidget {
  final String doctorName;

  Doctor({required this.doctorName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the desired page and pass the information
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookingScreen(),
          ),
        );
      },
      child: Container(
        width: 280,
        height: 95,
        margin: EdgeInsets.only(left: 0, top: 15, right: 0),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 80.3,
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/doctor2.png'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.black, width: 1.41667),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Positioned(
              left: 100.27,
              top: 16.67,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    width: 86,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5.76786),
                    ),
                    child: Center(
                      child: Text(
                        'Book',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 13.8316,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 51,
      height: 15,
      margin: EdgeInsets.only(left: 0, top: 0),
      color: Color(0xFFE3E3E3),
      child: Stack(
        children: [
          Positioned(
            left: 2,
            top: 2,
            child: Container(
              width: 10.89,
              height: 10.89,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            left: 28,
            top: 3,
            child: Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(
                color: Color(0xFF020202),
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: 3,
            child: Text(
              '7y',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                fontSize: 6.53333,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            left: 39,
            top: 3,
            child: Text(
              '4.5',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                fontSize: 6.53333,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildBody(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ExpertBox(),
        Hospital(),
      ],
    ),
  );
}

class MiddleView extends StatelessWidget {
  const MiddleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildBody(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Doctor(
                  doctorName: 'Prof. Rina, Ph.D.',
                ),
                CustomIcon()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Doctor(
                  doctorName: 'Prof. Rina, Ph.D.',
                ),
                CustomIcon()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Doctor(
                  doctorName: 'Prof. Rina, Ph.D.',
                ),
                CustomIcon()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Doctor(
                  doctorName: 'Prof. Rina, Ph.D.',
                ),
                CustomIcon()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Doctor(
                  doctorName: 'Prof. Rina, Ph.D.',
                ),
                CustomIcon()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Doctor(
                  doctorName: 'Prof. Rina, Ph.D.',
                ),
                CustomIcon()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Doctor(
                  doctorName: 'Prof. Rina, Ph.D.',
                ),
                CustomIcon()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Doctor(
                  doctorName: 'Prof. Rina, Ph.D.',
                ),
                CustomIcon()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
