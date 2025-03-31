import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DischargeScreen extends StatefulWidget {
  @override
  State<DischargeScreen> createState() => _DischargeScreenState();
}

class _DischargeScreenState extends State<DischargeScreen>{
@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFA9BDBF), Color(0xFF1768A6)],
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/images/logo.png',
                height: 200,
                width: 180,
              ),
            ),
            Expanded(
              // padding: const EdgeInsets.only(left: 10),
              child: Transform.translate(
                offset: Offset(-70, 0), //dịch phần tử sang trái 20px
                child: Text(
                  "Phiếu xuất kho sản xuất",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        // backgroundColor: Colors.red[700],
      ),
    ),  );
}
}
