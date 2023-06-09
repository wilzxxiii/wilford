import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



//This file is responsible for showing the image app for the users
class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late final WebViewController controller;
  

//this HTML code is responsible for the functionality of the image map where the users can click the landmarks and the virtual tour will redirect to that landmark
  final _htmlData = r"""
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes" />
<head>

</head>

<body>

<center><img src="https://firebasestorage.googleapis.com/v0/b/tau-3d-77520.appspot.com/o/finalmap.jpeg?alt=media&amp;token=ef12e1ec-a003-403d-b04c-55fbdf310540" usemap="#image-map" ></center>

<map name="image-map">
    <area target="" alt="TAU Oval" title="TAU Oval" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c405335591673f5622913" coords="144,543,26" shape="circle">
    <area target="" alt="Basketball Court" title="Basketball Court" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c416e8eafd761b89af216" coords="133,571" shape="poly">
    <area target="" alt="Covered Court" title="Covered Court" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c3fe2355916dd2762290f" coords="163,602,14" shape="circle">
    <area target="" alt="Multipurpose Center" title="Multipurpose Center" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c3dac8eafd75b859af1fb" coords="175,502,14" shape="circle">
    <area target="" alt="CBM Main" title="CBM Main" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c3e348eafd70a8f9af1fe" coords="198,524,206,534" shape="poly">
    <area target="" alt="CBM Annex" title="CBM Annex" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c46c58eafd70a959af22f" coords="162,481,153,468,146,465" shape="poly">
    <area target="" alt="Admin" title="Admin" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c3a3b8eafd7c41e9af1ed" coords="216,425,196,413" shape="rect">
    <area target="" alt="Library" title="Library" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c38f58eafd70b0c9af1e7" coords="226,444,209,434" shape="rect">
    <area target="" alt="CAF Main" title="CAF Main" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c35fb35591645c86228cf" coords="255,433,278,435,262,425,265,433,268,431,269,450" shape="poly">
    <area target="" alt="CAF Annex" title="CAF Annex" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c35b635591658206228cd" coords="269,390,285,418" shape="rect">
    <area target="" alt="Farmers Training Center" title="Farmers Training Center" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c353235591617c76228c9" coords="281,368,303,385" shape="rect">
    <area target="" alt="R&amp;D" title="R&amp;D" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c21c28eafd7c6719af182" coords="302,335,18" shape="circle">
    <area target="" alt="Clinic" title="Clinic" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c20bf8eafd719899af17f" coords="275,301,16" shape="circle">
    <area target="" alt="CAS" title="CAS" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c2fa48eafd72b0a9af1ce" coords="327,262,18" shape="circle">
    <area target="" alt="GSO" title="GSO" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c1ebb8eafd77b399af16d" coords="340,183,18" shape="circle">
    <area target="" alt="CVM Annex" title="CVM Annex" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c1e413559162ffb622873" coords="367,160,12" shape="circle">
    <area target="" alt="IT Center" title="IT Center" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c2d0b8eafd755a39af1c1" coords="372,174,398,189" shape="rect">
    <area target="" alt="CET Annex" title="CET Annex" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c2cd2355916f32b6228af" coords="388,209,14" shape="circle">
    <area target="" alt="GE" title="GE" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c2e5735591688d06228b6" coords="363,243,11" shape="circle">
    <area target="" alt="CET Main" title="CET Main" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c2dcc8eafd77d2c9af1c4" coords="380,234,9" shape="circle">
    <area target="" alt="BSBAE" title="BSBAE" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c2e1e8eafd76de89af1c6" coords="383,260,13" shape="circle">
    <area target="" alt="LS" title="LS" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c2bd63559160afb6228ab" coords="444,217,17" shape="circle">
    <area target="" alt="Bamboo Nursery" title="Bamboo Nursery" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c1b34355916edc0622863" coords="484,203,16" shape="circle">
    <area target="" alt="Educ Tech Building" title="Educ Tech Building" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c2b2535591698026228a8" coords="459,177,10" shape="circle">
    <area target="" alt="Educ Home Tech Bldg" title="Educ Home Tech Bldg" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c2b5d8eafd775ca9af1b9" coords="464,150,14" shape="circle">
    <area target="" alt="Educ Main" title="Educ Main" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c1c928eafd71dfd9af166" coords="427,149,16" shape="circle">
    <area target="" alt="Ladies Dorm" title="Ladies Dorm" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c19788eafd72bd19af13d" coords="522,277,22" shape="circle">
    <area target="" alt="Mens Dorm" title="Mens Dorm" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c18e63559164e4d6227b9" coords="528,320,19" shape="circle">
    <area target="" alt="Hostel" title="Hostel" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c264d3559166b4e622894" coords="195,240,15" shape="circle">
    <area target="" alt="Bamboo Center" title="Bamboo Center" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c267a8eafd7370b9af198" coords="177,273,17" shape="circle">
    <area target="" alt="CEC" title="CEC" href="https://tour.panoee.com/tau-3d-4v6b2eRo6/643c26f63559168bca622897" coords="159,302,13" shape="circle">
</map>
</body>
</html>
""";

 
  @override
  void initState() {
    super.initState();
    
    controller = WebViewController()..loadHtmlString(_htmlData);
   
    
  }

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('TAU Virtual Tour Map'),
      ),
      body: InteractiveViewer(
        onInteractionUpdate: (details) {
          print('zoom');
        },
        constrained: true,
        boundaryMargin: const EdgeInsets.all(20.0),
        clipBehavior: Clip.none,
        maxScale: 4,
        minScale: 1,
        panEnabled: false,
        child:
        // Image.asset('assets/finalmap.jpeg')
          SizedBox(
          height: _height,
          width: _width,
          child: WebViewWidget(controller: controller)),
      ),
    );
  }
}
