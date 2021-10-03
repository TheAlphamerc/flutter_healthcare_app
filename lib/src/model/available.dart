import 'dart:convert';

List<Available> availableaFromJson(String str) =>
    List<Available>.from(json.decode(str).map((x) => Available.fromJson(x)));

String availableaToJson(List<Available> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Available {
  Available({
    this.id,
    this.doctorid,
    this.days,
    this.times,
    this.isactive,
    this.createdby,
    this.createdtime,
    this.updatedby,
    this.updatedtime,
    this.queryFlag,
    this.getTimeByDay,
    this.timeList,
  });

  String id;
  dynamic doctorid;
  String days;
  String times;
  bool isactive;
  String createdby;
  String createdtime;
  String updatedby;
  String updatedtime;
  String queryFlag;
  bool getTimeByDay;
  List<Available> timeList;

  factory Available.fromJson(Map<String, dynamic> json) => Available(
        id: json["Id"] == null ? null : json["Id"],
        doctorid: json["Doctorid"],
        days: json["Days"] == null ? null : json["Days"],
        times: json["Times"] == null ? null : json["Times"],
        isactive: json["Isactive"],
        createdby: json["Createdby"],
        createdtime: json["Createdtime"],
        updatedby: json["Updatedby"],
        updatedtime: json["Updatedtime"],
        queryFlag: json["QueryFlag"],
        getTimeByDay: json["GetTimeByDay"],
        timeList: json["TimeList"] == null
            ? null
            : List<Available>.from(
                json["TimeList"].map((x) => Available.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "Doctorid": doctorid,
        "Days": days == null ? null : days,
        "Times": times == null ? null : times,
        "Isactive": isactive,
        "Createdby": createdby,
        "Createdtime": createdtime,
        "Updatedby": updatedby,
        "Updatedtime": updatedtime,
        "QueryFlag": queryFlag,
        "GetTimeByDay": getTimeByDay,
        "TimeList": timeList == null
            ? null
            : List<dynamic>.from(timeList.map((x) => x.toJson())),
      };

  factory Available.on([String day = "Mon"]) {
    return Available(
      id: "123abc",
      doctorid: "doc-1",
      days: day,
      times: "",
      isactive: true,
      createdby: "Admin",
      createdtime: "2020-01-01",
      updatedby: "Admin",
      updatedtime: "2020-01-01",
      queryFlag: "1",
      getTimeByDay: false,
      timeList: [
        Available(
          id: "123abc",
          doctorid: "doc-1",
          days: "2",
          times: "1:00 - 2:00",
          isactive: true,
          createdby: "Admin",
          createdtime: "2020-01-01",
          updatedby: "Admin",
          updatedtime: "2020-01-01",
          queryFlag: "1",
          getTimeByDay: false,
          timeList: [],
        ),
        Available(
          id: "123abc",
          doctorid: "doc-1",
          days: "1",
          times: "1:00 - 2:00",
          isactive: true,
          createdby: "Admin",
          createdtime: "2020-01-01",
          updatedby: "Admin",
          updatedtime: "2020-01-01",
          queryFlag: "1",
          getTimeByDay: false,
          timeList: [],
        ),
        Available(
          id: "123abc",
          doctorid: "doc-1",
          days: "1",
          times: "1:00 - 2:00",
          isactive: true,
          createdby: "Admin",
          createdtime: "2020-01-01",
          updatedby: "Admin",
          updatedtime: "2020-01-01",
          queryFlag: "1",
          getTimeByDay: false,
          timeList: [],
        ),
        Available(
          id: "123abc",
          doctorid: "doc-1",
          days: "1",
          times: "1:00 - 2:00",
          isactive: true,
          createdby: "Admin",
          createdtime: "2020-01-01",
          updatedby: "Admin",
          updatedtime: "2020-01-01",
          queryFlag: "1",
          getTimeByDay: false,
          timeList: [],
        ),
        Available(
          id: "123abc",
          doctorid: "doc-1",
          days: "1",
          times: "1:00 - 2:00",
          isactive: true,
          createdby: "Admin",
          createdtime: "2020-01-01",
          updatedby: "Admin",
          updatedtime: "2020-01-01",
          queryFlag: "1",
          getTimeByDay: false,
          timeList: [],
        ),
      ],
    );
  }
}
