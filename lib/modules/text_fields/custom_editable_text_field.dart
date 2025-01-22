


import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

class CustomEditableTextField extends StatefulWidget {
  final QuillController quillController;
  final String placeholder;
  const CustomEditableTextField({super.key,required this.placeholder,required this.quillController});

  @override
  State<CustomEditableTextField> createState() => _CustomEditableTextFieldState();
}

class _CustomEditableTextFieldState extends State<CustomEditableTextField> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 500,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey,width: 0.5),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            QuillSimpleToolbar(
              controller: widget.quillController,
              configurations: const QuillSimpleToolbarConfigurations(
                  toolbarSize: 0,
                  sectionDividerSpace: 0,
                  toolbarIconAlignment: WrapAlignment.start,
                  toolbarIconCrossAlignment: WrapCrossAlignment.start,
                  toolbarSectionSpacing: 0,
                  multiRowsDisplay: true,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border(top: BorderSide(color: Colors.black))
                  )
              ),
            ),
            Divider(color: Colors.grey,thickness: 0.5,),
            Expanded(
              child: QuillEditor.basic(
                controller: widget.quillController,
                configurations:  QuillEditorConfigurations(
                  padding: EdgeInsets.all(10),
                  showCursor: true,
                  placeholder: widget.placeholder,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// This function will convert the delta to html
String convertDeltaToHtml({required QuillController quilController}){
  final ops = quilController.document.toDelta().toJson();
  final converter = QuillDeltaToHtmlConverter(
    ops,
    ConverterOptions.forEmail(),
  );

  final html = converter.convert();
  return html;
}


