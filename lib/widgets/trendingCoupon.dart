import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupon/screens/OpenedItem.dart';

class Trending_Coupons extends StatefulWidget {
  final String name;
  final String imagePath;
  final int ratings;
  final double price;
  final double discount;
  final double discountPercent;
  Trending_Coupons({this.name, this.imagePath, this.ratings, this.price, this.discount, this.discountPercent});

  @override
  _Trending_CouponsState createState() => _Trending_CouponsState();
}

class _Trending_CouponsState extends State<Trending_Coupons> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>
          Navigator.of(context).push(
              MaterialPageRoute(
                //passing the product details from this product class to the product detail class
                  builder: (context)=> OpenedItem(
             name: widget.name,
                    price: widget.price,
                    discountPercent: widget.discountPercent,
                    discount: widget.discount,
                    ratings: widget.ratings,
                    imagePath: widget.imagePath,
                  ))),
      child: ClipRRect(
        child: Stack(
          children: <Widget>[
            Container(
              height: 200.0,
              width: 740.0,
              child: Image.asset(
                widget.imagePath
              ),
            ),
            Positioned(
              left: 0.0,
              bottom: 0.0,
              right: 0.0,
              child: Container(
                height: 70.0,
                width: 340.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black, Colors.black12
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                  )
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 8.0,
              right: 8.0,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                     Row(
                        children: <Widget>[
                          Icon(Icons.favorite,
                          color: Colors.red,),
                          SizedBox(width: 10.0,),
                          Text(widget.name,
                          style: TextStyle(color: Colors.white,
                          fontSize: 15.0),
                          )

                        ],
                      ),

                      Row(
                        children: <Widget>[
                          SizedBox(width: 20.0),
                          Icon(Icons.star, size: 15.0,
                        ),
                          Icon(Icons.star, size: 15.0,
                          ),
                          Icon(Icons.star, size: 15.0,
                          ),
                          Icon(Icons.star, size: 15.0,
                          ),
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          SizedBox(width: 50.0),
                          Text(widget.price.toString(), style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 20.0, color: Colors.grey),),
                          SizedBox(width: 10.0,),
                          Text(widget.discount.toString(), style: TextStyle(color: Colors.green, fontSize: 20.0),),
                          SizedBox(width: 10.0,),
                          Container(
                            width: 50.0,
                            height: 20.0,
                            color: Colors.green,
                            child: Center(child: Text(widget.discountPercent.toString()+"% off")),

                          )

                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
