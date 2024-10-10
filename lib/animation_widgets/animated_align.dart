import 'package:flutter/material.dart';

/*
// Need Properties
  1. Curve
  2. Duration
*/

class AnimatedAlignExample extends StatelessWidget {
  const AnimatedAlignExample({super.key});

  static const Duration _duration = Duration(seconds: 1);
  static const Curve _curve = Curves.easeInOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedAlign Sample')),
      body: const AnimatedAlignExampleWidget(
        duration: _duration,
        curve: _curve,
      ),
    );
  }
}

class AnimatedAlignExampleWidget extends StatefulWidget {
  const AnimatedAlignExampleWidget({
    required this.duration,
    required this.curve,
    super.key,
  });
  final Duration duration;
  final Curve curve;

  @override
  _AnimatedAlignState createState() => _AnimatedAlignState();
}

class _AnimatedAlignState extends State<AnimatedAlignExampleWidget> {
  bool changeAlign = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 250.0,
            height: 250.0,
            color: Colors.grey,
            child: AnimatedAlign(
                duration: widget.duration,
                curve: widget.curve,
                alignment:
                    changeAlign ? Alignment.topRight : Alignment.bottomLeft,
                child: const FlutterLogo(size: 50)),
          ),
          const SizedBox(height: 40.0),
          ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  changeAlign = !changeAlign;
                });
              },
              label: const Text('Change Align'),
              icon: const Icon(Icons.change_circle)),
        ],
      ),
    );
  }
}
