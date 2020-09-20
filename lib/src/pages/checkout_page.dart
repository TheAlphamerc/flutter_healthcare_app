import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  var cashpayment = false;
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              color: LightColor.themered,
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
                        color: LightColor.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20.0, bottom: 10),
                    child: Text(
                      'CheckOut',
                      style: TextStyle(color: LightColor.white, fontSize: 18),
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
                        color: LightColor.lightblack.withOpacity(0.7),
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
                color: LightColor.themered,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15,5,15,5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Print',
                        style: TextStyle(
                            color: LightColor.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        'Pay Now',
                        style: TextStyle(
                            color: LightColor.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            )
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
                color: LightColor.lightblack,
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
              color: LightColor.lightblack.withOpacity(0.5),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: cashpayment,
                  activeColor: LightColor.themered,
                  onChanged: (bool newValue) {
                    setState(() {
                      cashpayment = newValue;
                    });
                  }),
              Text(
                'Pay with money',
                style: TextStyle(
                  color: LightColor.lightblack,
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
                  'Labtest',
                  style: TextStyle(color: LightColor.lightblack, fontSize: 18),
                ),
                Text(
                  '20.26 \$',
                  style: TextStyle(color: LightColor.lightblack, fontSize: 18),
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
                  'Medicine',
                  style: TextStyle(color: LightColor.lightblack, fontSize: 18),
                ),
                Text(
                  '50.04 \$',
                  style: TextStyle(color: LightColor.lightblack, fontSize: 18),
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
                  'E-shop',
                  style: TextStyle(color: LightColor.lightblack, fontSize: 18),
                ),
                Text(
                  '20.40 \$',
                  style: TextStyle(color: LightColor.lightblack, fontSize: 18),
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
                  style: TextStyle(color: LightColor.lightblack, fontSize: 18),
                ),
                Text(
                  '12.09 \$',
                  style: TextStyle(color: LightColor.lightblack, fontSize: 18),
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
                  style: TextStyle(color: LightColor.lightblack, fontSize: 18),
                ),
                Text(
                  '0.0 \$',
                  style: TextStyle(color: LightColor.lightblack, fontSize: 18),
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
                  style: TextStyle(color: LightColor.lightblack, fontSize: 18),
                ),
                Text(
                  '5.00 \$',
                  style: TextStyle(color: LightColor.lightblack, fontSize: 18),
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
            color: LightColor.lightblack.withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                color: LightColor.lightblack.withOpacity(0.5), width: 2)),
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          cursorColor: LightColor.black,
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
}
