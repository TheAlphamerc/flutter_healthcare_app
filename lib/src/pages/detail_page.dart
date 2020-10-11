import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/doctor_view_model.dart';
import 'package:flutter_healthcare_app/src/model/available.dart';
import 'package:flutter_healthcare_app/src/model/doctor.dart';
import 'package:flutter_healthcare_app/src/pages/book_appoint_page.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';
import 'package:flutter_healthcare_app/src/model/dactor_model.dart';
import 'package:flutter_healthcare_app/src/theme/text_styles.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';
import 'package:flutter_healthcare_app/src/theme/extention.dart';
import 'package:flutter_healthcare_app/src/widgets/progress_widget.dart';
import 'package:flutter_healthcare_app/src/widgets/rating_start.dart';
import 'package:provider/provider.dart';

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
    if(isFirst){
      getAvailableTime(widget.doctor.id);
      setState(() {
        isFirst = false;
      });
    }

    return Scaffold(
      backgroundColor: LightColor.extraLightBlue,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Image.network('http://172.16.61.221:8059${model.photo}',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2,
            fit: BoxFit.fill,),
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
                            model.specialist,
                            style: TextStyles.bodySm.subTitleColor.bold,
                          ),
                        ),
                        Divider(
                          thickness: .3,
                          color: LightColor.grey,
                        ),
                        Text(
                          'Available on',
                          style: titleStyle,
                        ),
                        SizedBox(
                          height: 100,
                          child: availableList != null && availableList.length > 0 ? ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              showSchduleWidget(context, 'Sun',
                                  availableList[0].sunday.isNotEmpty? availableList[0].sunday.split('-')[0].trim():'',
                                  availableList[0].sunday.isNotEmpty? availableList[0].sunday.split('-')[1].trim():'',
                                  availableList[0].sunday.isNotEmpty?'to':'-'),
                              showSchduleWidget(context, 'Mon',
                                  availableList[0].monday.isNotEmpty? availableList[0].monday.split('-')[0].trim():'',
                                  availableList[0].monday.isNotEmpty? availableList[0].monday.split('-')[1].trim():'',
                                  availableList[0].monday.isNotEmpty?'to':'-'),
                              showSchduleWidget(context, 'Tue',
                                  availableList[0].tuesday.isNotEmpty? availableList[0].tuesday.split('-')[0].trim():'',
                                  availableList[0].tuesday.isNotEmpty? availableList[0].tuesday.split('-')[1].trim():'',
                                  availableList[0].tuesday.isNotEmpty?'to':'-'),
                              showSchduleWidget(context, 'Wed',
                                  availableList[0].wednesday.isNotEmpty? availableList[0].wednesday.split('-')[0].trim():'',
                                  availableList[0].wednesday.isNotEmpty? availableList[0].wednesday.split('-')[1].trim():'',
                                  availableList[0].wednesday.isNotEmpty?'to':'-'),
                              showSchduleWidget(context, 'Thu',
                                  availableList[0].thursday.isNotEmpty? availableList[0].thursday.split('-')[0].trim():'',
                                  availableList[0].thursday.isNotEmpty? availableList[0].thursday.split('-')[1].trim():'',
                                  availableList[0].thursday.isNotEmpty?'to':'-'),
                              showSchduleWidget(context, 'Fri',
                                  availableList[0].friday.isNotEmpty? availableList[0].friday.split('-')[0].trim():'',
                                  availableList[0].friday.isNotEmpty? availableList[0].friday.split('-')[1].trim():'',
                                  availableList[0].friday.isNotEmpty?'to':'-'),
                              showSchduleWidget(context, 'Sat',
                                  availableList[0].saturday.isNotEmpty? availableList[0].saturday.split('-')[0].trim():'',
                                  availableList[0].saturday.isNotEmpty? availableList[0].saturday.split('-')[1].trim():'',
                                  availableList[0].saturday.isNotEmpty?'to':'-'),




                            ],
                          ):Text(''),
                        ),
                        Divider(
                          thickness: .3,
                          color: LightColor.grey,
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
                          color: LightColor.grey,
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
                                      color: LightColor.grey.withAlpha(50)),
                                  child: Icon(
                                    Icons.call,
                                    color: LightColor.themered,
                                  ),
                                ).ripple(
                                  () {},
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
                                      color: LightColor.grey.withAlpha(50)),
                                  child: Icon(
                                    Icons.chat_bubble,
                                    color: LightColor.themered,
                                  ),
                                ).ripple(
                                  () {},
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
                                  color: LightColor.themered,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => BookAppointmentPage(model)));
                                  },
                                  child: Text(
                                    "Make an appointment",
                                    style: TextStyles.titleNormal.white,
                                  ).p(10),
                                ),
                                Text('consultation fee : \$ ${model.fees} / hour')
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

  Widget showSchduleWidget(BuildContext context, day, start, end, String checkvalue) {
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

  void getAvailableTime(String id)async {
    List<Available> availables = await doctorViewModel.getAvailibility(id);

    if(availables != null){
      if(availableList != null){
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
