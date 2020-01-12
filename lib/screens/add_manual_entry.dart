import 'package:flutter/material.dart';

class AddManualEntry extends StatefulWidget {
  @override
  _AddManualEntryState createState() => _AddManualEntryState();
}

class _AddManualEntryState extends State<AddManualEntry> {
  final formKey = GlobalKey<FormState>();


  var modelDependency = [
    ["ICU length-of-stay (hours since ICU admit)","ICULOS", 14.520393],
    ["Bilirubin direct (mg/dL)","Bilirubin_direct", 10.181544],
    ["Total bilirubin (mg/dL)","Bilirubin_total", 6.178287],
    ["Fibrinogen","Fibrinogen" , 5.897129],
    ["Respiration rate (breaths per minute)","Resp", 5.722527],
    ["Administrative identifier for ICU unit (MICU)","Unit1", 5.383108],
    ["Heart rate","HR", 5.060755],
    ["Blood urea nitrogen (mg/dL)","BUN", 4.432900],
    ["Temperature (Deg C)","Temp", 4.320148],
    ["Leukocyte count (count*10^3/µL)","WBC", 4.243034],
    ["Measure of excess bicarbonate (mmol/L)","BaseExcess", 3.473745],
    ["Partial pressure of carbon dioxide from arterial blood (mm Hg)","PaCO2", 3.326594],
    ["Creatinine","Creatinine", 3.258294],
    ["Fraction of inspired oxygen","FiO2", 3.093767],
    ["Partial thromboplastin time (seconds)","PTT", 3.05],
    ["Alkaline phosphatase (IU/L)","Alkalinephos", 2.87],
    ["Phosphate","Phosphate", 1.41],
    ["Glucose","Glucose", 1.11],
    ["Magnesium","Magnesium", 0.95],
    ["Gender","Gender", 0.84],
    ["Diastolic BP (mm Hg)","DBP", 0.82],
    ["Oxygen saturation from arterial blood","SaO2", 0.77],
    ["Platelets","Platelets", 0.54],
    ["pH","pH", 0.20],
    ["Age","Age", 0.08],
    ["Bicarbonate (mmol/L)","HCO3", -0.14],
    ["Systolic BP (mm Hg)","SBP", -0.18],
    ["Mean arterial pressure (mm Hg)","MAP", -0.36],
    ["Potassium","Potassium", -0.35],
    ["Pulse oximetry (%)","O2Sat", -1.06],
    ["Chloride","Chloride", -1.33],
    ["Calcium","Calcium",-2.03],
    ["Aspartate transaminase (IU/L)","AST",-2.09],
    ["Hematocrit (%)","Hct",-2.67],
    ["Hours between hospital admit and ICU admit","HospAdmTime",-3.03],
    ["Hemoglobin (g/dL)","Hgb",-4.27],
    ["Administrative identifier for ICU unit (SICU)","Unit2",-5.38],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
              children: <Widget>[
                Expanded(
                child : ListView.builder(
                itemCount: modelDependency.length,
                itemBuilder: (context, idx){
                  var fieldTitle = modelDependency[idx][1];
                  return createField(idx, fieldTitle);
                  },
                ),
                ),
                RaisedButton(
                          onPressed: () {
                            Future.delayed(const Duration(milliseconds: 3000), () {
                                setState(() {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed('/sepsispage');
                                });
                            });
                            Navigator.of(context).pushNamed("/loading");
                          },
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Text("Submit",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20.0
                          ),
                          ),
                        ),
              ], 
          ),
      )
    
  );
}

 Widget createField(idx, fieldtitle) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
            autofocus: true,
            onSaved: (String value){
              //save email to form (model class)  
            },    
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: '$fieldtitle',
              // hintText: 'Example : 35',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
            )
        )
    );
  }

}