import 'package:boto/widgets/bottom.dart';
import 'package:boto/widgets/navigate.dart';
import 'package:boto/widgets/typeField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Realestates extends StatefulWidget {
  @override
  _RealestatesState createState() => _RealestatesState();
}

class _RealestatesState extends State<Realestates> {
  List<String> cityList = ["Erbil", "Duhok", "sulaimany"];

  Widget buildProduct({
    required image,
    required title,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      image,
                    ),
                  ),
                  //    color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(.2),
                        Colors.black.withOpacity(.3),
                        // Colors.black.withOpacity(.2),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Erbil",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff1f1f1f),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "34",
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff1f1f1f),
                              ),
                            ),
                            Icon(
                              Icons.visibility,
                              color: Color(0xff1f1f1f),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "BoTo",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            navigate(context: context, navigateTo: Bottom());
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.light_mode_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ImageSlideshow(
                    autoPlayInterval: 3000,
                    width: double.infinity,
                    height: 300,
                    initialPage: 0,
                    indicatorColor: Colors.transparent,
                    indicatorBackgroundColor: Colors.transparent,
                    children: [
                      Image.network(
                        'https://boto.optimal.krd/images/pictures/14.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://boto.optimal.krd/images/pictures/18.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://boto.optimal.krd/images/pictures/14.jpg',
                        fit: BoxFit.cover,
                      ),
                    ],
                    onPageChanged: (value) {
                      print('Page changed: $value');
                    },
                    // autoPlayInterval: 3000,
                  ),
                  Positioned(
                    bottom: 60,
                    child: Column(
                      children: [
                        Text(
                          "Top Notch Quality",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "A new generation of Mobile Kits.",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextFormField(
                      decoration: InputDecoration(
                        // counterText: "not required",
                        hintText: "Search by name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  TypeField(
                    labelText: "Select a Value",
                    hintText: "Select a Value",
                    list: cityList,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: MaterialButton(
                      elevation: 0,
                      onPressed: () {},
                      height: 60,
                      minWidth: double.infinity,
                      color: Color(0xff4FC1E9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "search",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            buildProduct(
              title: "Top Notch Quality",
              image:
                  "https://boto.optimal.krd/images/realestate/profile/4755-1610109304.png",
            ),
            buildProduct(
              title: "SAM_Engliskkllk",
              image:
                  "https://boto.optimal.krd/images/realestate/profile/3695-1610457582.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
