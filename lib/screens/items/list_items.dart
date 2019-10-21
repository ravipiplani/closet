import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItems extends StatefulWidget {
  final String itemType;

  ListItems({Key key, @required this.itemType}) : super(key: key);

  _ListItemsState createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {

  int selectedChip = 0;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.itemType, style: Theme.of(context).textTheme.title,),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
                      selectedChip = selected ? index : "";
                    });
                  }
                );
              })
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.only(top: 16),
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                primary: true,
                children: List.generate(10, (index) {
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
                }),
              ),
            )
          ]
        ),
      )
    );
  }

  Widget colorGroup(String label, Color color, int itemCount) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.6),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Text(label, style: Theme.of(context).textTheme.display3.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: IgnorePointer(
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                primary: true,
                children: List.generate(itemCount, (index) {
                  return Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Image(
                      image: AssetImage("assets/images/item-type-top.png"),
                      color: color,
                    ),
                  );
                }),
              )
            ),
          )
        ],
      ),
    );
  }
}