import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../controllers/pdfview_controller.dart';

class PdfviewView extends GetView<PdfviewController> {
  const PdfviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kartu Ujian'),
          centerTitle: true,
        ),
        body:
            // SfPdfViewer.network(
            //     'https://drive.google.com/file/d/1x8zNbf6dxBqL9AEoHyeyKsidkALHNqsy/preview'));
            SfPdfViewer.asset('assets/storage/kartuuts.pdf'));
  }
}
