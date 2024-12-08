import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback? onPressed;
  const ErrorScreen({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/error_message.png",
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.2),
            SizedBox(height: 24),
            Text("Something Went Wrong.", textAlign: TextAlign.center),
            SizedBox(height: 56),
            ElevatedButton(onPressed: onPressed, child: Text("Retry"))
          ],
        ),
      ),
    );
  }
}