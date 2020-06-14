import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginfirebase/bottombar.dart';
import 'package:loginfirebase/planetdetail.dart';
import 'package:loginfirebase/planetpage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {},
        ),
        title: Text('PROJECT',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Colors.black26)),
        actions: <Widget>[
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 15.0),
          Text('PENGENALAN PLANET UNTUK PAUD',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10.0),
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.grey,
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 45.0),
              unselectedLabelColor: Colors.black26,
              tabs: [
                Tab(
                  child: Text('Planet Dalam',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                ),
                Tab(
                  child: Text('Planet Luar',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                ),
              ]),
          Container(
              height: MediaQuery.of(context).size.height - 30.0,
              width: double.infinity,
              child: TabBarView(
                  controller: _tabController,
                  children: [
                    Page1(),
                    Page2(),
//                    Page1(),
                  ]
              )
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(onPressed: () {},
        backgroundColor: Color(0xFFF17532),
        child :InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Matahari()));
            },
            child: Icon(Icons.wb_sunny)) ,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}