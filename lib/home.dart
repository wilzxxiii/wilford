import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:wilford/map_view.dart';


class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
late final WebViewController controller;


Future _getHtml() async {
  final html = await rootBundle.loadString('assets/map.html');

}

  @override
  void initState() {
    super.initState();
    controller = WebViewController(
      
    )
    
  //  ..loadHtmlString(_htmlData)
  
    
      ..loadRequest(
        Uri.parse('https://tour.panoee.com/tau-3d-4v6b2eRo6/643c3d628eafd721b69af1fa'),
      )
      
      ;
  }

  


//    final  _htmlData = r"""
// <html>
// <body>
// <h1>Hello</h1>

// <img src="https://firebasestorage.googleapis.com/v0/b/tau-3d-77520.appspot.com/o/finalmap.jpeg?alt=media&token=22f48178-5513-490e-87c4-22e5b2c27181" usemap="#image-map", alt="Map">

// <map name="image-map">
//     <area target="" alt="TAU Oval" title="TAU Oval" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c405335591673f5622913" coords="141,534,39" shape="circle">
//     <area target="" alt="Covered Court" title="Covered Court" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c3fe2355916dd2762290f" coords="162,599" shape="poly">
// </map>
// </body>
// </html>
// """;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('TAU Virtual Tour'),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>  const MapView()));
          }, icon: const Icon(Icons.map)),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body:  WebViewWidget(
        
        controller: controller,

      ),
    );
  }
}
