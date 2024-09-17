import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:playground/home/home_screen.dart';
import 'package:playground/play_one/application/notifiers/play_notifier.dart';
import 'package:playground/play_one/application/ui_state.dart';
import 'package:playground/router/app_routes.dart';
import 'package:playground/router/router_config.dart';
import 'package:playground/shared/input_formatters/amount_formatter.dart';
import 'package:playground/theme/theme.dart';
import 'package:qr_flutter/qr_flutter.dart';

final themeProvider = Provider(
  (ref) => AppTheme(),
);
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeNotifier,
      builder: (context, child) => MaterialApp.router(
        routerConfig: routes,
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeNotifier.themeMode,
      ),
    );
    // Consumer(
    //   builder: (context, ref, _) => MaterialApp.router(
    //     routerConfig: routes,
    //     title: 'Flutter Demo',
    //     theme: AppTheme.lightTheme,
    //     darkTheme: AppTheme.darkTheme,
    //     themeMode: ref.watch(themeNotifier),
    //   ),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controller = TextEditingController();
  static const buttonsSpace = SizedBox(width: 44);
  static const verticalSpace = SizedBox(height: 8);

  PinTheme get _defaultPinTheme => PinTheme(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Colors.blue.withOpacity(0.2)),
        ),
      );

  PinTheme get _focusedPinTheme => _defaultPinTheme.copyWith(
      decoration: _defaultPinTheme.decoration
          ?.copyWith(border: Border.all(color: Colors.blueAccent)));

  PinTheme get _errorPinTheme => _defaultPinTheme.copyWith(
      decoration: _defaultPinTheme.decoration
          ?.copyWith(border: Border.all(color: Colors.red)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.colors.background,
        title: const Text('POLo'),
      ),
      body: SingleChildScrollView(
        child: Consumer(
          builder: (context, ref, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pushed the button this many times:',
                style: context.theme.text.body1,
              ),
              Text(
                'name: ${ref.watch(playViewModelNotifier).play.name}',
                style: context.theme.text.body2,
              ),
              Text(
                'state: ${ref.watch(playViewModelNotifier).viewState}',
              ),
              Text(
                '${ref.watch(playViewModelNotifier).play.counter}',
                style: context.theme.text.h2,
              ),
              Pinput(
                length: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                defaultPinTheme: _defaultPinTheme,
                focusedPinTheme: _focusedPinTheme,
                errorPinTheme: _errorPinTheme,
                controller: controller,
                autofocus: true,
                obscureText: true,
                showCursor: false,
                keyboardType: TextInputType.none,
                pinAnimationType: PinAnimationType.slide,
                obscuringWidget: Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                onCompleted: (value) {
                  // Navigator.of(context).pop(value);
                },
                validator: (value) {
                  if (value?.length != 4) {
                    return 'Incomplete pin';
                  }
                  return null;
                },
              ),
              Material(
                // color: context.theme.colors.primary,
                child: SingleChildScrollView(child: _buildKeyboard()),
              ),
              QrImageView(
                data: '7036800495',
                dataModuleStyle: QrDataModuleStyle(
                    color: context.theme.colors.onyx,
                    dataModuleShape: QrDataModuleShape.square),
                eyeStyle: QrEyeStyle(
                    color: context.theme.colors.brunswickGreen,
                    eyeShape: QrEyeShape.square),
                version: QrVersions.min,
                size: 100.0,
              ),
              TextField(
                inputFormatters: [
                  AmountFormatter(),
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9.,]"))
                ],
              ),
              Row(
                children: [
                  InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: Text(
                          'Use light',
                          style: TextStyle(color: context.theme.colors.primary),
                        )),
                    onTap: () {
                      themeNotifier.lightMode();
                    },
                  ),
                  InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: Text(
                          'use dark',
                          style: TextStyle(color: context.theme.colors.primary),
                        )),
                    onTap: () {
                      themeNotifier.darkMode();
                    },
                  ),
                ],
              ),
              switch (ref.watch(playViewModelNotifier).viewState) {
                ViewState.loading => const CircularProgressIndicator(),
                ViewState.error => const Text(
                    'Error',
                    style: TextStyle(color: Colors.red),
                  ),
                ViewState.success => const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                _ => const SizedBox.shrink(),
              },
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      context.pushNamed(AppRoute.home.name,
                          queryParameters: {'page': TabItems.dashboard.name});
                      ref
                          .read(playViewModelNotifier.notifier)
                          .incrementCounter();
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildKeyboard() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNumEntry(1.toString(),
                  onTap: () => _inputEntry(NumPadEntryEvent.one)),
              buttonsSpace,
              _buildNumEntry(2.toString(),
                  onTap: () => _inputEntry(NumPadEntryEvent.two)),
              buttonsSpace,
              _buildNumEntry(3.toString(),
                  onTap: () => _inputEntry(NumPadEntryEvent.three)),
            ],
          ),
          verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNumEntry(4.toString(),
                  onTap: () => _inputEntry(NumPadEntryEvent.four)),
              buttonsSpace,
              _buildNumEntry(5.toString(),
                  onTap: () => _inputEntry(NumPadEntryEvent.five)),
              buttonsSpace,
              _buildNumEntry(6.toString(),
                  onTap: () => _inputEntry(NumPadEntryEvent.six)),
            ],
          ),
          verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNumEntry(7.toString(),
                  onTap: () => _inputEntry(NumPadEntryEvent.seven)),
              buttonsSpace,
              _buildNumEntry(8.toString(),
                  onTap: () => _inputEntry(NumPadEntryEvent.eight)),
              buttonsSpace,
              _buildNumEntry(9.toString(),
                  onTap: () => _inputEntry(NumPadEntryEvent.nine)),
            ],
          ),
          verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBioEntry(onTap: () => _inputEntry(NumPadEntryEvent.point)),
              buttonsSpace,
              _buildNumEntry(0.toString(),
                  onTap: () => _inputEntry(NumPadEntryEvent.zero)),
              buttonsSpace,
              Material(
                color: context.theme.colors.neutral,
                shape: const CircleBorder(),
                child: InkWell(
                  onTap: () => _inputEntry(NumPadEntryEvent.delete),
                  customBorder: const CircleBorder(),
                  child: const SizedBox(
                    height: 64,
                    width: 64,
                    child: Align(child: Icon(Icons.delete)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _inputEntry(NumPadEntryEvent event) {
    if (event == NumPadEntryEvent.delete) {
      if (controller.text.isNotEmpty) {
        final text = controller.text.split('');
        text.removeLast();
        controller.text = text.join();
      }
      return;
    }
    controller.text = controller.text + event.value;
  }

  Widget _buildBioEntry({VoidCallback? onTap}) {
    return Material(
      type: MaterialType.transparency,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: () {
          onTap?.let((fn) {
            HapticFeedback.lightImpact();
            fn();
          });
        },
        customBorder: const CircleBorder(),
        child: SizedBox(
          height: 64,
          width: 64,
          child: Stack(
            children: [
              Positioned.fill(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.theme.colors.robbingEgg,
                    shape: BoxShape.circle,
                  ),
                  height: 64,
                  width: 64,
                ),
              ),
              Positioned.fill(
                top: 0,
                right: 0,
                left: 2,
                bottom: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.theme.colors.neutral,
                    shape: BoxShape.circle,
                  ),
                  height: 64,
                  width: 64,
                  padding: const EdgeInsets.all(15),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Icon(
                      Icons.fingerprint_rounded,
                      size: 48,
                      semanticLabel: 'Fingerprint Icon',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumEntry(String input, {VoidCallback? onTap}) {
    return Material(
      color: context.theme.colors.neutral,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: () {
          onTap?.let((fn) {
            HapticFeedback.lightImpact();
            fn();
          });
        },
        customBorder: const CircleBorder(),
        child: SizedBox(
          height: 64,
          width: 64,
          child: Align(
            child: Text(
              input,
              style: context.theme.text.h2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

extension LetX<T> on T {
  A let<A>(A Function(T value) func) {
    return func(this);
  }
}

enum NumPadEntryEvent {
  one('1'),
  two('2'),
  three('3'),
  four('4'),
  five('5'),
  six('6'),
  seven('7'),
  eight('8'),
  nine('9'),
  zero('0'),
  delete('delete'),
  point('.');

  const NumPadEntryEvent(this.value);

  final String value;
}
