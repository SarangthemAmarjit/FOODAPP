import 'package:flutter/material.dart';
import 'package:foodapp/button.dart';
import 'package:foodapp/constant.dart';
import 'package:foodapp/item.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Deals of the Weak'),
          centerTitle: true,
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    GridView.count(
                      padding: EdgeInsets.all(15),
                      childAspectRatio: 3 / 5.1,
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      shrinkWrap: true,
                      children: [
                        CardContainer(
                            iconcolor: Color.fromARGB(255, 98, 171, 100),
                            textweight: '500gm',
                            itemimage: 'assets/images/apple2.jpg',
                            text1: 'Apple - Best of',
                            text2: "Himalaya's",
                            text3: 'Rs',
                            text4: '199',
                            text5: '169.5',
                            text6: 'Standard Delivery',
                            text7: '( Tommorrow evening )',
                            additem: Button(
                                idnumber: '92140',
                                itemprice: 169.5,
                                itemphoto: apple,
                                itname: 'Apple')),
                        CardContainer(
                          iconcolor: Colors.redAccent,
                          textweight: '1kg',
                          itemimage: 'assets/images/chiken4.jpg',
                          text1: 'Chicken - Yummy',
                          text2: 'Leg Piece',
                          text3: 'Rs',
                          text4: '215',
                          text5: '200',
                          text6: 'Express Delivery',
                          text7: '( Tommorrow morning )',
                          additem: Button(
                              idnumber: '92145',
                              itemprice: 200,
                              itemphoto: chicken,
                              itname: 'Chicken'),
                        ),
                        CardContainer(
                          iconcolor: Color.fromARGB(255, 98, 171, 100),
                          textweight: '500gm',
                          itemimage: 'assets/images/nutella.jpg',
                          text1: 'Nutella - Taste of',
                          text2: 'Hazelnuts',
                          text3: '',
                          text4: '',
                          text5: 'Rs 245',
                          text6: 'Express Delivery',
                          text7: '( Tommorrow morning )',
                          additem: Button(
                              idnumber: '92150',
                              itemprice: 245,
                              itemphoto: nutella,
                              itname: 'Nutella'),
                        ),
                        CardContainer(
                          iconcolor: Color.fromARGB(255, 98, 171, 100),
                          textweight: '100gm',
                          itemimage: 'assets/images/bread.jpg',
                          text1: 'Whole Wheat',
                          text2: 'Bread',
                          text3: 'Rs',
                          text4: '45',
                          text5: '35',
                          text6: 'Standard Delivery',
                          text7: '( Tommorrow evening )',
                          additem: Button(
                              idnumber: '92155',
                              itemprice: 35,
                              itemphoto: wheat,
                              itname: 'Whole wheat'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}