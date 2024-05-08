
import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/widgets/original_button.dart';
import 'package:flutter/material.dart';

class AttendanceTeachersScreen extends StatefulWidget {
  const AttendanceTeachersScreen({super.key});

  @override
  State<AttendanceTeachersScreen> createState() => _AttendanceTeachersScreenState();
}

class _AttendanceTeachersScreenState extends State<AttendanceTeachersScreen> {
  
   final TextEditingController _dateController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Attendance'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                
              const Text(
                'Select  Class:',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 25),
              const ClassSelectionDropdown(),
              const SizedBox(height: 35),
              const Text(
                'Select  date',
                style: TextStyle(fontSize: 30),
              ),
               const SizedBox(height: 25),
               Padding(
                 padding: const EdgeInsets.all(16),
                 child: TextField(
                  controller: _dateController,
                             decoration: const InputDecoration(
                  
                  labelText: "Date",
                  filled: true,
                  prefixIcon: Icon(Icons.calendar_today)
                             ),
                             readOnly: true,
                             onTap: () {
                  _ShowDatePicker();
                             },
                             ),
               ),
              const SizedBox(height: 100),
              OriginalButton(text: "Start Attendance", onPressed:  () {
                  // Add logic to navigate to the attendance page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AttendancePage()),
                  );
                }, textColor: kTextWhiteColor, bgColor: kPrimaryColor)
              
            ],
          ),
        ),
      ),
    );
    
  }
    
   // ignore: non_constant_identifier_names
   Future<void> _ShowDatePicker()async{
     DateTime? picked =await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
     firstDate: DateTime(2000), 
     lastDate: DateTime(2100),
     );
     if(picked != null){
      setState(() {
        _dateController.text =picked.toString().split(" ")[0];
      }
      );
   }
  }
  
}

class ClassSelectionDropdown extends StatefulWidget {
  const ClassSelectionDropdown({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ClassSelectionDropdownState createState() => _ClassSelectionDropdownState();
}

class _ClassSelectionDropdownState extends State<ClassSelectionDropdown> {
  String _selectedClass = 'Class A';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black87,width: 1),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 30,left: 30),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          isExpanded: true,
          focusColor: kPrimaryColor,
          value: _selectedClass,
          onChanged: (String? newValue) {
            setState(() {
              _selectedClass = newValue!;
            });
          },
          items: <String>['Class A', 'Class B', 'Class C', 'Class D']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),),
      ),
    );
  }
}

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
       onPressed: (){
        
       },
      child:const Icon(Icons.send)),
      appBar: AppBar(
        title: const Text('Attendance'),
        backgroundColor: kPrimaryColor,
      ),
      
      body:  Column(
       children: [
         const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: const BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow:[  BoxShadow(
                                  offset: Offset(0, 5),
                                  color: kTextBlackColor,
                                  spreadRadius: 2,
                                  blurRadius: 5)
                            ]
                ),
                height:115,
                child:  Padding(
                  padding: const EdgeInsets.all(9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "user Name", style: TextStyle(fontSize: 25),
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                             style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.green,
                             ),
                    onPressed: (){},
                    child: const Text('P',style: TextStyle(color: kTextWhiteColor),)),
                    ElevatedButton( style: ElevatedButton.styleFrom(
                        backgroundColor:Colors.red,
                             ),
                    onPressed: (){},
                    child: const Text('A',style: TextStyle(color: kTextWhiteColor),)),
                        ],
                     
                       
                       ),
                    ]
                      ),
                )
                  
                ),
            ),
       
          
        ],

      )
    );
  }
}