import 'package:boto/widgets/bottom.dart';
import 'package:boto/widgets/navigate.dart';
import 'package:boto/widgets/typeField.dart';
import 'package:flutter/material.dart';

class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  List<String> cityList = ["Erbil", "Duhok", "sulaimany"];
  List<String> purposeList = ["test", "test1", "test3"];
  TextEditingController phoneNumber = TextEditingController();

  Widget buildChooseFile({void Function()? onTap, required String labelText}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: double.infinity,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border(
                        left: BorderSide(
                          color: Colors.black,
                        ),
                        right: BorderSide(
                          color: Colors.black,
                        ),
                        top: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    child: Center(child: Text("Choose Files")),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("No file chosen")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    final maxLines = 10;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Text",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: maxLines * 24.0,
            child: TextField(
              maxLines: maxLines,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.0),
                ),
                border: OutlineInputBorder(),
                hintText: "Text",
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
        ],
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
        child: Container(
          margin: EdgeInsets.all(12),
          height: MediaQuery.of(context).size.height / 1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SingleChildScrollView(
            // physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TypeField(
                  hintText: "Select City",
                  labelText: "City",
                  list: cityList,
                ),
                TypeField(
                  hintText: "Select Purpose",
                  labelText: "Purpose",
                  list: purposeList,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: phoneNumber,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.call),
                      counterText: "(required)",
                      hintText: "Phone Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildChooseFile(
                      labelText: "Image",
                      onTap: () {},
                    ),
                    buildChooseFile(
                      labelText: "Video",
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _buildTextField(),
                    MaterialButton(
                      elevation: 0,
                      height: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15.0),
                        ),
                      ),
                      minWidth: double.infinity,
                      color: Color(0xff4FC1E9),
                      child: Center(
                        child: Text(
                          "Send",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
