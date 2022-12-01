import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pocketbase_scaffold/pocketbase_scaffold.dart';

final pageIndexProvider = StateProvider<int>((_) {
  return 0;
});

class AppScaffoldWidget extends ConsumerWidget {
  final Widget child;
  const AppScaffoldWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider);

    void onDestinationSelected(int index) {
      ref.read(pageIndexProvider.notifier).update((_) => index);
      switch (index) {
        case 0:
          context.go("/");
          break;
        case 1:
          context.go("/myskillset");
          break;
        case 2:
          context.go("/skills");
          break;
        case 3:
          context.go("/skillsets");
          break;
        default:
          context.go("/");
      }
    }

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            onDestinationSelected: onDestinationSelected,
            leading: Image.asset("BOM_icon_orange.png", width: 55),
            selectedIndex: pageIndex,
            // labelType: NavigationRailLabelType.selected,
            elevation: 4,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.account_tree),
                label: Text('Items'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.lightbulb),
                label: Text('Skills'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.light_mode),
                label: Text('Skills Sets'),
              ),
            ],
            trailing: Column(
              children: [
                const Divider(),
                Consumer(
                  builder: (context, ref, _) {
                    return IconButton(
                      onPressed: () => ref.read(authProvider.notifier).logout(),
                      icon: const Icon(Icons.logout_rounded),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}
