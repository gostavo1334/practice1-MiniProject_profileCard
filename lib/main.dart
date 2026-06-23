import 'package:flutter/material.dart';
import 'student_card_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;
  int _selectedIndex = 0;   // ← NEW: tracks which tab is selected

  void increase() {
    setState(() {
      count++;
    });
  }

  // ← NEW: handles taps on the bottom nav items
  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      // "Student Card" tab tapped → navigate to new page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StudentCardPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 320,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'John Doe',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            Container(
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: Text(
                'flutter container',
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
            ),

            Text('$count', style: TextStyle(fontSize: 70)),
            SizedBox(height: 10),
            Text('Hello', style: TextStyle(fontSize: 70)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increase,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,   // ← NEW
        onTap: _onNavTapped,            // ← NEW: connects taps to the handler
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge),       // ← changed icon to suit "Student Card"
            label: 'Student Card',          // ← renamed from "Settings"
          ),
        ],
      ),
    );
  }
}