import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/medicine_model.dart';
import 'package:flutter_healthcare_app/src/pages/book_appoint_page.dart';
import 'package:flutter_healthcare_app/src/pages/cart_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/model/dactor_model.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/widgets/progress_widget.dart';
import 'package:flutter_healthcare_app/src/widgets/rating_start.dart';

class EshopDetailPage extends StatefulWidget {
  Medicine medicineListdata;

  EshopDetailPage(this.medicineListdata);

  @override
  _EshopDetailPageState createState() => _EshopDetailPageState();
}

class _EshopDetailPageState extends State<EshopDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget _appbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BackButton(color: ColorResources.lightblack),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                8.0,
                8.0,
                0.0,
                8.0,
              ),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: ColorResources.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorResources.lightblack.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.favorite_border,
                    color: ColorResources.themered,
                    size: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CartPage()));

                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: ColorResources.white,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    boxShadow: [
                      BoxShadow(
                        color: ColorResources.lightblack.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: ColorResources.themered,
                      size: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25).bold;
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.title.copyWith(fontSize: 23).bold;
    }
    return Scaffold(
      backgroundColor: ColorResources.extraLightBlue,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Stack(
              children: [
                Image.asset(
                  'assets/medicine_box.jpg',
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Container(
                  color: ColorResources.themered.withOpacity(0.1),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                )
              ],
            ),
            DraggableScrollableSheet(
              maxChildSize: .8,
              initialChildSize: .6,
              minChildSize: .6,
              builder: (context, scrollController) {
                return Container(
                  height: AppTheme.fullHeight(context) * .5,
                  padding: EdgeInsets.only(left: 19, right: 19, top: 16),
                  //symmetric(horizontal: 19, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        priceText(context),
                        productDetails(context),
                      ],
                    ),
                  ),
                );
              },
            ),
            _appbar(),
          ],
        ),
      ),
    );
  }

  Widget priceText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(
            '${widget.medicineListdata.price} \$',
            style: TextStyle(
                fontSize: 20,
                color: ColorResources.lightblack.withOpacity(0.7),
                fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            '12 / box',
            style: TextStyle(
              fontSize: 16,
              color: ColorResources.lightblack.withOpacity(0.7),
            ),
          ),
        )
      ],
    );
  }

  Widget productDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.medicineListdata.medicineName}',
          style: TextStyle(
              color: ColorResources.lightblack,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top:4.0,bottom: 4.0),
          child: Text(
            'Category name',
            style: TextStyle(
              color: ColorResources.lightblack,
              fontSize: 18,
            ),
          ),
        ),
        Text(
          '${widget.medicineListdata.genericName}',
          style: TextStyle(
            color: ColorResources.lightblack,
            fontSize: 18,
          ),
        ),
        Divider(
          thickness: 0.5,
          color: ColorResources.lightblack.withOpacity(0.7),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom:10.0),
          child: Text(
            'About',
            style: TextStyle(
              color: ColorResources.lightblack,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom:10.0),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eu nisl eros. Cras a nisi enim. Etiam vitae convallis ante. ',
            style: TextStyle(
              color: ColorResources.lightblack.withOpacity(0.5),
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom:10.0),
          child: Text(
            'Benifits',
            style: TextStyle(
              color: ColorResources.lightblack,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom:10.0),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eu nisl eros. Cras a nisi enim. Etiam vitae convallis ante. ',
            style: TextStyle(
              color: ColorResources.lightblack.withOpacity(0.5),
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: ColorResources.themered,
              borderRadius: BorderRadius.all(Radius.circular(10
              ))
            ),
            child: Center(
              child: Text('Add to cart',
              style: TextStyle(
                color: ColorResources.white,
                fontSize: 16
              ),),
            ),
          ),
        )
      ],
    );
  }
}
