import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConvoPage(),
    );
  }
}

class ConvoPage extends StatefulWidget {

  @override
  _ConvoPageState createState() => _ConvoPageState();
}

class _ConvoPageState extends State<ConvoPage> {
  final List<ChatMessage> messages = [
    ChatMessage(
      image: AssetImage("lib/icons/design1.png"),
      sender: 'Jane Wilson',
      time: '10:43',
      message:
      'Hi Jacob and Brandon, any progress on the project? 🤔',
    ),
    ChatMessage(
      image: AssetImage("lib/icons/design1.png"),
      sender: 'Jacob Hawkins',
      time: '10:47',
      message: 'Hi Jane!',
      isSender: true,
    ),
    ChatMessage(
      image: AssetImage("lib/icons/design1.png"),
      sender: 'Jacob Hawkins',
      time: '10:47',
      message: 'Yes. I just finished developing the Chat template.',
      isSender: true,
    ),
    ChatMessage(
      image: AssetImage("lib/icons/design1.png"),
      sender: 'Brandon Pena',
      time: '10:52',
      message: 'Hi Jane! I\'ve completed 16 of 20',
      isSender: false,
    ),
    ChatMessage(
      image: AssetImage("lib/icons/design1.png"),
      sender: 'Brandon Pena',
      time: '10:52',
      message: 'Today or tomorrow I think I will finish it!',
      isSender: false,
    ),
    ChatMessage(
      image: AssetImage("lib/icons/design1.png"),
      sender: 'Jane Wilson',
      time: '10:52',
      message: 'It looks amazing. The customer will be very satisfied!',
      isSender: false,
    ),
    ChatMessage(
      image: AssetImage("lib/icons/design1.png"),
      sender: 'Jacob hawkins',
      time: '10:52',
      message: 'Brandon can you send me the style guide!',
      isSender: true,
    ),
    ChatMessage(
      image: AssetImage("lib/icons/design1.png"),
      sender: 'Brandon Pena',
      time: '10:52',
      message: 'Here is the style guide!',
      isSender: false,

    ),
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffF1F3F7),

      body: Column(
        children: [
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
          SizedBox(height: screenHeight*0.05,),
          ListTile(
            minTileHeight: 20,
            leading: Image.asset("lib/icons/one.png",),
            title: Text(
              "Design Team",
              style: GoogleFonts.nunito(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            subtitle: Text(
              "6 members , 3 online",
              style: GoogleFonts.nunito(
                color: Color(0xff637085),
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Container(
              height: screenHeight*0.05,
              width: screenWidth*0.1,
              decoration: BoxDecoration(

                color: Color(0xffE8EAED),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Icon(Icons.person_3_rounded),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ChatMessageWidget(
                  message: messages[index],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String sender;
  final String time;
  final String message;
  final bool isSender;
  final AssetImage? image;

  ChatMessage({
    required this.sender,
    required this.time,
    required this.message,
    this.isSender = false,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSender)
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377a4b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80'),
            ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  sender,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: isSender ? Colors.blue : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender ? 16 : 0),
                      topRight: Radius.circular(isSender ? 0 : 16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: isSender ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          if (isSender)
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/8657665/pexels-photo-8657665.jpeg?auto=compress&cs=tinysrgb&w=600'),
            ),
        ],
      ),
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;

  ChatMessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isSender)
            CircleAvatar(
              backgroundImage:AssetImage("lib/icons/man.png")
            ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment:
              message.isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  message.sender,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: message.isSender ? Colors.blue : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(message.isSender ? 16 : 0),
                      topRight: Radius.circular(message.isSender ? 0 : 16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    message.message,
                    style: TextStyle(
                      color: message.isSender ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  message.time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          if (message.isSender)
            CircleAvatar(
              backgroundImage: AssetImage("lib/icons/woman.png"),
            ),
        ],
      ),
    );
  }
}

