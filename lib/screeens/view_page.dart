import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:boto/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  AsyncSnapshot? snapShot;
  Widget buildProduct(
      {required image,
      required String title,
      required int price,
      required int used}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage("https://boto.optimal.krd/$image"),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(.5),
              Colors.black.withOpacity(.5),
              // Colors.black.withOpacity(.2),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "$price\$",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            used == 1
                ? Text(
                    "Used",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                : Text(
                    "New",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Future<List<SliderModel>> fetchJobs() async {
    var productApi =
        "https://boto.optimal.krd/api/car?fbclid=IwAR0w3C3d6szqA3J93NF-TxNU23-Hqgdc3ed0v4g3MZc8grAlPAw_ql05T2I";
    var response = await http.get(
      Uri.parse(productApi),
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new SliderModel.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          onPressed: () {},
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

      // Padding(
      //   padding: const EdgeInsets.only(top: 20),
      //   child: Stack(
      //     alignment: Alignment.center,
      //     children: [
      //       ImageSlideshow(
      //         autoPlayInterval: 3000,
      //         width: double.infinity,
      //         height: 300,
      //         initialPage: 0,
      //         indicatorColor: Colors.transparent,
      //         indicatorBackgroundColor: Colors.transparent,
      //         children: [
      //           Image.network(
      //             'https://boto.optimal.krd/images/pictures/14.jpg',
      //             fit: BoxFit.cover,
      //           ),
      //           Image.network(
      //             'https://boto.optimal.krd/images/pictures/18.jpg',
      //             fit: BoxFit.cover,
      //           ),
      //           Image.network(
      //             'https://boto.optimal.krd/images/pictures/14.jpg',
      //             fit: BoxFit.cover,
      //           ),
      //         ],
      //         onPageChanged: (value) {
      //           print('Page changed: $value');
      //         },
      //         // autoPlayInterval: 3000,
      //       ),
      //       Positioned(
      //         bottom: 60,
      //         child: Column(
      //           children: [
      //             Text(
      //               "Top Notch Quality",
      //               style: TextStyle(
      //                 fontSize: 21,
      //                 fontWeight: FontWeight.w900,
      //                 color: Colors.white,
      //               ),
      //             ),
      //             Text(
      //               "A new generation of Mobile Kits.",
      //               style: TextStyle(
      //                 fontWeight: FontWeight.w900,
      //                 color: Colors.white,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: FutureBuilder<List<SliderModel>>(
        future: fetchJobs(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          snapShot = snapshot;

          return ListView(
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
                      onPageChanged: (value) {},
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
                margin: EdgeInsets.all(12.0),
                height: 100,
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    "Cars,",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Find Cars that you need in the easiest way possible,",
                      style: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.74,
                  crossAxisSpacing: 40,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data![index];
                  print(data.used);
                  return buildProduct(
                    image: data.image,
                    price: data.price,
                    title: data.titleEn,
                    used: data.used,
                  );
                },
              ),
              Container(
                margin: EdgeInsets.all(12.0),
                height: 100,
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    "Company,",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Find Cars that you need in the easiest way possible,",
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
