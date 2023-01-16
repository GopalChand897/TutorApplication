import 'package:flutter/material.dart';

import 'package:testproject/screen/Dashboard.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
           //   backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
           //     onPressed: clearImage,
                                 onPressed: () {
    Navigator.pop(context);
    //                                 Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) =>  Dashboard()));
                    },
              ),
              title: const Text(
                'Payment Method',
              ),
              centerTitle: false,
            ),
    );
  }
}