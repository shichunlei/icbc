import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/widgets/normal_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final String url;
  final String title;

  WebViewPage({super.key, required this.url, required this.title});

  final showLoading = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: NormalAppbar(title: title, actions: [
          Image.asset("assets/images/base_im_icon_share.png", width: 25),
          const SizedBox(width: 10),
          Image.asset("assets/images/base_im_icon_more.png", width: 25),
          const SizedBox(width: 10)
        ]),
        body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Builder(builder: (BuildContext context) {
              return Column(children: [
                Obx(() => showLoading.value
                    ? const SizedBox(
                        height: 1,
                        child: LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey), backgroundColor: Colors.blue))
                    : const SizedBox.shrink()),
                Expanded(
                    child: WebViewWidget(
                        controller: WebViewController()
                          ..setBackgroundColor(Colors.white)
                          ..setJavaScriptMode(JavaScriptMode.unrestricted)
                          ..loadRequest(Uri.parse(url))
                          ..setNavigationDelegate(NavigationDelegate(
                              onProgress: (int progress) {
                                // Update loading bar.
                                print('onProgress: $progress');
                                if (progress == 100) showLoading.value = false;
                              },
                              onPageStarted: (String url) {
                                print('onPageStarted: $url');
                              },
                              onPageFinished: (String url) {
                                print('onPageFinished: $url');
                              },
                              onWebResourceError: (WebResourceError error) {},
                              onNavigationRequest: (NavigationRequest request) {
                                return NavigationDecision.navigate;
                              }))))
              ]);
            })));
  }
}
