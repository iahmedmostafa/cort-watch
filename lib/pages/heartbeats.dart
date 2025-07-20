import 'package:cortwatch/main_home.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';

class HeartbeatScreen extends StatefulWidget {
  @override
  _HeartbeatScreenState createState() => _HeartbeatScreenState();
}

class _HeartbeatScreenState extends State<HeartbeatScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _moveAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _moveAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    _startAnimation();
  }

  void _startAnimation() {
    _controller.reset();
    _controller.forward().whenComplete(() {
      _showHeartRateDialog();
    });
  }

  void _showHeartRateDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: "Your Heart Rate is : 75 BPM",
      titleTextStyle: TextStyle(fontSize: 22, color: Colors.black),
      btnCancelText: "Again",
      btnCancelOnPress: () {
        _startAnimation();
      },
      btnOkText: "Ok",
      btnOkOnPress: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MainHome()));
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Measure your heart rate! ",style: TextStyle(color: Colors.white,fontSize: 25),),
        backgroundColor: Colors.black26,
        leading: Icon(Icons.monitor_heart,color: Colors.white,),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: HeartbeatPainter(_moveAnimation.value),
            size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class HeartbeatPainter extends CustomPainter {
  final double progress;
  HeartbeatPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Path path = Path();
    double midY = size.height / 2;
    double width = size.width;
    double offsetX = -width * progress;

    path.moveTo(offsetX + 0, midY);

    for (double i = 0; i < 3; i++) {
      double shift = i * width * 0.6;

      path.lineTo(offsetX + shift + width * 0.1, midY);
      path.lineTo(offsetX + shift + width * 0.15, midY - 80);
      path.lineTo(offsetX + shift + width * 0.2, midY + 120);
      path.lineTo(offsetX + shift + width * 0.25, midY - 60);
      path.lineTo(offsetX + shift + width * 0.3, midY);

      path.lineTo(offsetX + shift + width * 0.4, midY);
      path.lineTo(offsetX + shift + width * 0.45, midY - 90);
      path.lineTo(offsetX + shift + width * 0.5, midY + 130);
      path.lineTo(offsetX + shift + width * 0.55, midY - 70);
      path.lineTo(offsetX + shift + width * 0.6, midY);
    }

    paint.maskFilter = MaskFilter.blur(BlurStyle.solid, 4);
    paint.color = Color.lerp(Colors.red, Colors.white, progress)!;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
