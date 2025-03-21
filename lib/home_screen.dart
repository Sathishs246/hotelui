import 'package:flutter/material.dart';
import 'colors.dart';
import 'icons.dart';
import 'drawerMenu.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<String> bannerList = [
    "assets/demo/Biriyani_demo.jpg",
    "assets/demo/seafood_demo.jpg",
    "assets/demo/Paneer_Tikka.jpg",
    "assets/demo/pizza_demo.png",
    "assets/demo/burger_demo.jpg",
    "assets/demo/tandoori.jpg",
    "assets/demo/asian_demo.jpg",
    "assets/demo/icecream_demo1.jpg",
    "assets/demo/icecream_demo2.jpg",
    "assets/demo/juice_demo2.jpg",
    "assets/demo/Shawarma-Recipe.jpg",
  ];

  double translateX = 0.0;
  double translateY = 0.0;
  double scale = 1;
  bool doggle = false;
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 30));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DrawerMenu(),
        AnimatedContainer(
          duration: Duration(milliseconds: 1500),
          transform: Matrix4.translationValues(translateX, translateY, 0)
            ..scale(scale),
          child: ClipRRect(
            borderRadius:
                (doggle) ? BorderRadius.circular(20) : BorderRadius.circular(0),
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_arrow,
                      progress: _animationController),
                  onPressed: () {
                    //doggle
                    doggle = !doggle;
                    if (doggle) {
                      translateX = 200;
                      translateY = 80;
                      scale = 0.8;
                      _animationController.forward();
                    } else {
                      translateX = 0.0;
                      translateY = 0.0;
                      scale = 1;

                      _animationController.reverse();
                    }
                    setState(() {});
                  },
                ),
                // icon: Icon(
                //   Icons.menu,
                // )
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivering to",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.black45),
                      // style: TextStyle(color: Colors.black45, fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {
                        print('Cli');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Current Location",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: PrimaryColor,
                            size: 35,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: 45,
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(30)),
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Image.asset(
                                      SEARCH_ICON,
                                      height: 20,
                                      width: 20,
                                    ),

                                    //Icon(Icons.search),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Search Foods",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              FILTER_ICON,
                              height: 25,
                              width: 25,
                              color: PrimaryColor,
                            ),
                          )
                        ],
                      ),
                      //Category Card
                      SizedBox(
                        height: 20,
                      ),
                      titleWidget(context, "Category"),
                      Container(
                        height: 115,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: listCards.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: CategoryCard(
                                  categoryModel: listCards[index],
                                ),
                              );
                            }),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleWidget(context, "Popular"),
                          for (var food in foodList)
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        spreadRadius: 5,
                                        blurRadius: 5)
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 220,
                                    margin: EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      image: DecorationImage(
                                          image: AssetImage(food.image),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      food.name,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.deepOrange,
                                        ),
                                        Text(
                                          "${food.rating}",
                                          style: TextStyle(
                                              color: Colors.deepOrange),
                                        ),
                                        Text(" (${food.reviews} ratings)"),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(food.hotel),
                                        ),
                                        Text("₹ ${food.price}"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      )

                      // titleWidget(context, "Popular"),
                      // for (int i = 0; i < bannerList.length; i++) ...{
                      //   Container(
                      //     margin: EdgeInsets.symmetric(vertical: 10),
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey.shade100,
                      //         borderRadius: BorderRadius.circular(10),
                      //         boxShadow: [
                      //           BoxShadow(
                      //               color: Colors.grey.shade300,
                      //               spreadRadius: 5,
                      //               blurRadius: 5)
                      //         ]),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Container(
                      //           height: 220,
                      //           margin: EdgeInsets.only(bottom: 5),
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(12.0),
                      //             image: DecorationImage(
                      //                 image: AssetImage(bannerList[i]),
                      //                 fit: BoxFit.cover),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Text(
                      //             "Chicken Biriyani",
                      //             style: TextStyle(
                      //               color: Colors.black,
                      //               fontSize: 18,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      //           child: Row(
                      //             children: [
                      //               Icon(
                      //                 Icons.star,
                      //                 color: Colors.deepOrange,
                      //               ),
                      //               Text(
                      //                 "4.8",
                      //                 style: TextStyle(color: Colors.deepOrange),
                      //               ),
                      //               Text(" (245 ratings)"),
                      //               Spacer(),
                      //               Padding(
                      //                 padding:
                      //                     const EdgeInsets.symmetric(horizontal: 8.0),
                      //                 child: Text("South Asia Food "),
                      //               ),
                      //               Text("₹ 250"),
                      //             ],
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           height: 8.0,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      //}
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget titleWidget(BuildContext context, String title) {
  return Text(title,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18));
}

class CategoryModel {
  late String imageUrl;
  late String title;
  late String remoteUrl;
  CategoryModel(
    this.imageUrl,
    this.title,
  );
}

List<CategoryModel> listCards = [
  CategoryModel("assets/demo/gift.png", "Offer"),
  CategoryModel("assets/demo/biryani.png", "Biryani"),
  CategoryModel("assets/demo/seafood.png", "Sea Food"),
  CategoryModel("assets/demo/pizza.png", "Pizza"),
  CategoryModel("assets/demo/burger.png", "Burger"),
  CategoryModel("assets/demo/ramen.png", "Asian"),
  CategoryModel("assets/demo/juices.png", "Juices"),
  CategoryModel("assets/demo/ice-cream.png", "IceCream"),
];

class FoodItem {
  late String name;
  late String image;
  late double rating;
  late int reviews;
  late String hotel;
  late double price;
  FoodItem(
    this.name,
    this.image,
    this.rating,
    this.reviews,
    this.hotel,
    this.price,
  );
}

List<FoodItem> foodList = [
  FoodItem("Chicken Biriyani", "assets/demo/Biriyani_demo.jpg", 4.8, 245,
      "Hotel1", 250.0),
  FoodItem(
      "SeaFood", "assets/demo/seafood_demo.jpg", 4.5, 320, "Hotel2", 300.0),
  FoodItem("Pizza", "assets/demo/pizza_demo.png", 4.3, 150, "Hotel3", 120.0),
  FoodItem("Tandoori", "assets/demo/tandoori.jpg", 4.1, 190, "Hotel4", 150.0),
  FoodItem("Burger", "assets/demo/burger_demo.jpg", 4.1, 230, "Hotel5", 140.0),
  FoodItem(
      "AsianFood", "assets/demo/asian_demo.jpg", 4.0, 180, "Hotel6", 190.0),
  FoodItem("Juice", "assets/demo/juice_demo2.jpg", 4.4, 90, "Hotel7", 186.0),
  FoodItem(
      "IceCream", "assets/demo/icecream_demo2.jpg", 4.4, 100, "Hotel7", 175.0),
  FoodItem(
      "Shawarma", "assets/demo/Shawarma-Recipe.jpg", 4.2, 70, "Hotel8", 186.0),
];

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  CategoryCard({required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(top: 5, bottom: 2, right: 8, left: 8),
          height: 75,
          width: 75,
          decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10)),
          child: Image.asset(categoryModel.imageUrl),
        ),
        Text(categoryModel.title,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black87))
      ],
    );
    ;
  }
}
