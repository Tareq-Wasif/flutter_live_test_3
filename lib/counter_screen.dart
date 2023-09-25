import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  void showCongratulationsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Button pressed $count times.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void incrementCount() {
    setState(() {
      count++;
      if (count >= 5) {
        showCongratulationsDialog();
      }
    });
  }

  void decrementCount() {
    if (count > 0) {
      setState(() {
        count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count:",style: TextStyle(fontSize:20),),

            Text(
              '$count',
              style: TextStyle(fontSize: 48),
            ),

            SizedBox(height:20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: incrementCount,
                  child: Icon(Icons.add,size: 20,),
                ),
                SizedBox(
                  width:25,
                ),
                ElevatedButton(
                  onPressed: decrementCount,
                  child: Icon(Icons.remove,size:20,),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
