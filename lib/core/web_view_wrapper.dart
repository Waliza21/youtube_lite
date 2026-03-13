import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_lite/core/full_screen_loading_overlay.dart';

import '../presentation/core/constants/app_colors.dart';

class WebViewWrapper extends StatefulWidget {
  const WebViewWrapper({super.key, required this.url, required this.title});

  final String url;
  final String title;

  @override
  State<WebViewWrapper> createState() => _WebViewWrapperState();
}

class _WebViewWrapperState extends State<WebViewWrapper> {
  late final WebViewController _controller;
  final TextEditingController testCnt = TextEditingController();
  final ValueNotifier<bool> _isLoading = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(
        JavaScriptMode.unrestricted,
      ) //commented to run this on web
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (_) => _isLoading.value = true,
          onPageFinished: (_) {
            _isLoading.value = false;
            _controller.runJavaScript('''
              // var ytHeader=document.querySelector('ytm-mobile-topbar-renderer'); //inspect theke giye oi tag tar naam khujhe tarpor ei js query ta likhte hobe to remove the header
              // if(ytHeader) ytHeader.style.display='none';
              var navBar=document.querySelector('ytm-pivot-bar-renderer'); //inspect theke giye oi tag tar naam khujhe tarpor ei js query ta likhte hobe to remove the navbar
              if(navBar) navBar.style.display='none';
            ''');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    //for running in web
    // if (!kIsWeb) {
    //   _controller
    //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //     ..setNavigationDelegate(
    //       NavigationDelegate(
    //         onPageStarted: (_) => _isLoading.value = true,
    //         onPageFinished: (_) {
    //           _isLoading.value = false;
    //         },
    //       ),
    //     );
    // } else {
    //   _isLoading.value = false;
    // }
  }

  @override
  void dispose() {
    super.dispose();
    _isLoading.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isLoading,
      builder: (context, isLoading, child) {
        return FullScreenLoadingOverlay(
          isLoading: isLoading,
          loadingWidget: CircularProgressIndicator(
            color: AppColors.youtubePrimary,
          ),
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios),
              ),
              title: Text(
                widget.title,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: .w600,
                ),
              ),
            ),
            body: WebViewWidget(controller: _controller),
          ),
        );
      },
    );
  }
}
