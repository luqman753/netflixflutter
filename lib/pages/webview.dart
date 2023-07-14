import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView extends StatefulWidget {
  WebView({Key? key}) : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  InAppWebViewController? webView;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  returnfunc() async {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return returnfunc();
        },
        child: Stack(children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
                url: Uri.parse(
              Uri.dataFromString(
                '''
      
      <Iframe width="100%" height="100%" src="https://uptostream.com/iframe/a32fwziyxnyg" scrolling="no" frameborder="0" allowfullscreen webkitallowfullscreen style="z-index:0;background:black;position:fixed; top:0px; left:0px; bottom:0px; right:0px; width:100%; height:100%; border:none; margin:0; padding:0; overflow:hidden;"></iframe>
      
      
      
      ''',

                // "https://geo.dailymotion.com/player/xa5ly.html?video=x84sh87",
                mimeType: 'text/html',
              ).toString(),
            )),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                supportZoom: false,
                javaScriptEnabled: true,
                mediaPlaybackRequiresUserGesture: true,
              ),
            ),
            onWebViewCreated: (InAppWebViewController controller) async {
              webView = controller;
            },
          ),
        ]),
      ),
    );
  }
}
