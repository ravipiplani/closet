import 'package:badges/badges.dart';
import 'package:vastram/components/decorated_container.dart';
import 'package:flutter/material.dart';
import 'package:vastram/routes.dart';

class Styles extends StatefulWidget {
  Styles({Key key}) : super(key: key);

  _StylesState createState() => _StylesState();
}

class _StylesState extends State<Styles> {
  List<Map> _categories = [
    {
      "name": "top",
      "image": "item-type-top.png"
    },
    {
      "name": "bottom",
      "image": "item-type-bottom.png"
    },
    {
      "name": "footwear",
      "image": "item-type-footwear.png"
    },
    {
      "name": "accessory",
      "image": "item-type-accessory.png"
    },
    {
      "name": "lingerie",
      "image": "item-type-lingerie.png"
    }
  ];
  int selectedCategoryIndex = 0;

  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.pink,
    Colors.black,
    Colors.white,
  ];
  int selectedChip = 0;

  @override
  void initState() {
    selectedCategoryIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_categories);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          // backgroundColor: Theme.of(context).primaryColor,
          leading: Container(),
          elevation: 0.0,
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
                    image: AssetImage("assets/images/item-type-footwear.png"),
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
    List<Widget> items = List.generate(10, (index) {
      return Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Image(
          image: AssetImage("assets/images/item-type-top.png"),
          color: Colors.grey,
        ),
      );
    });
    items.insert(0, Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.newItemScreen);
        },
      )
    ));
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent
      ),
      child: DefaultTabController(
        length: _categories.length,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            leading: Container(),
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
            flexibleSpace: SafeArea(
              child: TabBar(
                onTap: (index) {
                  setState(() {
                    selectedCategoryIndex = index;
                  });
                },
                indicatorColor: Colors.transparent,
                unselectedLabelColor: Colors.red,
                tabs: List<Widget>.generate(_categories.length, (int index) {
                  return Tab(
                    child: categoryBadge(index),
                  );
                })
              )
            )
          ),
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(colors.length, (index) {
                    return ChoiceChip(
                      labelPadding: EdgeInsets.all(0),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      selected: selectedChip == index,
                      label: Text(''),
                      selectedColor: colors[index],
                      backgroundColor: colors[index],
                      avatar: selectedChip == index ? Icon(Icons.check, color: colors[index] == Colors.white ? Colors.black: Colors.white) : null,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedChip = selected ? index : null;
                        });
                      }
                    );
                  })
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      Container(
                        child: GridView.count(
                          padding: EdgeInsets.only(top: 16),
                          crossAxisCount: 4,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          shrinkWrap: true,
                          primary: true,
                          children: items,
                        ),
                      ),
                      Container(),
                      Container(),
                      Container(),
                      Container()
                    ],
                  ),
                )
              ],
            )
          )
        )
      )
    );
  }

  Widget categoryBadge (index) {
    return Container(
      margin: EdgeInsets.only(bottom: 0, top: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        child: Image(
          image: AssetImage("assets/images/" + _categories[index]['image']),
          height: 40,
          color: selectedCategoryIndex == index ? Theme.of(context).accentColor : Colors.grey.shade500
        ),
        decoration: BoxDecoration(
          color: selectedCategoryIndex == index ? Theme.of(context).accentColor.withOpacity(0.2) : Colors.white,
          border: Border.all(width: 1, color: selectedCategoryIndex == index ? Theme.of(context).accentColor.withOpacity(0.4) : Colors.grey.shade400),
          borderRadius: BorderRadius.circular(5.0),
        ),
      )
    );
  }
}