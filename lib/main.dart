import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Appointment App',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenWrapper(),
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  @override
  _SplashScreenWrapperState createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Doctor Appointment App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'Doctor Appointment',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserTypeSelection(isDoctor: true)),
                      );
                    },
                    child: Text('Are you a doctor?'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserTypeSelection(isDoctor: false)),
                      );
                    },
                    child: Text('Are you a patient?'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Developed by Yeasin Haque',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserTypeSelection extends StatelessWidget {
  final bool isDoctor;

  const UserTypeSelection({Key? key, required this.isDoctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Log In Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                if (isDoctor) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoctorLoginPage()),
                  );
                } else {
                  // Handle Patient Log In
                }
              },
              child: Text(isDoctor ? 'Doctor Log In' : 'Patient Log In'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (isDoctor) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoctorSignUpPage()),
                  );
                } else {
                  // Handle Patient Sign Up
                }
              },
              child: Text(isDoctor ? 'Doctor Sign Up' : 'Patient Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Settings"),
      ),
      body: Center(
        child: SlideTransition(
          position: _offsetAnimation,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the rating screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RatingPage()),
                    );
                  },
                  child: Text('Rate this app'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Remove Ads" action
                  },
                  child: Text('Remove Ads'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Feedback" action
                  },
                  child: Text('Feedback'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Developer Info" action
                  },
                  child: Text('Developer Info'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int _rating = 0;

  void _onRatingChanged(int newRating) {
    setState(() {
      _rating = newRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate this app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Rate the app:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 1; i <= 5; i++)
                  IconButton(
                    icon: Icon(
                      i <= _rating ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                    ),
                    onPressed: () => _onRatingChanged(i),
                  ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Handle submit action
                // For example, you can send the rating to a backend server
                // and then navigate back to the previous screen
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Doctor Log In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle Doctor Log In
              },
              child: Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Doctor Sign Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Registration Number',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Specialist',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Chamber/Location',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'About',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number / Email',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Repeat Password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle Doctor Sign Up
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
