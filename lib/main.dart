import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:device_info_plus/device_info_plus.dart';

void main() {
 FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ondaum WebView',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WebViewPage(),
    );
  }
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController? controller;
  bool isLoading = true;

  Future<String> _getUserAgent() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return 'Mozilla/5.0 (Linux; Android ${androidInfo.version.release ?? 'unknown'}; ${androidInfo.model ?? 'unknown'}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.6261.64 Mobile Safari/537.36';
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return 'Mozilla/5.0 (iPhone; CPU iPhone OS ${iosInfo.systemVersion ?? '16_0'} like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko) CriOS/112.0.0.0 Mobile/15E148 Safari/537.36';
    } else {
      return 'Mozilla/5.0';
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  Future<void> _initializeWebView() async {
    final userAgent = await _getUserAgent();
    final ctrl = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(userAgent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onNavigationRequest: (NavigationRequest request) {
            // Allow navigation to ondaum.revimal.me, Google OAuth (wildcard) & Youtube OAuth (wildcard)
            if (!request.url.startsWith('https://ondaum.revimal.me') &&
                !request.url.startsWith('https://accounts.google.co') &&
                !request.url.startsWith('https://accounts.youtube.co')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://ondaum.revimal.me'));
    setState(() {
      controller = ctrl;
    });
  }

  // Event handler registration method
  void registerEventHandler(String eventName, Function(dynamic) handler) {
    controller?.addJavaScriptChannel(
      eventName,
      onMessageReceived: (JavaScriptMessage message) {
        handler(message.message);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (controller != null)
              WebViewWidget(controller: controller!)
            else
              SizedBox.shrink(),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
