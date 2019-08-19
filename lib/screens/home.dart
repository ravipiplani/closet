import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Color(0xFF00B9FF).withOpacity(0.7),
        centerTitle: true,
        leading: Container(
          padding: EdgeInsets.all(10),
          child: Image(
            image: AssetImage("assets/images/icon.png"),
          )
        ),
        // backgroundColor: Theme.of(context).primaryColorLight,
        title: Text('@rainasareen', style: Theme.of(context).textTheme.title.copyWith(color: Theme.of(context).primaryColor),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white70,),
            onPressed: null,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {}
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0, 1],
                colors: [
                  const Color(0xFF21D0FD).withOpacity(1),
                  const Color(0xFFEE4DB9).withOpacity(1)
                ],
              )
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.white24
                      )
                    )
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.keyboard_arrow_left, size: 40, color: Colors.white60,),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text('August 17',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.display2.copyWith(color: Colors.white, fontWeight: FontWeight.w200)
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              child: Text('SATURDAY',
                                style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white54)
                              ),
                            )
                          ],
                        )
                      ),
                      Icon(Icons.keyboard_arrow_right, size: 40, color: Colors.white60,)
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.white24
                      )
                    )
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: AssetImage("assets/images/icon.png"),
                                width: 100,
                                height: 100,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text('WORN TODAY',
                                  style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white54),),
                              )
                            ],
                          ),
                        )
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                width: 1,
                                color: Colors.white24
                              )
                            )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.wb_sunny, size: 32, color: Colors.white60,),
                                    Container(
                                      margin: EdgeInsets.only(left: 8),
                                      child: Text('36 ${String.fromCharCode(0x00B0)}',
                                        style: TextStyle(fontSize: 60),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text('GURGAON',
                                  style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white54),),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomAppBar(
              // shape: CircularNotchedRectangle(),
              // notchMargin: 4.0,
              color: Color(0xFF1D1D26).withOpacity(0.1),
              elevation: 0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.style,), onPressed: () {},),
                  IconButton(icon: Icon(Icons.whatshot), onPressed: () {},),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}