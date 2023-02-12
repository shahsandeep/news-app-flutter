import 'package:flutter/material.dart';
import 'package:news_app_figma/models/news_model.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewNewsDetails extends StatefulWidget {
  const WebViewNewsDetails({super.key, this.article});
  final Article? article;

  @override
  State<WebViewNewsDetails> createState() => _WebViewNewsDetailsState();
}

class _WebViewNewsDetailsState extends State<WebViewNewsDetails> {
  bool isVisible = true;
  CookieManager cookieManager = CookieManager.instance();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  // @override
  // void initState() {
  //   super.initState();
  //   print('called');
  //   Future.delayed(Duration(seconds: 5), () {
  //     setState(() {
  //       isVisible = true;
  //       inappwebmethod(cookieManager);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // InAppWebViewController _webViewController;
    // final WebViewController controller = WebViewController();

    // controller.setJavaScriptMode(JavaScriptMode.unrestricted);

    // controller.setNavigationDelegate(NavigationDelegate(
    //   onPageStarted: (url) {
    //     controller.runJavaScript(
    //         "document.getElementsByTagName('header')[0].style.display='none'");
    //     controller.runJavaScript(
    //         "document.getElementsByTagName('footer')[0].style.display='none'");
    //   },
    // ));
    // controller.loadRequest(Uri.parse(widget.article?.url ?? ''));

    // ..setJavaScriptMode(JavaScriptMode.unrestricted)
    // ..clearCache()
    // ..clearLocalStorage()
    // ..setBackgroundColor(const Color(0x00000000))
    // ..setNavigationDelegate(
    //   NavigationDelegate(
    //     onProgress: (int progress) {
    //       // Update loading bar.
    //     },
    //     onPageStarted: (String url) {},
    //     onPageFinished: (String url) {},
    //     onWebResourceError: (WebResourceError error) {},
    //     onNavigationRequest: (NavigationRequest request) {
    //       if (request.url.startsWith('https://www.youtube.com/')) {
    //         return NavigationDecision.prevent;
    //       }
    //       return NavigationDecision.navigate;
    //     },
    //   ),
    // )
    // ..runJavaScript(
    //     "document.getElementsByTagName('header')[0].style.display='none'")
    // ..runJavaScript(
    //     "document.getElementsByTagName('footer')[0].style.display='none'")
    // ..loadRequest(Uri.parse(widget.article?.url ?? ''));
    return Scaffold(
        appBar: AppBar(title: const Text('News')),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: isVisible
                  ? inappwebmethod(cookieManager)
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ],
        )));
  }

  InAppWebView inappwebmethod(CookieManager cookieManager) {
    return InAppWebView(
      onWebViewCreated: (controller) {
        webViewController = controller;

        webViewController?.evaluateJavascript(
            source:
                "document.getElementsByTagName('header')[0].style.display='none'");
        webViewController?.evaluateJavascript(
            source:
                "document.getElementsByTagName('footer')[0].style.display='none'");

        print("******************************* excuted under oncreated ");
      },
      onLoadStart: (controller, url) {
        // webViewController?.evaluateJavascript(
        //     source:
        //         "document.getElementsByTagName('header')[0].style.display='none'");
        // webViewController?.evaluateJavascript(
        //     source:
        //         "document.getElementsByTagName('footer')[0].style.display='none'");
        print(
            '**************************************************************************** on start ************************');
      },
      onLoadStop: (controller, url) {
        //    webViewController?.evaluateJavascript(
        //       source:
        //           "document.getElementsByTagName('header')[0].style.display='none'");
        //  webViewController?.evaluateJavascript(
        //       source:
        //           "document.getElementsByTagName('footer')[0].style.display='none'");

        print(
            '**************************************************************************** on stop ************************');
      },
      initialUrlRequest: URLRequest(
        url: Uri.parse(widget.article?.url ?? ''),
      ),
    );
  }
}
