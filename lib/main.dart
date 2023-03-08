import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semester_tracker/view/auth/auth_checker.dart';
import 'package:semester_tracker/view/exception/error.dart';
import 'package:semester_tracker/view/exception/loading.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const ProviderScope(child: MyApp()));
}

final firebaseInitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp();
});


class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final initialize = ref.watch(firebaseInitializerProvider);
    return MaterialApp(
      theme: ThemeData(
        fontFamily:  GoogleFonts.rubik().fontFamily,

      ),
      home: initialize.when(
          data: (data) {
            return const AuthChecker();
          },
          loading: () => const Loading(),
          error: (e, stackTrace) => ErrorScreen(e, stackTrace)),
    );
  }
}
