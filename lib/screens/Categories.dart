import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView(


        children: <Widget>[ Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 100.0,
                    child: Card(
                      color: Color(0xFFF1EFF1),
                      child: Center(child: Text('Nearby')),
                      elevation: 0.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100.0,
                    child: Card(
                      color: Color(0xFFF7F1EF),
                      child: Center(child: Text('Goods')),
                      elevation: 0.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100.0,
                    child: Card(
                      color: Color(0xFFF1EFF1),
                      child: Center(child: Text('Hotels & Travel')),
                      elevation: 0.0,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 100.0,
                    child: Card(
                      color: Color(0xFFF1EFF1),
                      child: Center(child: Text('Things To Do')),
                      elevation: 0.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100.0,
                    child: Card(
                      color: Color(0xFFF7F1EF),
                      child: Center(child: Text('Beauty and Spas')),
                      elevation: 0.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100.0,
                    child: Card(
                      color: Color(0xFFF1EFF1),
                      child: Center(child: Text('Food & Drink')),
                      elevation: 0.0,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 100.0,
                    child: Card(
                      color: Color(0xFFF1EFF1),
                      child: Center(child: Text('Tickets & Events')),
                      elevation: 0.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100.0,
                    child: Card(
                      color: Color(0xFFF7F1EF),
                      child: Center(child: Text('Women\'s fashion')),
                      elevation: 0.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100.0,
                    child: Card(
                      elevation: 0.0,
                      color: Color(0xFFF1EFF1),
                      child: Center(child: Text('Health & Fitness')),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
          SizedBox(width: 10.0,),

          Column(
            children: <Widget>[
              Text('All Categories',
              style: TextStyle(
                fontSize: 20.0,
              ),),
              VerticalDivider(color: Colors.black, thickness: 2.0,),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(child: Text('All Local Deals',style: TextStyle(fontSize: 16.0),)),




                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(child: Text('Beauty & Spas',style: TextStyle(fontSize: 16.0),)),
                  IconButton(
                    icon: Icon(Icons.add_circle),
                  )



                ],
              ),
              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(child: Text('Home Services (351)',style: TextStyle(fontSize: 16.0),)),
                  IconButton(
                    icon: Icon(Icons.add_circle),
                  )



                ],
              ),
              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(child: Text('Health & Fitness (1687)',style: TextStyle(fontSize: 16.0),)),
                  IconButton(
                    icon: Icon(Icons.add_circle),
                  )



                ],
              ),
              Divider(),



            ],
          )

          ],
        ),
        ]
      ),
    );
  }
}
