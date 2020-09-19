import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/pages/lab_cart_tab.dart';
import 'package:flutter_healthcare_app/src/pages/user/history_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

import 'package:responsive_grid/responsive_grid.dart';
import 'package:responsive_grid/responsive_grid.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with TickerProviderStateMixin {
  TabController _tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 3,vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    color: LightColor.themered,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:25.0,left: 15),
                          child: Icon(Icons.keyboard_backspace,
                            size: 20,
                            color: LightColor.white,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:15,top:15.0,bottom: 10),
                          child: Text('My Cart',
                            style: TextStyle(
                              color: LightColor.white,
                              fontSize: 18
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ResponsiveGridRow(
                            children: [
                              ResponsiveGridCol(
                                child: Container(
                                  color: LightColor.themered,
                                  width: MediaQuery.of(context).size.width,
                                  child: TabBar(
                                    indicatorWeight: 3,
                                    unselectedLabelColor: Colors.grey.shade400,
                                    labelColor: Colors.black87,
                                    tabs: [
                                      new Tab(
                                        text: "Lab",),
                                      new Tab(text: "Medicine"),
                                      new Tab(text: "E-shop"),
                                    ],
                                    controller: _tabController,
                                    indicatorColor: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 140,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: ResponsiveGridRow(
                        children: [
                          ResponsiveGridCol(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: TabBarView(
                                    controller: _tabController,
                                    children: [
                                      LabTab(),
                                      LabTab(),
                                      LabTab(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          )
        ],
      ),
    )
    ;
  }

}
