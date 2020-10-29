import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/data.dart';
import 'package:flutter_healthcare_app/src/model/medicine.dart';
import 'package:flutter_healthcare_app/src/pages/eshop/eshop_detail_page.dart';
import 'package:flutter_healthcare_app/src/pages/notification_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/viewModel/eshop_view_model.dart';
import 'package:provider/provider.dart';

class EshopHomePage extends StatefulWidget {
  @override
  _EshopHomePageState createState() => _EshopHomePageState();
}

class _EshopHomePageState extends State<EshopHomePage> {
  TextEditingController _problemController = TextEditingController();
  EShopViewModel eShopViewModel;

  var fileName = 'File';
  List<Medicine> medicineListdata;
  var isFirst = true;
  var isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    medicineListdata = new List();
  }

  @override
  Widget build(BuildContext context) {
    eShopViewModel = Provider.of<EShopViewModel>(context);
    if(isFirst){

      getAllMedicine(context);

      setState(() {
        isFirst = false;
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.themered,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: ColorResources.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 12, bottom: 12),
            child: GestureDetector(
              onTap: () {},
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
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => NotificationPage()));
                  },
                  child: Center(
                    child: Icon(
                      Icons.notifications_none,
                      color: ColorResources.themered,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              headerpart(context),
              medicineTitle(context),
              Expanded(child: _medicineList(context))
            ],
          ),
          loading(context)
        ],
      ),
    );
  }

  Widget headerpart(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: ColorResources.themered,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15, bottom: 10),
            child: Text(
              'E-shop',
              style: TextStyle(
                color: ColorResources.white,
                fontSize: 20,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 5),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    color: ColorResources.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:15,bottom: 10),
                child: Icon(Icons.more_vert,
                color: ColorResources.white,
                size: 25,),
              )
            ],
          ),
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder:(context,index){
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: ColorResources.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: ColorResources.lightblack.withOpacity(.3),
                                blurRadius: 15,
                                offset: Offset(5, 5),
                              )
                            ]
                        ),
                        child: Center(child: Text('Cancer',
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorResources.lightblack.withOpacity(0.7)

                        ),)),
                      ),
                    );

              }),
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  Widget medicineTitle(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15, top: 15, bottom: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Top medicine',
          style: TextStyle(
            color: ColorResources.lightblack.withOpacity(0.7),
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _medicineList(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: medicineListdata != null ? medicineListdata.length:0,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => EshopDetailPage(medicineListdata[index])));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorResources.themered,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: ColorResources.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        'assets/medicine_box.jpg',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: ColorResources.themered.withOpacity(0.7)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:5.0),
                              child: Text(
                                '${medicineListdata[index].medicinename}',
                                style: TextStyle(
                                    color: ColorResources.white, fontSize: 16,fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '${medicineListdata[index].medicinecompany}',
                              style: TextStyle(
                                  color: ColorResources.white, fontSize: 16),
                            ),
                            Text(
                              '${medicineListdata[index].medicinetypename}',
                              style: TextStyle(
                                  color: ColorResources.white, fontSize: 16),
                            ),
                            Divider(
                              thickness: 1,
                              color: ColorResources.white,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,bottom:5.0),
                                  child: Text(
                                    '${medicineListdata[index].uom}',
                                    style: TextStyle(
                                        color: ColorResources.white, fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:15.0,bottom: 5),
                                  child: Text(
                                    '\$${medicineListdata[index].medicineprice}',
                                    style: TextStyle(
                                        color: ColorResources.white, fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
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

  void getAllMedicine(BuildContext context)async {
    List<Medicine> medicines = await eShopViewModel.getAllMedicine('','','','');

    if(medicines != null){
      medicineListdata.clear();
      setState(() {
        isLoading = false;
      });
      medicines.forEach((medicine) {
        setState(() {
          medicineListdata.add(medicine);
        });

      });
    }


  }

}
