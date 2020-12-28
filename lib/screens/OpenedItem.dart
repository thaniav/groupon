import 'package:flutter/material.dart';

class OpenedItem extends StatefulWidget {
  final String name;
  final String imagePath;
  final int ratings;
  final double price;
  final double discount;
  final double discountPercent;

  const OpenedItem({this.name, this.imagePath, this.ratings, this.price, this.discount, this.discountPercent});
  @override
  _OpenedItemState createState() => _OpenedItemState();
}

class _OpenedItemState extends State<OpenedItem> {
 final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  void _showModalSheet(){
    showModalBottomSheet(context: context, builder: (builder){
      return Container(
        height: 100.0,

        color: Colors.black,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text('Quantity 1' , style: TextStyle(color: Colors.grey),),
                  Text('Apply Promo', style: TextStyle(color: Colors.grey),)
              ],),
            ),
            Divider(color: Colors.grey,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("\$"+widget.discount.toString(), style: TextStyle(color: Colors.grey),),
                ),
                RaisedButton(
                  onPressed: (){},
                  color: Colors.white,
                  child: Text('Pay'),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showModalSheet();
        },
        backgroundColor: Colors.green,
child: Icon(
  Icons.add_circle
),
      ),
      key: _scaffoldKey,

      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.imagePath),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(widget.name,style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 20.0
                  ),),
                  subtitle: Text("Ratings ("+widget.ratings.toString()+")"),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("\$${widget.price}",style: TextStyle(
                          color: Colors.grey,decoration: TextDecoration.lineThrough,
                        fontSize: 20.0,
                      ),),
                      Text("\$${widget.discount}",style: TextStyle(
                          color: Colors.green,fontWeight: FontWeight.bold,
                        fontSize: 20.0
                      ),),
                    ],
                  ),
                ),
              ),

            ),
          ),
          //============FIRST BUTTON=========

          //==========THE SECOND BUTTON========

          Divider(),
          ListTile(
            title: Text("Description"),

          ),


        ],
      ),
    );
  }

}


