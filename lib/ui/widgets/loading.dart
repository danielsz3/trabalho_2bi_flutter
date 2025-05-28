import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, required String message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 200,
        alignment: Alignment.center,
        //color: Colors.grey.shade400,
        child: Column(
          children: [
            CircularProgressIndicator(strokeWidth: 5, color: Color(0XFFFA6F3E)),
            Text('Loading...', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
