import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late InAppWebViewController _webViewController;
  double progress = 0;
  bool canGoBack = false;
  bool canGoForward = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _webViewController.canGoBack()) {
          _webViewController.goBack();
          return false;
        } else {
          return await _showExitConfirmation();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("YouTube Lite"),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: canGoBack ? () => _webViewController.goBack() : null,
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: canGoForward ? () => _webViewController.goForward() : null,
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => _webViewController.reload(),
            ),
            IconButton(
              icon: const Icon(Icons.open_in_browser),
              onPressed: () => _launchExternalBrowser(),
            ),
          ],
        ),
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri("https://m.youtube.com")),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  javaScriptEnabled: true,
                  supportZoom: false,
                ),
              ),
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              onLoadStop: (controller, url) async {
                canGoBack = await controller.canGoBack();
                canGoForward = await controller.canGoForward();
                setState(() => progress = 1.0);
              },
              onProgressChanged: (controller, progress) {
                setState(() => this.progress = progress / 100);
              },
            ),
            if (progress < 1.0)
              LinearProgressIndicator(value: progress),
          ],
        ),
      ),
    );
  }

  Future<bool> _showExitConfirmation() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Exit App"),
        content: const Text("Do you really want to exit?"),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text("No")),
          TextButton(onPressed: () => exit(0), child: const Text("Yes")),
        ],
      ),
    ) ??
        false;
  }

  void _launchExternalBrowser() async {
    final Uri url = Uri.parse("https://m.youtube.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not open browser")),
      );
    }
  }
}
