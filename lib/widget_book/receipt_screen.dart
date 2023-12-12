import 'package:ease_neura/widget_book/booking_screen.dart';
import 'package:flutter/material.dart';

class ReceiptScreen extends StatelessWidget {
  final DataWaktu dataWaktu;

  ReceiptScreen({required this.dataWaktu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RECEIPT'), // Ubah judul sesuai kebutuhan
      ),
      body: Center(
        child: Container(
          width: 360,
          height: 500, // Atur lebar Container sesuai kebutuhan
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white, // Set warna latar belakang box
            borderRadius:
                BorderRadius.circular(20.0), // Tambahkan border radius
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Receipt Details',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 0),
              // Tambahkan widget atau informasi lainnya sesuai kebutuhan
              Text('Price: Rp 100,000'), // Ganti dengan harga yang sesuai
              // Tambahkan informasi lainnya
              SizedBox(height: 20.0),
              Doctor(doctorName: 'Prof. Budi Santoso, Ph.D.'),
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
                      text: '\nRS Medika Utama',
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
              SizedBox(height: 30.0),
              RichText(
                text: TextSpan(
                  text: 'Appointment Time: ',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: '\n${dataWaktu.selectedTime}',
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
            ],
          ),
        ),
      ),
    );
  }
}
