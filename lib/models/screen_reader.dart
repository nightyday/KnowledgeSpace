import 'package:flutter/material.dart';
import 'package:knowledge_space3/models/book.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ScreenReader extends StatefulWidget {
  ScreenReader(this.book, {Key? key}) : super(key: key);
  Book book;

  @override
  State<ScreenReader> createState() => _ScreenReaderState();
}

class _ScreenReaderState extends State<ScreenReader> {
  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   appBar: AppBar(
        //     backgroundColor: Colors.deepPurple,
        //     title: Text(widget.book.name),
        //   ),
        //   body:
        SafeArea(
            child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.book.name),
      ),
      body: SfPdfViewer.network(widget.book.doc_url),
    ));
    // );
  }
}
