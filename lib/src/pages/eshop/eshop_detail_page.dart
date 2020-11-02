import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/cart.dart';
import 'package:flutter_healthcare_app/src/model/medicine.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:flutter_healthcare_app/src/pages/cart_page.dart';
import 'package:flutter_healthcare_app/src/pages/eshop/eshop_home_page.dart';
import 'package:flutter_healthcare_app/src/pages/eshop/eshop_cart_screen.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/viewModel/eshop_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EshopDetailPage extends StatefulWidget {
  Medicine medicineListdata;

  EshopDetailPage(this.medicineListdata);

  @override
  _EshopDetailPageState createState() => _EshopDetailPageState();
}

class _EshopDetailPageState extends State<EshopDetailPage> {


  var isLoading = false;
  var isFirst = true;
  var userId;
  var isFound = false;
  List<Cart> cartList = new List();
  EShopViewModel eShopViewModel;


  @override
  void initState() {
    super.initState();
    getCustomerInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    eShopViewModel = Provider.of<EShopViewModel>(context);
    if(isFirst){

      setState(() {
        isFirst = false;
      });

    }

    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25).bold;
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.title.copyWith(fontSize: 23).bold;
    }
    return Scaffold(
      backgroundColor: ColorResources.white,
      body: WillPopScope(
        onWillPop:()=> Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => EshopHomePage())),
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: <Widget>[
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: "http://172.16.61.221:8059${widget.medicineListdata.imageUrl}",
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    // placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
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
      ),
    );
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
                      MaterialPageRoute(builder: (_) => EshopCartScreen()));

                },
                child: SizedBox(
                  width: 40,
                  child: Stack(
                    children: [
                      Container(
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
                      Positioned(
                        right: 0,
                        child:cartList != null  && cartList.length >0? Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: ColorResources.themered,
                            borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          child: Center(
                              child: Text('${cartList != null ? cartList.length :0}',
                              style: TextStyle(
                                color: ColorResources.white
                              ),)),
                        ):Text(''),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }



  Widget priceText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(
            '${widget.medicineListdata.medicineprice} \$',
            style: TextStyle(
                fontSize: 20,
                color: ColorResources.lightblack.withOpacity(0.7),
                fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            '${widget.medicineListdata.uom}',
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
          '${widget.medicineListdata.medicinename}',
          style: TextStyle(
              color: ColorResources.lightblack,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top:4.0,bottom: 4.0),
          child: Text(
            '${widget.medicineListdata.productcategoryname}',
            style: TextStyle(
              color: ColorResources.lightblack,
              fontSize: 18,
            ),
          ),
        ),
        Text(
          '${widget.medicineListdata.medicinetypename}',
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
            'Description',
            style: TextStyle(
              color: ColorResources.lightblack,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom:10.0),
          child: Text(
            '${widget.medicineListdata.medicineDesc}',
            style: TextStyle(
              color: ColorResources.lightblack.withOpacity(0.5),
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: GestureDetector(
            onTap: (){
              if(!isFound){
              saveToDb(context);
              }else{
                showSnakbar(context, 'Already added');
              }
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: isFound? ColorResources.grey:ColorResources.themered,
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
          ),
        )
      ],
    );
  }

  Widget loading(BuildContext context) {
    return isLoading
        ? Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        color: ColorResources.white.withOpacity(0.3),
        child: Center(
          child: SizedBox(
            width: 120,
            height: 120,
            child: Container(
              decoration: BoxDecoration(
                  color: ColorResources.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorResources.lightBlue.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    'assets/loading.gif',
                    height: 300,
                    width: 300,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    )
        : Text('');
  }
  void showSnakbar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        backgroundColor: ColorResources.themered,
        content: new Text(
          message,
          style: TextStyle(color: ColorResources.white),
        )));
  }

  void saveToDb(BuildContext context) async{
    setState(() {
      isLoading = false;
    });
    RegistrationResponse response = await eShopViewModel.saveCart(widget.medicineListdata.id,
        widget.medicineListdata.medicinename,
        widget.medicineListdata.productcategory,
        widget.medicineListdata.productcategoryname,
        widget.medicineListdata.medicineprice,
        '1', userId);

    if(response != null){
      getCartProduct(context);
      showSnakbar(context, response.message);
      setState(() {
        isLoading = false;
      });

    }
  }

  void getCustomerInfo(BuildContext context) async {
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    userId = customerInfo.getString('id');
    if(userId != null){
      getCartProduct(context);
    }

  }

  void getCartProduct(BuildContext context) async{
    List<Cart> carts = await eShopViewModel.getCart(userId);

    if(carts != null){

      cartList.clear();
      carts.forEach((cart) {
        setState(() {
          cartList.add(cart);
          if(cart.productid == widget.medicineListdata.id){
            isFound = true;
          }
        });
      });
    }

  }
}
