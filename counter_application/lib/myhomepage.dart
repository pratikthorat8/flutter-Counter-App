import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {

      if (_counter <= 0) {
        _counter = 0;
      }

      if (_counter == 0) {
        const snackBar = SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            'Counter cannot go below zero',
            style: TextStyle(color: Colors.white),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else{
        _counter--;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      if (_counter == 0) {
        const snackBar = SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            'Counter is already set to zero',
            style: TextStyle(color: Colors.white),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        _counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //ignore: deprecated_member_use
                RaisedButton(
                  color: Colors.blue,
                  child: const Text(
                    "Increment",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _incrementCounter,
                ),

                //ignore: deprecated_member_use
                RaisedButton(
                  color: Colors.blue,
                  child: const Text(
                    "Reset",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _resetCounter,
                ),
                //ignore: deprecated_member_use
                RaisedButton(
                  color: Colors.blue,
                  child: const Text(
                    "Decrement",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _decrementCounter,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
