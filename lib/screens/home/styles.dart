import 'package:closet/components/decorated_container.dart';
import 'package:closet/screens/items/list_items.dart';
import 'package:flutter/material.dart';

class Styles extends StatefulWidget {
  Styles({Key key}) : super(key: key);

  _StylesState createState() => _StylesState();
}

class _StylesState extends State<Styles> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: SafeArea(
            child: TabBar(
              labelPadding: EdgeInsets.only(top: 5),
              labelColor: Theme.of(context).accentColor,
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.white24,
              tabs: [
                Tab(text: 'OUTFITS',),
                Tab(text: 'MY WARDROBE',)
              ],
            )
          )
        ),
        body: TabBarView(
          children: <Widget>[
            outfits,
            items
          ],
        ),
      ),
    );
  }

  Widget get outfits {
    return DecoratedContainer(
      padding: EdgeInsets.all(8),
      showImage: false,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(10, (index) {
          return DecoratedContainer(
            showImage: false,
            showGradient: false,
            // borderRight: (index + 1) / 2 == 0 ? false : true,
            // borderBottom: true,
            color: Colors.transparent,
            padding: EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/images/item-type-top.png"),
                  ),
                  Image(
                    image: AssetImage("assets/images/item-type-bottom.png"),
                  ),
                  Image(
                    image: AssetImage("assets/images/item-type-footwears.png"),
                  ),
                  Image(
                    image: AssetImage("assets/images/item-type-lingerie.png"),
                  )
                ],
              ),
            ),
          );
        })
      ),
    );
  }

  Widget get items {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          group('Tops', 'item-type-top.png'),
          group('Bottoms', 'item-type-bottom.png'),
          group('Footwears', 'item-type-footwears.png'),
          group('Acessories', 'item-type-accessories.png'),
          group('Lingerie', 'item-type-lingerie.png'),
        ],
      ),
    );
  }

  Widget group (text, image) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              opaque: true,
              pageBuilder: (BuildContext context, _, __) {
                return ListItems(itemType: text);
              },
              transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                return SlideTransition(
                  child: child,
                  position: Tween<Offset>(
                    begin: Offset(500, 0),
                    end: Offset.zero
                  ).animate(animation),
                );
              },
            )
          );
        },
        splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
        child: Container(
          height: 200,
          padding: EdgeInsets.only(left: 40),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0, 1],
              colors: [
                const Color(0xFF21D0FD).withOpacity(0.2),
                const Color(0xFFEE4DB9).withOpacity(0.2)
              ],
            ),
            border: Border(
              top: BorderSide(
                width: 1,
                color: Theme.of(context).primaryColor.withOpacity(0.3)
              ) 
            )
          ),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(text, style: Theme.of(context).textTheme.display2.copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                  DecoratedContainer(
                    showGradient: false,
                    showImage: false,
                    color: Colors.transparent,
                    margin: EdgeInsets.only(top: 12),
                    child: Text('10 Items', style: Theme.of(context).textTheme.display3),
                  )
                ],
              ),
              Positioned(
                bottom: -100,
                right: -20,
                child: Opacity(
                  opacity: 0.3,
                  child: Image(
                    image: AssetImage("assets/images/$image"),
                    height: 260,
                  ),
                )
              )
            ],
          )
        ),
      )
    );
  }
}