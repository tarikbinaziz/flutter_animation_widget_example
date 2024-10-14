// Why use AnimatedContainer
/*
AnimatedContainer:-
It provides automatic interpolation between the old and new property values, making it great for basic transitions like:

1. Changing size (width and height)
2. Changing color
3. Changing alignment
4. Changing padding, margin, border radius, etc.


// Need Properties
  1. Curve
  2. Duration

*/

import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainer Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: _isExpanded ? 200 : 100,
              height: _isExpanded ? 200 : 100,
              color: _isExpanded ? Colors.blue : Colors.red,
              alignment: _isExpanded
                  ? Alignment.center
                  : AlignmentDirectional.topStart,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: const FlutterLogo(size: 75),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                label: const Text('Apply Animation'),
                icon: const Icon(Icons.change_circle)),
          ],
        ),
      ),
    );
  }
}
