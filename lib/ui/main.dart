import 'package:demo_dio/model/MyDelegateFlow.dart';
import 'package:demo_dio/ui/DioScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Demo Dio",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.cyan,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: Stack(
          children: [
            DioScreen(),
            GestureDetector(
              onTap: () {
                if (controller.isCompleted) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
              },
              child: Flow(
                delegate: MyDelegateFlow(controller),
                children: [
                  Icon(Icons.eighteen_mp),
                  Icon(Icons.safety_check),
                  Icon(Icons.factory),
                  Icon(Icons.vaccines),
                  Icon(Icons.add),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
