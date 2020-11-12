import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/order.dart';
import 'package:flutter_healthcare_app/src/model/orderDetails.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:flutter_healthcare_app/src/pages/purchase_screen.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/viewModel/eshop_view_model.dart';
import 'package:provider/provider.dart';

class PurchaseDetailScreen extends StatefulWidget {
  String userId;
  String orderId;

  PurchaseDetailScreen(this.userId, this.orderId);

  @override
  _PurchaseDetailScreenState createState() => _PurchaseDetailScreenState();
}

class _PurchaseDetailScreenState extends State<PurchaseDetailScreen> {
  var isFirst = true;
  var isLoading = true;
  EShopViewModel eShopViewModel;
  OrderDetails order;
  var subTotal = 0.0;

  @override
  Widget build(BuildContext context) {
    eShopViewModel = Provider.of<EShopViewModel>(context);
    if (isFirst) {
      getAllOrder(context);
      setState(() {
        isFirst = false;
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorResources.themered,
        title: Text(
          'Purchase details',
          style: TextStyle(fontSize: 18, color: ColorResources.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_sharp,
            color: ColorResources.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: ColorResources.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                userDetailwidget(context),
                Divider(
                  thickness: 4,
                  color: ColorResources.grey.withOpacity(0.3),
                ),
                Expanded(child: itemList(context)),
                Divider(
                  thickness: 4,
                  color: ColorResources.grey.withOpacity(0.3),
                ),
                orderDetails(context),
                Divider(
                  thickness: 4,
                  color: ColorResources.grey.withOpacity(0.3),
                ),
                paymentDetails(context)
              ],
            ),
          ),
          loading(context)
        ],
      ),
    );
  }

  userDetailwidget(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MD kamruzzaman',
                  style:
                      TextStyle(fontSize: 16, color: ColorResources.lightblack),
                ),
                Text(
                  'Phone',
                  style:
                      TextStyle(fontSize: 12, color: ColorResources.lightblack),
                ),
                Text(
                  'Address',
                  style:
                      TextStyle(fontSize: 12, color: ColorResources.lightblack),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: (){
              openConfirmationDialog(context,order.orderId);
            },
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border:
                      Border.all(color: ColorResources.lightOrange, width: 2)),
              child: Center(
                child: Text(
                  'Cancel',
                  style:
                      TextStyle(fontSize: 16, color: ColorResources.lightOrange),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  itemList(BuildContext context) {
    return ListView.builder(
        itemCount: order != null ? order.orderList.length :0,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CachedNetworkImage(
                          imageUrl:
                          "http://172.16.61.221:8059${order.orderList[index].productimageurl}",
                          height: 80,
                          width: 80,
                          fit: BoxFit.fill,
                          // placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${order.orderList[index].medicineName}',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: ColorResources.lightblack),
                            ),
                            Text(
                              '\$${order.orderList[index].productprice}',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ColorResources.lightblack),
                            ),
                            Text(
                              'X ${order.orderList[index].productqnty}',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ColorResources.lightblack),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: ColorResources.grey.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          );
        });
  }

  orderDetails(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order # ${order != null ? order.orderId : '0' }',
              style: TextStyle(color: ColorResources.themered, fontSize: 16),
            ),
            Text(
              'Placed on: ',
              style: TextStyle(color: ColorResources.lightblack, fontSize: 14),
            ),
            Text(
              'Payment: ',
              style: TextStyle(color: ColorResources.lightblack, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  paymentDetails(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sub total',
                style: TextStyle(fontSize: 12),
              ),
              Text(
                '\$$subTotal',
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shippng fee',
                style: TextStyle(fontSize: 12),
              ),
              Text(
                '\$0.00',
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Divider(
            color: ColorResources.grey.withOpacity(0.3),
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 12),
              ),
              Text(
                '${order != null ? order.orderList.length : '0' } items,            \$$subTotal',
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
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

  void getAllOrder(BuildContext context) async {
    OrderDetails orderData =
        await eShopViewModel.getOrderDetails(widget.userId, widget.orderId);
    if (orderData != null) {
      setState(() {
        isLoading = false;
        order = orderData;
      });

      getSubTotal(orderData.orderList);
    }
  }

  void getSubTotal(List<OrderList> orderList) {
    var total = 0.0;
    orderList.forEach((element) {
      total += double.parse(element.productprice) * double.parse(element.productqnty);
    });
    setState(() {
      subTotal = total;
    });
  }

  void openConfirmationDialog(BuildContext context,String orderId) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 16,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorResources.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Do you want to delete this order?',
                            style: TextStyle(
                              color: ColorResources.lightblack,
                            ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: ColorResources.themered,
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: ()=>Navigator.pop(context),
                                child: Container(
                                  child: Center(
                                    child: Text('No',
                                      style: TextStyle(
                                          color: ColorResources.lightOrange
                                      ),),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: ()=>cancelOrder(orderId),
                                child: Container(
                                  child: Center(
                                    child: Text('Yes',
                                      style: TextStyle(
                                          color: ColorResources.themered
                                      ),),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  void cancelOrder(String orderId) async{
    RegistrationResponse response = await eShopViewModel.deleteOrder(orderId, widget.userId);

    if(response != null){
      if(response.success){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => PurchaseScreen()));
      }
    }

  }
}
