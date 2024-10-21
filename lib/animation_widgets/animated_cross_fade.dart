// AnimatedCrossFade is a great choice when you need to swap between two views with a sleek,
// animated transition that’s simple to implement and visually engaging

/*
The main properties of AnimatedCrossFade are:

1.firstChild: The widget to display initially.
2.secondChild: The widget to display when the transition occurs.
3.crossFadeState: Controls which widget to show (CrossFadeState.showFirst or CrossFadeState.showSecond).
4.duration: The length of the animation.
5.sizeCurve: The animation curve for the size transition (e.g., Curves.easeInOut).
6.alignment: Aligns the children within the widget (default is Alignment.center).
7.layoutBuilder: Allows customization of the layout when both children overlap during the transition.

*/

import 'package:flutter/material.dart';

class CrossFadeDemo extends StatefulWidget {
  const CrossFadeDemo({super.key});

  @override
  _CrossFadeDemoState createState() => _CrossFadeDemoState();
}

class _CrossFadeDemoState extends State<CrossFadeDemo> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedCrossFade Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              firstChild: const FlutterLogo(size: 150),
              secondChild: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withOpacity(0.1),
                ),
                child: const Center(
                  child: Text(
                    'This is a description',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              crossFadeState: _showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showFirst = !_showFirst;
                });
              },
              child: const Text('Toggle View'),
            ),
          ],
        ),
      ),
    );
  }
}
