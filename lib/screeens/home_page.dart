import 'dart:convert';

import 'package:boto/models/slider_model.dart';
import 'package:boto/screeens/view_page.dart';
import 'package:boto/widgets/navigate.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AsyncSnapshot? snapShot;

  Widget buildSingleProduct(
      {required image,
      required title,
      required subTitle,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        // height: 390,
        height: MediaQuery.of(context).size.height / 2.9,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
          //    color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.8),
                // Colors.black.withOpacity(.2),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  color: Color(0xff3bafda),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<SliderModel>> fetchJobs() async {
    var productApi =
        "https://boto.optimal.krd/api/sliders?fbclid=IwAR1ceBTZyisP3YYv4B0uyWmpktS_9tHDWv4ogo5R6GReMnYB0bjmBs4VFYU";
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
      // body: FutureBuilder<List<SliderModel>>(
      //   future: fetchJobs(),
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     snapShot = snapshot;

      //     return ListView(
      //       children: [
      //         GridView.builder(
      //             shrinkWrap: true,
      //             physics: NeverScrollableScrollPhysics(),
      //             padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 1,
      //               mainAxisSpacing: 10,
      //               childAspectRatio: 0.74,
      //               crossAxisSpacing: 10,
      //             ),
      //             itemCount: snapshot.data!.length,
      //             itemBuilder: (context, index) {
      //               var data = snapshot.data![index];
      //               print(data.link);
      //               return buildSingleProduct(
      //                 context: context,
      //                 image: data.image,
      //                 title: data.title,
      //               subTitle:
      //                     "دۆزینەوەی پارچەی یەدەگی ئۆتۆمبێل بە ئاسانترین شێوە",
      //               );
      //             }),
      //       ],
      //     );
      //   },
      // ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          buildSingleProduct(
            context: context,
            image:
                "https://www.pngitem.com/pimgs/m/424-4246197_tire-service-jeep-car-parts-vector-motor-clipart.png",
            title: "پارچەی یەدەگ",
            subTitle: "دۆزینەوەی پارچەی یەدەگی ئۆتۆمبێل بە ئاسانترین شێوە",
          ),
          GestureDetector(
            onTap: () {
              navigate(
                context: context,
                navigateTo: ViewPage(),
              );
            },
            child: buildSingleProduct(
              context: context,
              image:
                  "https://i.pinimg.com/originals/91/06/02/910602979bda92b9f88144d313f52725.png",
              title: "ئۆتۆمبێل",
              subTitle: "دۆزینەوەی  ئۆتۆمبێل بە ئاسانترین شێوە",
            ),
          ),
          buildSingleProduct(
            context: context,
            image:
                "https://www.realestate.com.au/blog/images/1024x576-fit,progressive/2019/08/27101645/capi_268bdb4322307f4ae01076b6b2237755_e12d01d628ebd65a79baa185da671ae0.jpeg",
            title: "خانووبەرە",
            subTitle: "دۆزینەوەی خانوو، شوقە، دوکان بە ئاسانترین شێوە",
          ),
        ],
      ),
    );
  }
}
