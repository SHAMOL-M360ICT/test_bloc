import 'package:bloc_test/bloc/sign_in/sign_in_bloc.dart';
import 'package:bloc_test/ui/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  // await initializeAppConfiguration();
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
String? email, password, token;
Future<void> initializeAppConfiguration() async {
  var box = await Hive.openBox('myBox');
  email = box.get('email');
  password = box.get('password');
  token = box.get('token');
  debugPrint('email: $email');
  debugPrint('password: $password');
  debugPrint('token: $token');
}

  @override
  void initState() {
    initializeAppConfiguration();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(),
        )
      ], 
    child: MaterialApp(
      title: 'Bloc Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    ));
  }
}
