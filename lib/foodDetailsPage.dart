import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsFood extends StatefulWidget {
  //const DetailsFood({Key? key}) : super(key: key);

  final imgPath, foodName, priceItem, heroTag;

  DetailsFood({this.imgPath, this.foodName, this.priceItem, this.heroTag});

  @override
  _DetailsFoodState createState() => _DetailsFoodState();
}

class _DetailsFoodState extends State<DetailsFood> {
  var netPrice = 0.0;
  var quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.teal,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      width: 45,
                      height: 45,
                      color: Colors.transparent,
                    ),
                    Container(
                      width: 40,
                      height: 40.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(0.5),
                              blurRadius: 4.0,
                              spreadRadius: 4.0,
                              offset: Offset(0.0, 4.0))
                        ],
                        shape: BoxShape.circle,
                        color: Color(0xFFFE7D6A),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.shopping_basket,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 1,
                      right: 3,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                          child: Text(
                            "1",
                            style: TextStyle(fontSize: 7, color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Super",
              style: GoogleFonts.notoSans(
                  fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Chicken Burger",
              style: GoogleFonts.notoSans(
                  fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Hero(
                tag: widget.heroTag,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.imgPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 45,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6.0,
                              spreadRadius: 7.0,
                              offset: Offset(6.0, 11.0),
                              color: Color(0xFFFE7D6A).withOpacity(0.2),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Icon(
                          Icons.favorite_border,
                          color: Color(0xFFFE7D6C),
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 45,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6.0,
                              spreadRadius: 7.0,
                              offset: Offset(6.0, 11.0),
                              color: Color(0xFFFE7D6A).withOpacity(0.2),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Icon(
                          Icons.restore,
                          color: Color(0xFFFE7D6C),
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: <Widget>[
              Container(
                height: 70,
                width: 170,
                //width: MediaQuery.of(context).size.width / 2,
                color: Colors.teal.withOpacity(0.1),
                child: Center(
                  child: Text(
                    '\$' + (int.parse(widget.priceItem) * quantity).toString(),
                    style: GoogleFonts.notoSans(
                        fontSize: 40.0,
                        color: Colors.teal,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                  height: 60.0,
                  width: MediaQuery.of(context).size.width - 170,
                  decoration: BoxDecoration(
                      color: Color(0xFFFE7D6A),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          height: 40.0,
                          width: 105.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white),
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                  iconSize: 17.0,
                                  icon: Icon(Icons.remove,
                                      color: Color(0xFFFE7D6A)),
                                  onPressed: () {
                                    adjustQuantity('MINUS');
                                  }),
                              Text(
                                quantity.toString(),
                                style: GoogleFonts.notoSans(
                                    fontSize: 14.0,
                                    color: Color(0xFFFE7D6A),
                                    fontWeight: FontWeight.w400),
                              ),
                              IconButton(
                                  iconSize: 17.0,
                                  icon:
                                      Icon(Icons.add, color: Color(0xFFFE7D6A)),
                                  onPressed: () {
                                    adjustQuantity('PLUS');
                                  }),
                            ],
                          )),
                      Text(
                        'Add to cart',
                        style: GoogleFonts.notoSans(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  adjustQuantity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;
      case 'MINUS':
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
          }
        });
        return;
    }
  }
}
