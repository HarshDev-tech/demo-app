import 'package:flutter/material.dart';

class NoDataScreen extends StatelessWidget {
  final VoidCallback? onPressed;
  const NoDataScreen({super.key, this.onPressed});

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
            Image.asset("assets/images/no_data.png",
            width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.2),
            SizedBox(height: 24),
            Text("No images available. Connect to the internet and retry to load and save them for offline use.", textAlign: TextAlign.center),
            SizedBox(height: 56),
            ElevatedButton(onPressed: onPressed, child: Text("Refresh Now"))
          ],
        ),
      ),
    );
  }
}