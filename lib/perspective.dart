// Add transform widget, rotate and perspective
import 'package:flutter/material.dart';

class PerspectiveWidget extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  PerspectiveWidget({required Key? key}) : super(key: key); // changed

  @override
  _PerspectiveWidgetState createState() => _PerspectiveWidgetState();
}

class _PerspectiveWidgetState extends State<PerspectiveWidget> {
  int _counter = 0;
  Offset _offset = const Offset(0.4, 0.7); // new

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        // Transform widget
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) // perspective
          ..rotateX(0.01 * _offset.dy)
          ..rotateY(-0.01 * _offset.dx),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          // new
          onPanUpdate: (details) => setState(() => _offset += details.delta),
          onDoubleTap: () => setState(() => _offset = Offset.zero),
          child: _defaultApp(context),
        ));
  }

  _defaultApp(BuildContext context) {
    // new
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Matrix 3D'), // changed
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
