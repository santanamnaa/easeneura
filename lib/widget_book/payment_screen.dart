import 'package:ease_neura/widget_book/receipt_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ease_neura/widget_book/booking_screen.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final DataWaktu dataWaktu;

  PaymentScreen({required this.dataWaktu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: MiddleView(dataWaktu: dataWaktu),
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
                'Book Expert',
                style: TextStyle(
                  color: Color(0xFF979797),
                  fontSize: 11,
                  fontFamily: 'Nunito-Regular',
                ),
              ),
              SizedBox(height: 2),
              Text(
                'payment',
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
}

class MiddleView extends StatelessWidget {
  final DataWaktu dataWaktu;

  const MiddleView({Key? key, required this.dataWaktu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: AppointmentDetails(dataWaktu: dataWaktu),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
              color: Colors.black, // Warna animasi loading
              size: 50.0, // Ukuran animasi loading
            ),
            SizedBox(height: 16),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}

class AppointmentDetails extends StatefulWidget {
  final DataWaktu dataWaktu;

  const AppointmentDetails({Key? key, required this.dataWaktu})
      : super(key: key);

  @override
  _AppointmentDetailsState createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  String paymentMethod = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingScreen()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Appointment Details',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.black),
                  SizedBox(width: 10),
                  Text(
                    'Selected Time:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                getFormattedTimeRange(widget.dataWaktu.selectedTime),
                style: TextStyle(
                  fontSize: 16.0,
                  color: widget.dataWaktu.selectedTime.isNotEmpty
                      ? Colors.black
                      : Colors.red,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.attach_money, color: Colors.black),
                  SizedBox(width: 10),
                  Text(
                    'Price:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Rp 100,000', // Change this to the actual price
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.payment, color: Colors.black),
                  SizedBox(width: 10),
                  Text(
                    'Payment Method:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  buildPaymentMethod('Cash', 'cash'),
                  SizedBox(width: 10),
                  buildPaymentMethod('Credit Card', 'credit_card'),
                ],
              ),
              SizedBox(height: 50),
              Center(
                child: InkWell(
                  onTap: paymentMethod.isNotEmpty
                      ? () {
                          setState(() {
                            isLoading = true;
                          });
                          Future.delayed(Duration(seconds: 2), () {
                            setState(() {
                              isLoading = false;
                            });
                            NavigatetoReceiptScreen(context);
                          });
                        }
                      : null,
                  child: Ink(
                    decoration: BoxDecoration(
                      color: paymentMethod.isNotEmpty
                          ? Colors.black
                          : Colors.grey, // Warna latar belakang
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Warna teks
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
  }

  Widget buildPaymentMethod(String label, String method) {
    return GestureDetector(
      onTap: () {
        setState(() {
          paymentMethod = method;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: paymentMethod == method ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: paymentMethod == method ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  String getFormattedTimeRange(String selectedTime) {
    return selectedTime.isNotEmpty
        ? '$selectedTime - ${getNextHour(selectedTime)}'
        : 'No time selected';
  }

  String getNextHour(String time) {
    return time.isNotEmpty
        ? '${(int.parse(time.split('.')[0]) + 1).toString().padLeft(2, '0')}.00'
        : '';
  }

  void NavigatetoReceiptScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ReceiptScreen(dataWaktu: widget.dataWaktu),
      ),
    ).then((_) {
      // Show a success notification after navigating
      Fluttertoast.showToast(
        msg: "Payment successful!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    });
  }
}
