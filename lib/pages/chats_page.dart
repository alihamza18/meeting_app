import 'package:alpha_ui/widgets/chat_tile.dart';
import 'package:alpha_ui/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatsPage extends StatefulWidget {

  const ChatsPage({super.key});
  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isTapped = false;

  void _handleTap() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }
    @override


  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Color(0xffF1F3F7),
        key: _scaffoldKey,
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
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
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SizedBox(
                              height: screenHeight * 0.02,
                              child: Image.asset("lib/icons/search.png")),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.1),
                            ))),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("lib/icons/man.png"),

                    ),
                    title: Text("Alphaboard"),
                    subtitle: Text("Jane:Hello,Mark! I am wr..."),
                    trailing: CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage("lib/icons/number-3.png"),
                    )
                ),
                SizedBox(height: screenHeight*0.03,),
                InkWell(
                  onTap: _handleTap,

                  child: Container(
                    color: _isTapped?Colors.white: Color(0xffF1F3F7),
                    child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("lib/icons/women.png"),

                        ),
                        title: Text("Alphaboard"),
                        subtitle: Text("Jane:Hello,Mark! I am wr..."),

                    ),
                  ),
                ),
                SizedBox(height: screenHeight*0.03,),
                ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("lib/icons/boy.png"),

                    ),
                    title: Text("Dustin Williamson"),
                    subtitle: Text("Dustin is typing..."),
                    trailing: CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage("lib/icons/number-5.png"),
                    )
                ),
                SizedBox(height: screenHeight*0.03,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "ALL MESSAGES",
                        style: GoogleFonts.nunito(
                         textStyle:  TextStyle(
                            color: Color(0xff637085),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        )
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight*0.03,),
                ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("lib/icons/women.png"),

                    ),
                    title: Text("Jane Wilson"),
                    subtitle: Text("Hi? How are you Steve?"),
                ),
                SizedBox(height: screenHeight*0.03,),
                ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("lib/icons/men.png"),

                    ),
                    title: Text("Brandon Pena"),
                    subtitle: Text("How about going somew..."),

                ),
                SizedBox(height: screenHeight*0.03,),
                ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("lib/icons/boy.png"),

                    ),
                    title: Text("Nathan Fox"),
                    subtitle: Text("Hello.We have a meeting"),

                ),
                SizedBox(height: screenHeight*0.03,),
                ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("lib/icons/man.png"),

                    ),
                    title: Text("Jacob Hawkins"),
                    subtitle: Text("Well Done!"),
                    trailing: CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage("lib/icons/one.png"),
                    )
                ),
                SizedBox(height: screenHeight*0.03,),
                ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("lib/icons/boy.png"),

                    ),
                    title: Text("Shane Black"),
                    subtitle: Text("Paul's having a party tom..."),

                ),
                SizedBox(height: screenHeight*0.03,),
                ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("lib/icons/women.png"),

                    ),
                    title: Text("Kristin Mckoy"),
                    subtitle: Text("It looks amazing!"),
                    trailing: CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage("lib/icons/number-5.png"),
                    )
                ),


              ])
            ])));
  }
}
