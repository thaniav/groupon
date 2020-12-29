import 'package:flutter/material.dart';
import 'package:groupon/models/featured_item';
import 'package:groupon/models/uid.dart';
import 'package:groupon/services/database.dart';
import 'package:groupon/widgets/trendingCoupon.dart';


class Saved extends StatefulWidget {
  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved'),
        backgroundColor: Colors.green,

      ),
      body: Column(
        children: <Widget>[


StreamBuilder<List<Coupon>>(
  stream: DatabaseService(uid: current_user_uid).recentlyViewedData,
  builder: (context, snapshot) {
if(snapshot.hasData){
List<Coupon> couponData=snapshot.data;
List<Trending_Coupons> savedCoupons=[];
for (var coupon in couponData) {
  final couponWidget = Trending_Coupons(
   name: coupon.name,
    price: coupon.price,
    imagePath: coupon.imagePath,
    ratings: coupon.ratings,
    discount: coupon.discount,
    discountPercent: coupon.discount_percent,
  );
  savedCoupons.add(couponWidget);
}
    return Expanded(
      child: ListView(
        children: <Widget> [ Column(
          children: savedCoupons,
        ),
        ]
      ),
    );
    }
    else{
      return Container();
    }

  }
),

          Container(
            height: 50.0,

            color: Color(0xFFF1EFF1),

            child: Row(

              mainAxisSize: MainAxisSize.max,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Recently Viewed', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}


