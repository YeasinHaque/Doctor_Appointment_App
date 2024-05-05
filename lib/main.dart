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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Appointment'),
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
        title: Text('User Type Selection'),
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
                    MaterialPageRoute(builder: (context) => DoctorProfileCreation()),
                  );
                } else {
                  // Handle user selection as a patient
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PatientSignUp()), // Navigate to PatientSignUp
                  );
                }
              },
              child: Text(isDoctor ? 'Doctor Sign Up' : 'Doctor Log In'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle user selection as a patient
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PatientLogIn()), // Navigate to PatientLogIn
                );
              },
              child: Text(isDoctor ? 'Patient Sign Up' : 'Patient Log In'),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorProfileCreation extends StatefulWidget {
  @override
  _DoctorProfileCreationState createState() => _DoctorProfileCreationState();
}

class _DoctorProfileCreationState extends State<DoctorProfileCreation> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  final TextEditingController registrationNoController = TextEditingController();
  String? category; // Initialize as nullable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Doctor Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: doctorNameController,
                decoration: InputDecoration(labelText: 'Doctor Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter doctor name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: collegeController,
                decoration: InputDecoration(labelText: 'College'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter college';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: registrationNoController,
                decoration: InputDecoration(labelText: 'Registration No.'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter registration number';
                  }
                  return null;
                },
              ),
              Container(
                // Wrap DropdownButtonFormField with Container for fixed height
                height: 60,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Category'),
                  value: category,
                  items: ['Medicine', 'Dermatology', 'Others'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      category = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select category';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    category = value;
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process doctor profile creation
                    // For demonstration, print the values
                    print('Doctor Name: ${doctorNameController.text}');
                    print('College: ${collegeController.text}');
                    print('Registration No.: ${registrationNoController.text}');
                    print('Category: $category');

                    // Navigate to the previous page
                    Navigator.pop(context);
                  }
                },
                child: Text('Create Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PatientSignUp extends StatefulWidget {
  @override
  _PatientSignUpState createState() => _PatientSignUpState();
}

class _PatientSignUpState extends State<PatientSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Sign Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add your patient sign up form fields and logic here
            Text('Patient Sign Up Form'),
          ],
        ),
      ),
    );
  }
}

class PatientLogIn extends StatefulWidget {
  @override
  _PatientLogInState createState() => _PatientLogInState();
}

class _PatientLogInState extends State<PatientLogIn> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Log In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool loginSuccess = await ApiService.login(usernameController.text, passwordController.text);
                if (loginSuccess) {
                  // Navigate to the next screen upon successful login
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                } else {
                  // Show error message or handle login failure
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed')));
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

// Define an API service class
class ApiService {
  static Future<bool> login(String username, String password) async {
    // Make API call to authenticate user
    // You can use packages like http or dio for making HTTP requests
    // Return true if login is successful, false otherwise
    return true; // Placeholder response
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Welcome to Home Screen!'),
      ),
    );
  }
}



