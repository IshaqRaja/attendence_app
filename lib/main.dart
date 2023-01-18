import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/important/homescreen.dart';
import 'model/credentials/2ndlogin.dart';
import 'model/credentials/auth_services.dart';
import 'model/credentials/home.dart';
import 'model/user.dart'as u;
import 'package:firebase_auth/firebase_auth.dart';
// import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
      // options: DefaultFirebaseOptions.currentPlatform,

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          // initialData: null and authStateChange instead of authStateChanges
          create: (context) => context.read<AuthService>().authStateChange,
          initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const KeyboardVisibilityProvider(
          child: HomeScreen(), //AuthCheck(), // AuthCheck(),
        ),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  // const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();

    if (user != null) {
      return const Home();
    }

    return const MainScreen();
    return const Home();
  }
}

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  bool userAvailable = false;
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();

    _getCurrentUser();
  }

  void _getCurrentUser() async {
    sharedPreferences = await SharedPreferences.getInstance();

    try {
      if (sharedPreferences.getString('employeeId') != null) {
        setState(() {
          u.User.username = sharedPreferences.getString('employeeId')!;
          userAvailable = true;
        });
      }
    } catch (e) {
      setState(() {
        userAvailable = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return userAvailable ? const HomeScreen() : const HomeScreen();
  }
}



