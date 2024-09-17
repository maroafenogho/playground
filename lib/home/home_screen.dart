import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/theme/theme.dart';

enum TabItems { dashboard, wallet, clock }

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, this.initialPage = TabItems.clock});
  final TabItems initialPage;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _CustomBottomNav(
            tabItems: const [
              Icon(Icons.home),
              Icon(Icons.access_time_rounded),
              Icon(Icons.flood)
            ],
            index: ref.watch(bottomTabIndexNotifier).index,
            onTap: (value) {
              ref.read(bottomTabIndexNotifier.notifier).update(
                    (state) => TabItems.values[value],
                  );
              print(value);
            },
          ),
        ],
      ),
    );
  }
}

class _CustomBottomNav extends StatefulWidget {
  const _CustomBottomNav({
    required this.tabItems,
    this.onTap,
    required this.index,
  });

  final ValueChanged<int>? onTap;
  final List<Widget> tabItems;
  final int index;

  @override
  State<_CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<_CustomBottomNav> {
  static const _tweenSwitchDuration = const Duration(milliseconds: 500);
  ColorTween get _selectedTween => ColorTween(
        begin: context.theme.colors.primary,
        end: context.theme.colors.robbingEgg,
      );
  ColorTween get _unselectedTween => ColorTween(
        begin: context.theme.colors.robbingEgg,
        end: context.theme.colors.primary,
      );
  bool _itemSelected(int index) => index == widget.index;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 15,
        right: 50,
        left: 50,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  context.theme.colors.onyx,
                  context.theme.colors.midnight
                ]),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () {
                widget.onTap?.call(0);
              },
              child: TweenAnimationBuilder(
                tween: _itemSelected(0) ? _selectedTween : _unselectedTween,
                duration: _tweenSwitchDuration,
                builder: (context, color, child) {
                  return Icon(
                    Icons.home,
                    color: color,
                  );
                },
              ),
            ),
            ...widget.tabItems.map(
              (e) => InkWell(
                  onTap: () {
                    widget.onTap?.call(
                        widget.tabItems.indexWhere((element) => element == e));
                  },
                  child: e),
            ),
          ]),
        ));
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('OPOP'),
    );
  }
}

final bottomTabIndexNotifier = StateProvider<TabItems>((ref) => TabItems.clock);
