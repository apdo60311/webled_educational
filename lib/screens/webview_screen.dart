import 'package:flutter/material.dart';
import 'package:webled_educational/core/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final WebViewController _webViewController = WebViewController();
  int _currentBottomNavigationBar = 0;

  final String _home = 'https://webled.online';
  final String _courses = 'https://webled.online/courses';

  late String _currentUrl;

  @override
  void initState() {
    _currentUrl = _home;
    _webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(_currentUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<String?>(
            future: _webViewController.getTitle(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LinearProgressIndicator(
                  color: Constants.primaryColor,
                );
              }
              return Text(
                snapshot.data ?? 'WEBLED',
              );
            }),
        titleTextStyle: const TextStyle(
          color: Constants.primaryColor,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: WebViewWidget(controller: _webViewController),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentBottomNavigationBar,
          onTap: (index) {
            setState(() {
              _currentBottomNavigationBar = index;
              switch (index) {
                case 0:
                  _webViewController.loadRequest(Uri.parse(_home));
                  break;
                case 1:
                  _webViewController.loadRequest(Uri.parse(_courses));
                  break;
                case 2:
                  _webViewController.goBack();
                  break;
                default:
              }
            });
          },
          selectedItemColor: Constants.primaryColor,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.school_sharp), label: "Courses"),
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_forward_ios_outlined), label: "back"),
          ]),
    );
  }
}
