import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ease_neura/widget_book/payment_screen.dart';

class DataWaktu {
  String selectedTime = '';
}

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DataWaktu dataWaktu = DataWaktu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      flexibleSpace: Align(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          margin: const EdgeInsets.only(top: 60, right: 20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Appointment',
                style: TextStyle(
                  color: Color(0xFF979797),
                  fontSize: 11,
                  fontFamily: 'Nunito-Regular',
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Book Expert',
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Doctor(doctorName: 'Prof. Budi Santoso, Ph.D.'),
          DoctorDetails(
            alumnus: 'Harvard University',
            hospital: 'RS Medika Utama',
            strNumber: '124716794169360',
          ),
          SizedBox(height: 20), // Add some spacing

          // Use Row instead of Column for the time slots
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildAvailHours('08.00', 0),
              buildAvailHours('09.00', 1),
              buildAvailHours('10.00', 2),
              buildAvailHours('11.00', 3),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildAvailHours('12.00', 4),
              SizedBox(width: 14),
              buildAvailHours('13.00', 5),
            ],
          ),

          SizedBox(height: 80),
          Center(
            child: ElevatedButton(
              onPressed: dataWaktu.selectedTime.isNotEmpty
                  ? () {
                      // Navigate to the ReceiptScreen page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PaymentScreen(dataWaktu: dataWaktu),
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: dataWaktu.selectedTime.isNotEmpty
                    ? const Color.fromARGB(255, 0, 0, 0)
                    : Colors.grey, // Warna teks
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 40.0),
                child: Text(
                  'Book',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAvailHours(String text, int index) {
    return AvailHours(
      text: text,
      isTapped: dataWaktu.selectedTime == text,
      onTap: () => handleAvailHoursTap(text),
    );
  }

  void handleAvailHoursTap(String selectedTime) {
    setState(() {
      dataWaktu.selectedTime = selectedTime;
    });
  }
}

class DoctorDetails extends StatelessWidget {
  final String alumnus;
  final String hospital;
  final String strNumber;

  DoctorDetails({
    required this.alumnus,
    required this.hospital,
    required this.strNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Alumnus: ',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: '\n$alumnus',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 40),
        RichText(
          text: TextSpan(
            text: 'Hospital: ',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: '\n$hospital',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 40), // Add some spacing

        RichText(
          text: TextSpan(
            text: 'strNumber: ',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: '\n$strNumber',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 40),

        Text(
          'Avail Hours:',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class Doctor extends StatelessWidget {
  final String doctorName;
  final String alumnus;
  final String hospital;
  final String strNumber;

  Doctor({
    required this.doctorName,
    this.alumnus = '',
    this.hospital = '',
    this.strNumber = '',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          width: 320,
          height: 125,
          margin: EdgeInsets.only(top: 15),
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
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Positioned(
                left: 100.27,
                top: 10.67,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.work_outlined),
                        SizedBox(width: 5),
                        Text(
                          '7 years',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 30),
                        RatingBar(
                          ratingWidget: RatingWidget(
                            full: Icon(Icons.star, color: Colors.black),
                            half: Icon(Icons.star_half, color: Colors.black),
                            empty: Icon(Icons.star_border, color: Colors.black),
                          ),
                          itemSize: 15,
                          initialRating: 4.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          onRatingUpdate: (rating) {
                            // You can handle the rating update
                          },
                        ),
                        SizedBox(width: 5),
                        Text(
                          '4.5',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
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

class AvailHours extends StatefulWidget {
  final String text;
  final bool isTapped;
  final VoidCallback onTap;

  AvailHours(
      {Key? key,
      required this.text,
      required this.isTapped,
      required this.onTap})
      : super(key: key);

  @override
  _AvailHoursState createState() => _AvailHoursState();
}

class _AvailHoursState extends State<AvailHours> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 90,
        height: 50,
        decoration: BoxDecoration(
          color: widget.isTapped ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              fontSize: 22.25,
              color: widget.isTapped ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
