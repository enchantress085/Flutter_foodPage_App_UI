import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
//import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodTab extends StatefulWidget {
  const FoodTab({Key? key}) : super(key: key);

  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildListItem('Delicious Burger', 4.0, '6', 'assets/images/3.png'),
          _buildListItem('Delicious Burger', 4.0, '6', 'assets/images/4.png'),
          _buildListItem('Delicious Burger', 4.0, '6', 'assets/images/5.png'),
          _buildListItem('Delicious Burger', 4.0, '6', 'assets/images/6.png'),
        ],
      ),
    );
  }

  _buildListItem(String fnmae, rating, String fprice, String imgpath) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.teal,
                  ),
                  child: Center(
                    child: Image.asset(
                      imgpath,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      fnmae,
                      style: GoogleFonts.montserrat(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    // SmoothStarRating(
                    //   allowHalfRating: false,
                    //   onRated: (v) {},
                    //   starCount: rating.toInt(),
                    //   rating: rating,
                    //   color: Colors.purple,
                    //   borderColor: Colors.green,
                    //   size: 15,
                    //   spacing: 0.0,
                    // ),
                    Row(
                      children: <Widget>[
                        Text(
                          '\$' + fprice,
                          style: GoogleFonts.lato(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(color: Color(0xFFF68D7F))),
                        ),
                        SizedBox(width: 3.0),
                        Text(
                          '\$' + '18',
                          style: GoogleFonts.lato(
                              fontSize: 12.0,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.4))),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          FloatingActionButton(
            heroTag: fnmae,
            mini: true,
            onPressed: () {},
            child: Center(child: Icon(Icons.add, color: Colors.white)),
            backgroundColor: Color(0xFFFE7D6A),
          )
        ],
      ),
    );
  }
}
