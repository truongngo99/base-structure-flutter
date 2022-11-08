import 'package:base_structure/detail/presentation/widget/user_widget.dart';
import 'package:base_structure/detail/shared/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailScreen extends HookConsumerWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(usersProvider.notifier).getListUsers();
      return;
    }, const []);

    final listUsers = ref.watch(usersProvider);

    return Scaffold(
      body: listUsers.maybeWhen(
        orElse: () => const SizedBox.shrink(),
        success: (users) => Column(
          children: users.data
              .map(
                (element) => UserWidget(
                    image: element.avatar,
                    name: element.firstName,
                    email: element.email),
              )
              .toList(),
        ),
      ),
    );
  }
}
