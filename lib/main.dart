import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'My heart when code works'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  int _counter = 0;
  AnimationController _animationController;
  Animation<double> _animation;

  void _animate() {

  }

  @override void initState() {
    super.initState();

    _animationController= AnimationController(
      vsync: this,
      duration:Duration(milliseconds: 100),
    );
    _animationController.forward();
    _animation =Tween<double>(begin: 1.0, end: 1.5).animate(_animationController);
    _animation.addStatusListener((status) {
      if(status == AnimationStatus.completed)
        _animationController.reverse();
    });

    _animation.addStatusListener((status) {
      if(status==AnimationStatus.dismissed){
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:ScaleTransition(
          scale: _animation,
          child: Container(
            child: Image.asset('assets/heart.png'),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _animate,
      //   tooltip: 'Animate',
      //   child: Icon(Icons.play_arrow),
      // ),
    );
  }
}
