import 'package:alpha_ui/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<bool> isSelected = [true, false, false];

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
          children: <Widget>[
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
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Calendar",
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: Color(0xff1A1926),
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ToggleButtons(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('Month',
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('Week',
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('Day',
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            )),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    selectedBorderColor: Colors.grey[300],
                    fillColor: Colors.white,
                    borderColor: Colors.grey[300],
                    selectedColor: Colors.black,
                    color: Colors.grey,
                    isSelected: isSelected,
                    onPressed: (int index) {
                      setState(() {
                        for (int i = 0; i < isSelected.length; i++) {
                          isSelected[i] = i == index;
                        }
                      });
                    },
                  ),
                  Container(
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.1,
                    decoration: BoxDecoration(
                      color: const Color(0xff2D99FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TableCalendar(
                  rowHeight: 43,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarStyle: CalendarStyle(
                    isTodayHighlighted: true,
                    selectedDecoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    defaultDecoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    weekendDecoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    outsideDaysVisible: false,
                    markersAlignment: Alignment.bottomCenter,
                    markersMaxCount: 1,
                    markerDecoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    cellMargin: const EdgeInsets.all(1),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    leftChevronIcon: const Icon(Icons.chevron_left),
                    rightChevronIcon: const Icon(Icons.chevron_right),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: const TextStyle(color: Colors.black),
                  ),
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, focusedDay) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            day.day.toString(),
                            style: GoogleFonts.nunito(
                              textStyle:  TextStyle(color: Colors.black),
                            )
                          ),
                        ),
                      );
                    },
                    selectedBuilder: (context, day, focusedDay) {
                      return Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: const Color(0xff2D99FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            day.day.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                    todayBuilder: (context, day, focusedDay) {
                      return Center(
                        child: Text(
                          day.day.toString(),
                          style: GoogleFonts.nunito(
                            textStyle:  TextStyle(color: Colors.black),
                          )
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "Upcoming",
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    )
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  EventCard(),
                  SizedBox(height: screenHeight * 0.02),
                  EventCard(),
                  SizedBox(height: screenHeight * 0.02),
                  EventCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const Text(
                  '07:00',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 2,
                  height: 80,
                  color: Colors.orange,
                ),
              ],
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Brandbook and Guidebook',
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Text(
                      'Design',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '07:00',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildAvatar("lib/icons/men.png", Colors.blue),
                    const SizedBox(width: 8),
                    _buildAvatar("lib/icons/boy.png", Colors.green),
                    const SizedBox(width: 8),
                    _buildAvatar("lib/icons/man.png", Colors.yellow),
                    const SizedBox(width: 8),
                    _buildAvatar("lib/icons/women.png", Colors.red),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(String assetPath, Color backgroundColor) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      child: Image.asset(assetPath),
    );
  }
}
