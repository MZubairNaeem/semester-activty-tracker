import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semester_tracker/view/Home/home.dart';
import 'package:semester_tracker/view/auth/welcome.dart';
import 'package:semester_tracker/view/exception/loading.dart';

import '../../providers/auth_provider.dart';
import '../exception/error.dart';


class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  //  Notice here we aren't using stateless/stateful widget. Instead we are using
  //  a custom widget that is a consumer of the state.
  //  So if any data changes in the state, the widget will be updated.

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  now the build method takes a new parameter ScopeReader.
    //  this object will be used to access the provider.

    //  now the following variable contains an asyncValue so now we can use .when method
    //  to imply the condition
    final authState = ref.watch(authStateProvider);
    return authState.when(
        data: (data) {
          if (data != null) return const Home();
          return const Welcome();
        },
        loading: () => const Loading(),
        error: (e, trace) => ErrorScreen(e, trace));
  }
}

