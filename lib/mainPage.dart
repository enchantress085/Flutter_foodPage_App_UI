import 'package:burger_shop_ui/foodDetailsPage.dart';
import 'package:burger_shop_ui/tabfoodpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueGrey,
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
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3.0,
                          spreadRadius: 3.0,
                          offset: Offset(0.0, 3.0)),
                    ],
                    color: Color(0xFFC6E7FE),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/11.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "SEARCH FOR",
              style: GoogleFonts.notoSans(
                  fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "RECIPES",
              style: GoogleFonts.notoSans(
                  fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15.0),
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2.0,
                      blurRadius: 2.0,
                      offset: Offset(0.0, 3.0))
                ],
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                decoration: InputDecoration(
                  //fillColor: Colors.purple.withOpacity(0.4),
                  border: InputBorder.none,
                  hintText: 'Search...',
                  hintStyle: GoogleFonts.notoSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "RECOMMENDED",
              style: GoogleFonts.montserrat(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black.withOpacity(0.5),
                  letterSpacing: -1.0),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 200,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildBurgerItem('Chiken Burger', 'assets/images/1.png', '21',
                    Color(0xFFFFE9C6), Color(0xFFDA9551)),
                _buildBurgerItem('Chiken Burger', 'assets/images/2.png', '21',
                    Color(0xFFC2E3FE), Color(0xFF6A8CAA)),
                _buildBurgerItem('Chiken Burger', 'assets/images/3.png', '21',
                    Color(0xFFD7FADA), Color(0xFF56CC7E)),
                _buildBurgerItem('Chiken Burger', 'assets/images/4.png', '21',
                    Color(0xFFFFE9C6), Color(0xFFDA9551)),
                _buildBurgerItem('Chiken Burger', 'assets/images/5.png', '21',
                    Color(0xFFC2E3FE), Color(0xFF6A8CAA)),
                _buildBurgerItem('Chiken Burger', 'assets/images/6.png', '21',
                    Color(0xFFD7FADA), Color(0xFF56CC7E)),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, bottom: 10),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black.withOpacity(0.8),
              labelStyle: GoogleFonts.montserrat(
                  fontSize: 16.0, fontWeight: FontWeight.w500),
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              unselectedLabelStyle: GoogleFonts.montserrat(
                  fontSize: 14, fontWeight: FontWeight.w300),
              tabs: [
                Tab(
                  child: Text('All'),
                ),
                Tab(
                  child: Text('Burger'),
                ),
                Tab(
                  child: Text('Burger'),
                ),
                Tab(
                  child: Text('Chicken Burger'),
                ),
                Tab(
                  child: Text('Burger'),
                ),
                Tab(
                  child: Text('Burger'),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 450.0,
            child: TabBarView(controller: tabController, children: [
              FoodTab(),
              FoodTab(),
              FoodTab(),
              FoodTab(),
              FoodTab(),
              FoodTab(),
            ]),
          ),
        ],
      ),
    );
  }

  _buildBurgerItem(String fName, String fImg, String fPrice, Color bgcolor,
      Color textcolor) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsFood(
                    heroTag: fName,
                    foodName: fName,
                    priceItem: fPrice,
                    imgPath: fImg,
                  )));
        },
        child: Container(
          height: 175,
          width: 140.0,
          decoration: BoxDecoration(
            color: bgcolor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: fName,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: Image.asset(
                      fImg,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                fName,
                style: GoogleFonts.montserrat(fontSize: 17.0, color: textcolor),
              ),
              Text(
                '\$' + fPrice,
                style: GoogleFonts.montserrat(fontSize: 15.0, color: textcolor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
