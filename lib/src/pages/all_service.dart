import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/service.dart';
import 'package:flutter_healthcare_app/src/pages/sub_service_screen.dart';

import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/viewModel/service_view_model.dart';
import 'package:provider/provider.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  var isFirst = true;
  var isLoading = true;
  List<Service> serviceList = new List();
  ServiceViewModel serviceViewModel;

  List<String> getListElements() {
    var item = List<String>.generate(100, (index) => "Service ${index}");
    return item;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    serviceViewModel = Provider.of<ServiceViewModel>(context);
    if (isFirst) {
      getAllServices(context);

      setState(() {
        isFirst = false;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: ColorResources.themered)),
        title: Text(
          'Services',
          style: TextStyle(color: ColorResources.themered),
        ),
      ),
      body: Stack(
        children: [
          getMenus(),
          loading(context)

        ],
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

  Widget getMenus() {
    var listmenu = getListElements();
    var listview = ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(
              thickness: 1,
              color: ColorResources.themered,
            ),
        itemCount: serviceList != null ?serviceList.length :0,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SubServicePage(serviceList[index].id)));
            },
            child: ListTile(
              title: Text('${serviceList[index].name}'),
              leading: Icon(Icons.star),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: ColorResources.themered,
              ),
            ),
          );
          Divider();
        });
    return listview;
  }

  void getAllServices(BuildContext context) async {
    List<Service> services = await serviceViewModel.getAllService();

    if (services != null) {
      setState(() {
        services.forEach((item) {
          serviceList.add(item);
        });
        isLoading = false;
      });
    }
  }
}
