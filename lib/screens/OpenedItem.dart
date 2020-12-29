import 'package:flutter/material.dart';
import 'package:groupon/models/uid.dart';
import 'package:groupon/services/database.dart';

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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Description"),
                InkWell(
                  splashColor: Colors.green,
                  onTap: () async {
await DatabaseService(uid: current_user_uid).updateRecentlyViewed(
    widget.name, widget.imagePath, widget.ratings, widget.price, widget.discount, widget.discountPercent);
                  },
                  child: Container(
width: 100.0,
                   decoration: BoxDecoration(
                     border: Border.all(
                       width: 1.0

                     )
                   ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Save'),
                        IconButton(
                          onPressed: (){

                          },
                          color: Colors.pink,
                          icon: Icon(Icons.favorite),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

          ),


        ],
      ),
    );
  }

}


