import 'package:alpha_ui/bar_graph/bargraph.dart';
import 'package:alpha_ui/line%20chart/line_chart.dart';
import 'package:alpha_ui/widgets/card_widget.dart';
import 'package:alpha_ui/widgets/my_drawer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OverviewPage extends StatefulWidget {

  const OverviewPage({super.key,});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List<double> weeklySummary=[
  40,
  50,
  70,
  92,
  45,
  20,
  70,
];

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const MyDrawer(),
      backgroundColor: const Color(0xffE8EAED),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navbar
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.1,
                right: screenWidth * 0.05,
                top: screenHeight * 0.05,
                bottom: screenHeight * 0.01,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: SizedBox(
                      height: screenHeight * 0.02,
                      child: Image.asset('lib/icons/dashboard.png'),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: screenHeight * 0.02,
                    child: Image.asset('lib/icons/search.png'),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  SizedBox(
                    height: screenHeight * 0.02,
                    child: Image.asset("lib/icons/gear.png"),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  SizedBox(
                    height: screenHeight * 0.02,
                    child: Image.asset("lib/icons/notification.png"),
                  ),
                  SizedBox(width: screenWidth * 0.1),
                  CircleAvatar(
                    child: Image.asset('lib/icons/woman.png'),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.1,
                right: screenWidth * 0.05,
                top: screenHeight * 0.05,
                bottom: screenHeight * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Overview",
                    style: GoogleFonts.nunito(
                     textStyle:  TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ),
                  Container(
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.1,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.messenger, color: Colors.black),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.1,
                right: screenWidth * 0.05,
                top: screenHeight * 0.05,
                bottom: screenHeight * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.15,
                    decoration: BoxDecoration(
                      color: const Color(0xffE3E5E8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.download),
                  ),
                  SizedBox(
                    width: screenWidth*0.02,
                  ),
                  Container(
                    height: screenHeight*0.07,
                    width: screenWidth*0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffE3E5E8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16,top: 15),
                      child: Text(
                        "This Week",
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: Color(0xff28263B),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.1,
                right: screenWidth * 0.05,
                top: screenHeight * 0.05,
                bottom: screenHeight * 0.01,
              ),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: screenHeight*0.25,
                  width: screenWidth*0.8,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 30,
                            child: Icon(Icons.facebook, color: Colors.white),
                          ),
                          SizedBox(
                              width: screenWidth*0.05,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "mitchell.cooper",
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ),
                              Text(
                                "Facebook",
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff637085),
                                  ),
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                          height: screenHeight*0.03,
                      ),

                      Row(
                        children: [
                          Text(
                            "353,49K",
                            style: GoogleFonts.nunito(
                             textStyle:  TextStyle(
                                color: Color(0xff1A1926),
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ),
                          SizedBox(
                            width: screenWidth*0.05,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "↑ 1.43%",
                              style: GoogleFonts.nunito(
                                textStyle:TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                              )
                            ),
                          ),
                        ],
                      ),
                      Text(
                          "Followers",
                        style: GoogleFonts.nunito(
                          textStyle:TextStyle(
                              fontSize: 15,
                              color: Color(0xff637085)
                          ),
                        )
                      )
                    ],

                  ),
                ),
              ),

            ),

            Padding(
              padding: EdgeInsets.only(
                left: screenWidth*0.05,
                right: screenWidth*0.03,
                top: screenHeight*0.05,
                bottom: screenHeight*0.03,
              ),
              child:Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: screenHeight*0.7,
                  width: screenWidth*0.9,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Followers",
                            style:GoogleFonts.nunito(
                               textStyle:  TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff1A1926),
                                )
                            )
                          ),
                          SizedBox(
                            width: screenWidth*0.05,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              ". .",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                          height: screenHeight*0.03
                      ),

                      Row(
                        children: [
                          Text(
                            "254,68k",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                color: Color(0xff1A1926),
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ),
                          SizedBox(
                            width: screenWidth*0.05,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "↑ 6.18%",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                              )
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: screenHeight*0.42,
                            width: screenWidth*0.9,
                            child: MyBarGraph(
                              weeklySummary: weeklySummary,
                              barColors: [],

                            )
                        ),
                      ),

                    ],

                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: screenWidth*0.05,
                right: screenWidth*0.03,
                top: screenHeight*0.05,
                bottom: screenHeight*0.03,
              ),
              child:Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: screenHeight*0.7,
                  width: screenWidth*0.9,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Gender",
                              style:GoogleFonts.nunito(
                               textStyle:  TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff1A1926),
                                ),
                              )
                          ),
                          SizedBox(
                            width: screenWidth*0.05,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              ". .",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),




                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: screenHeight*0.42,
                            width: screenWidth*0.9,
                            child: PieChart(
                              PieChartData(
                                sections: [
                                  PieChartSectionData(
                                    color: Color(0xffFFD422),
                                    value: 58,
                                    title: '58%',
                                    radius: 50,

                                    titleStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                  PieChartSectionData(
                                    color: Color(0xff826AF9),
                                    value: 42,
                                    title: '42%',
                                    radius: 50,
                                    titleStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                ],
                                centerSpaceRadius: 90,
                              ),
                            ),

                        ),


                      ),

                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Indicator(
                            color: Colors.yellow,
                            text: 'Female: 834k',
                          ),
                          SizedBox(width: 20),
                          Indicator(
                            color: Colors.purple,
                            text: 'Male: 352k',
                          ),
                        ],
                      ),

                    ],

                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: screenWidth*0.05,
                right: screenWidth*0.03,
                top: screenHeight*0.05,
                bottom: screenHeight*0.03,
              ),
              child:Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: screenHeight*0.55,
                  width: screenWidth*0.9,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Activity",
                              style:GoogleFonts.nunito(
                                  textStyle:TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff1A1926),
                                  )
                              )
                          ),
                          SizedBox(
                            width: screenWidth*0.05,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              ". .",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: screenHeight*0.04),

                      Row(
                        children: [
                          Text(
                            "462,98k",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1A1926),
                              )
                            )
                          ),
                          SizedBox(
                            width: screenWidth*0.05,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "↑ 3.48%",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                              )
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: screenHeight*0.05),

                      LineChartCard(),








                    ],

                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: screenWidth*0.05,
                right: screenWidth*0.03,
                top: screenHeight*0.05,
                bottom: screenHeight*0.03,
              ),
              child:Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: screenHeight*0.8,
                  width: screenWidth*0.9,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Statistics",
                              style:GoogleFonts.nunito(
                                  textStyle:  TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff1A1926),
                                  )
                              )
                          ),
                          SizedBox(
                            width: screenWidth*0.05,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              ". .",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),

                      SizedBox(
                          height: screenHeight*0.03
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shares",
                            style:GoogleFonts.nunito(
                              textStyle: TextStyle(
                                color: Color(0xff637085),
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ),
                          Text(
                              "Likes",
                              style:GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: Color(0xff637085),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                          )

                        ],
                      ),

                      SizedBox(
                          height: screenHeight*0.03
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "254,68k",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: Color(0xff1A1926),
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                                "↑ 6.18%",
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.green,
                                  ),
                                )
                            ),

                          ),
                          Text(
                            "34",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                color: Color(0xff1A1926),
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: screenHeight*0.42,
                            width: screenWidth*0.9,
                            child: MyBarGraph(
                              weeklySummary: weeklySummary,
                              barColors: [],


                            )
                        ),
                      ),

                    ],

                  ),
                ),
              ),
            ),




          ],
        ),
      ),
    );
  }
}


class Indicator extends StatelessWidget {
  final Color color;
  final String text;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}