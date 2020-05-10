import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _tabController;

  List<String> _titles = [
    "tab",
    "tab",
    "tab",
    "tab",
  ];

  bool _isStop = false;

  void _addTab() {
    setState(() {
      _titles.add("additional tab");
      _tabController = _createNewTabController();
    });
  }

  void _removeTab() {
    setState(() {
      _titles.removeLast();
      _tabController = _createNewTabController();
    });
  }

  TabController _createNewTabController() => TabController(
        vsync: this,
        length: _titles.length,
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: _titles.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _titles
              .map(
                (t) => Tab(
                  text: t,
                ),
              )
              .toList(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                _addTab();
              },
              child: Text(
                "start increment",
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                print('pressed');
                setState(() {
                  _removeTab();
                });
              },
              child: Text(
                "stop increment",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
