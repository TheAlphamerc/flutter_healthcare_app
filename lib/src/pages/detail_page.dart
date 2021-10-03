import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/viewModel/doctor_view_model.dart';
import 'package:flutter_healthcare_app/src/model/available.dart';
import 'package:flutter_healthcare_app/src/model/doctor.dart';
import 'package:flutter_healthcare_app/src/pages/book_appoint_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Doctor doctor;
  DetailPage({Key key, this.doctor}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Doctor model;
  DoctorViewModel doctorViewModel;
  var isFirst = true;
  List<Available> availableList;
  RegExp exp = RegExp(r"\r\n", multiLine: true, caseSensitive: true);

  @override
  void initState() {
    model = widget.doctor;
    super.initState();
    availableList = new List();
  }

  Widget _appbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BackButton(color: Theme.of(context).primaryColor),
//        IconButton(
//            icon: Icon(
//              model.isfavourite ? Icons.favorite : Icons.favorite_border,
//              color: model.isfavourite ? Colors.red : LightColor.grey,
//            ),
//            onPressed: () {
//              setState(() {
//                model.isfavourite = !model.isfavourite;
//              });
//            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25).bold;
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.title.copyWith(fontSize: 23).bold;
    }
    doctorViewModel = Provider.of<DoctorViewModel>(context);
    if (isFirst) {
      getAvailableTime(widget.doctor.id);
      setState(() {
        isFirst = false;
      });
    }

    return Scaffold(
      backgroundColor: ColorResources.extraLightBlue,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Image.network(
              'http://172.16.61.221:8059${model.photo}',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              fit: BoxFit.fill,
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
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                model.name,
                                style: titleStyle,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.check_circle,
                                  size: 18,
                                  color: Theme.of(context).primaryColor),
                              Spacer(),
                            ],
                          ),
                          subtitle: Text(
                            model.specialist.replaceAll(exp, ', '),
                            style: TextStyles.bodySm.subTitleColor.bold,
                          ),
                        ),
                        Divider(
                          thickness: .3,
                          color: ColorResources.grey,
                        ),
                        Text(
                          'Available on',
                          style: titleStyle,
                        ),
                        SizedBox(
                          height: 100,
                          child: availableList != null &&
                                  availableList.length > 0
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: availableList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Column(
                                          children: [
                                            Text(
                                              availableList[index].days,
                                              style: TextStyles.titleMedium,
                                            ),
                                            Expanded(
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      availableList[index]
                                                          .timeList
                                                          .length,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 4.0),
                                                      child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                              '${availableList[index].timeList[0].times}')),
                                                    );
                                                  }),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Text(''),
                        ),
                        Divider(
                          thickness: .3,
                          color: ColorResources.grey,
                        ),
                        Text(
                          'Education',
                          style: titleStyle,
                        ),
                        Text(
                          model.education,
                          style: TextStyles.body,
                        ).vP4,
                        Divider(
                          thickness: .3,
                          color: ColorResources.grey,
                        ),
                        Text("About", style: titleStyle).vP16,
                        Text(
                          model.about,
                          style: TextStyles.body.subTitleColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorResources.grey.withAlpha(50)),
                                  child: Icon(
                                    Icons.call,
                                    color: ColorResources.themered,
                                  ),
                                ).ripple(
                                  () {
                                    launch("tel:${model.phone}");
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                Text('')
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorResources.grey.withAlpha(50)),
                                  child: Icon(
                                    Icons.chat_bubble,
                                    color: ColorResources.themered,
                                  ),
                                ).ripple(
                                  () {
                                    launch("sms:${model.phone}");
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                Text('')
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                FlatButton(
                                  color: ColorResources.themered,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                BookAppointmentPage(
                                                    model, availableList)));
                                  },
                                  child: Text(
                                    "Make an appointment",
                                    style: TextStyles.titleNormal.white,
                                  ).p(10),
                                ),
                                Text(
                                    'consultation fee : \$ ${model.fees} / hour')
                              ],
                            ),
                          ],
                        ).vP16
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

  Widget showSchduleWidget(
      BuildContext context, day, start, end, String checkvalue) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          children: [
            Text(
              day,
              style: TextStyles.titleMedium,
            ).vP4,
            Text(
              start,
              style: TextStyles.bodySm,
            ),
            Text(
              checkvalue,
              style: TextStyles.bodySm,
            ),
            Text(
              end,
              style: TextStyles.bodySm,
            ),
          ],
        ),
      ),
    );
  }

  void getAvailableTime(String id) async {
    List<Available> availables = await doctorViewModel.getAvailibility(id);

    if (availables != null) {
      if (availableList != null) {
        availableList.clear();
      }
      for (Available available in availables) {
        availableList.add(available);
      }
      setState(() {
        availableList;
      });
    }
  }
}
