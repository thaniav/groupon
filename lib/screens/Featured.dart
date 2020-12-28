import 'package:flutter/material.dart';
import 'package:groupon/widgets/trendingCoupon.dart';
import 'package:groupon/models/featured_item';


class Featured extends StatefulWidget {

  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  List<Coupon> _coupons = coupons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groupon'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
          ),
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: null)
        ],
      ),
      body: ListView(
        children: <Widget>[
Column(
  children: _coupons.map(_buildCouponItems).toList(),
)


        ],

      ),

    );
  }

  Widget _buildCouponItems(Coupon coupon){
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Trending_Coupons(
        name: coupon.name,
        imagePath: coupon.imagePath,
        ratings: coupon.ratings,
        price: coupon.price,
        discount: coupon.discount,
        discountPercent: coupon.discount_percent,
      ),
    );
  }

}
