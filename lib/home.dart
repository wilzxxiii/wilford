import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:wilford/map_view.dart';




//This file fetches the virtual tour that was created in Panoee
class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
late final WebViewController controller;



//this code fetches the link of the virtual tour in panoee
  @override
  void initState() {
    super.initState();
    controller = WebViewController(      
    )   
      ..loadRequest(
        Uri.parse('https://tour.panoee.com/tau-3d-4v6b2eRo6/643c3d628eafd721b69af1fa'),
      );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('TAU Virtual Tour'),
        actions: [
          //This code will navigate the app to the image map
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
