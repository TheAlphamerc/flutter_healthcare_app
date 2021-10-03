import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/place_order.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/viewModel/eshop_view_model.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {

  PlaceOrder placeOrder;
  double totalPrice;

  CheckoutPage(this.placeOrder, this.totalPrice);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  var cashpayment = false;
  var isLoading = false;
  EShopViewModel eShopViewModel;
  TextEditingController commentController = TextEditingController();
  static GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    eShopViewModel = Provider.of<EShopViewModel>(context);
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              color: ColorResources.themered,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 15),
                      child: Icon(
                        Icons.keyboard_backspace,
                        size: 20,
                        color: ColorResources.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20.0, bottom: 10),
                    child: Text(
                      'CheckOut',
                      style: TextStyle(color: ColorResources.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 150,
              child: Container(
                height: MediaQuery.of(context).size.height - 200,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: [
                    priceList(context),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Divider(
                        thickness: 1,
                        color: ColorResources.lightblack.withOpacity(0.7),
                      ),
                    ),
                    payment(context),
                    comment(context),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: ColorResources.themered,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15,5,15,5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Print',
                        style: TextStyle(
                            color: ColorResources.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      GestureDetector(
                        onTap:(){
                          placeOrder();
                        },
                        child: Text(
                          'Place Order',
                          style: TextStyle(
                              color: ColorResources.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            loading(context)
          ],
        ),
      ),
    );
  }

  Widget payment(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Payment',
              style: TextStyle(
                color: ColorResources.lightblack,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 4 - 25,
                right: MediaQuery.of(context).size.width / 4 - 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/paypal.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/visa.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/mastercard.png',
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Divider(
              thickness: 1,
              color: ColorResources.lightblack.withOpacity(0.5),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: cashpayment,
                  activeColor: ColorResources.themered,
                  onChanged: (bool newValue) {
                    setState(() {
                      cashpayment = newValue;
                    });
                  }),
              Text(
                'Pay with money',
                style: TextStyle(
                  color: ColorResources.lightblack,
                  fontSize: 20,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget priceList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 8, top: 8, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product fee',
                  style: TextStyle(color: ColorResources.lightblack, fontSize: 18),
                ),
                Text(
                  '${widget.totalPrice} \$',
                  style: TextStyle(color: ColorResources.lightblack, fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 8, top: 8, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Vat',
                  style: TextStyle(color: ColorResources.lightblack, fontSize: 18),
                ),
                Text(
                  '0.00 \$',
                  style: TextStyle(color: ColorResources.lightblack, fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 8, top: 8, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tax',
                  style: TextStyle(color: ColorResources.lightblack, fontSize: 18),
                ),
                Text(
                  '0.00 \$',
                  style: TextStyle(color: ColorResources.lightblack, fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 8, top: 8, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Service charge',
                  style: TextStyle(color: ColorResources.lightblack, fontSize: 18),
                ),
                Text(
                  '0.00 \$',
                  style: TextStyle(color: ColorResources.lightblack, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget comment(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: ColorResources.lightblack.withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                color: ColorResources.lightblack.withOpacity(0.5), width: 2)),
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          cursorColor: ColorResources.black,
          controller: commentController,
          decoration: InputDecoration(
            hintText: 'Comment',
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: InputBorder.none,
          ),
        ),
      ),
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
    scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: ColorResources.themered,
        content: new Text(
          message,
          style: TextStyle(color: ColorResources.white),
        )));
  }

  void placeOrder()async {
    setState(() {
      isLoading = true;
    });

    RegistrationResponse response = await eShopViewModel.saveOrder(widget.placeOrder);
    if(response != null){
      setState(() {
      isLoading = false;
    });
      showSnakbar(context, response.message);
    }

  }
}
