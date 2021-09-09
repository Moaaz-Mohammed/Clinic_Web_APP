import 'package:clinic_web/Widgets/show_patient_info_card_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../constants.dart';
import 'dart:io';

String? documentId;

class ShowPatientInfoAlertDialog extends StatelessWidget {
  ShowPatientInfoAlertDialog({
    Key? key,
    required this.patientData,
  });

  final patientData;
  final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      title: Text(
        'Patient Info',
        style: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Container(
          width: width * 0.5,
          child: Column(
            children: [
              ShowPatientInfoCardItem(
                title: 'Name',
                subTitle: patientData[Constants.patientName],
              ),
              ShowPatientInfoCardItem(
                title: 'Age',
                subTitle: patientData[Constants.patientAge],
              ),
              ShowPatientInfoCardItem(
                title: 'Phone',
                subTitle: patientData[Constants.patientPhone],
              ),
              ShowPatientInfoCardItem(
                title: 'Address',
                subTitle: patientData[Constants.patientAddress],
              ),
              ShowPatientInfoCardItem(
                title: 'Diagnoses',
                subTitle: patientData[Constants.patientDiagnoses],
              ),
              ShowPatientInfoCardItem(
                title: 'Treatment',
                subTitle: patientData[Constants.patientTreatment],
              ),
              ShowPatientInfoCardItem(
                title: 'Notes',
                subTitle: patientData[Constants.patientNotes],
              ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                child: Container(
                  width: width * 0.1,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.keyboard_return,color: Colors.redAccent,),
                        Text(
                          'Return',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: Container(
                  width: width * 0.1,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.print,color: Colors.redAccent,),
                      Text(
                        'Print',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                onPressed: () async {
                  final pdf = pw.Document();

                  pdf.addPage(pw.Page(
                      pageFormat: PdfPageFormat.a4,
                      build: (pw.Context context) {
                        return pw.Column(
                          children: [
                            pw.Text("Hello World"),
                            pw.Text("Hello World"),
                            pw.Text("Hello World"),
                            pw.Text("Hello World"),
                            pw.Text("Hello World"),
                            pw.Text("Hello World"),
                            pw.Text("Hello World"),
                          ],
                        );
                      }));
                  final file = File("example.pdf");
                  await file.writeAsBytes(await pdf.save());
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
