import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/cart.dart';
import 'package:flutter_healthcare_app/src/pages/checkout_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/viewModel/eshop_view_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EshopCartScreen extends StatefulWidget {
  @override
  _EshopCartScreenState createState() => _EshopCartScreenState();
}

class _EshopCartScreenState extends State<EshopCartScreen> {
  var isFirst = true;
  var isLoading = true;
  var userId;
  var totalPrice =0.0;
  List<Cart> cartList = new List();
  List<int> qunatityList = List<int>();
  EShopViewModel eShopViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomerInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    eShopViewModel = Provider.of<EShopViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.themered,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 18, color: ColorResources.white),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: cartListItem(context)),
                  chargeBox(context)
                ],
              ),
            ),
          ),
          loading(context)
        ],
      ),
    );
  }

  Widget chargeBox(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0,left:10,right:10),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: ColorResources.themered,width: 1),
              borderRadius: BorderRadius.all(
                  Radius.circular(10))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '\$ ${totalPrice+5}',
                    style: TextStyle(
                        color: ColorResources.themered,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: ColorResources.themered,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topRight: Radius.circular(10))
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CheckoutPage()));
                    },
                    child: Center(
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                            color: ColorResources.white,
                            fontSize: 18,),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  cartListItem(BuildContext context) {
    return ListView.builder(
        itemCount: cartList != null ? cartList.length : 0,
        itemBuilder: (context, index) {

          for(int i = 0 ;i<cartList.length;i++){
            qunatityList.add(1);
          }
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorResources.themered.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorResources.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: CachedNetworkImage(
                          imageUrl: "http://172.16.61.221:8059${cartList[index].productimageurl}",
                          height: 80,
                          width: 80,
                          fit: BoxFit.fill,
                          // placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${cartList[index].productname}',
                            style: TextStyle(
                                color: ColorResources.lightblack, fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: Text(
                              '${cartList[index].productcategoryname}',
                              style: TextStyle(
                                  color: ColorResources.lightblack.withOpacity(0.5),
                                  fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: Text(
                              '${cartList[index].productprice} \$',
                              style: TextStyle(
                                  color: ColorResources.themered,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        if(qunatityList[index] >1){
                          setState(() {
                            qunatityList[index] = qunatityList[index] -1;
                          });
                          getTotalPrice();
                        }
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          border: Border.all(
                            color: ColorResources.themered,
                            width: 2
                          )
                        ),
                        child: Center(
                          child:
                          Padding(
                            padding: const EdgeInsets.only(top:10.0),
                            child: Icon(Icons.maximize,
                            color: ColorResources.themered,),
                          )),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Align(
                        alignment: Alignment.center,
                          child: Text('${qunatityList[index]}',
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorResources.lightblack,
                            fontWeight: FontWeight.bold
                          ),)),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          qunatityList[index] = qunatityList[index]+1;
                        });
                        getTotalPrice();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right:5.0),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              border: Border.all(
                                  color: ColorResources.themered,
                                  width: 2
                              )
                          ),
                          child: Center(
                              child:
                              Icon(Icons.add,
                              color: ColorResources.themered,)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                onTap: () {},
                color: Colors.transparent,
                iconWidget: Container(
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
                      Icons.clear,
                      color: ColorResources.themered,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  void getCustomerInfo(BuildContext context) async {
    SharedPreferences customerInfo = await SharedPreferences.getInstance();
    userId = customerInfo.getString('id');
    if (userId != null) {
      getCartProduct(context);
    }
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

  void getCartProduct(BuildContext context) async {
    List<Cart> carts = await eShopViewModel.getCart(userId);

    if (carts != null) {
      setState(() {
        isLoading = false;
      });
      cartList.clear();
      carts.forEach((cart) {
        setState(() {
          cartList.add(cart);
        });
      });
      var total =0.0;
      if(cartList != null){
        for(int i =0;i<cartList.length;i++){
          total += double.parse(cartList[i].productprice);
        }
        setState(() {
          totalPrice = total;
        });


      }
    }
  }


  void getTotalPrice(){
    var total =0.0;
    if(cartList != null){
      for(int i =0;i<cartList.length;i++){
          total += double.parse(cartList[i].productprice) * qunatityList[i];
      }
          setState(() {
            totalPrice = total;
          });

    }
  }

}
