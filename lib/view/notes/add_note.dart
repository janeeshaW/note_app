
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import '../../services/api_services.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_shape_clipper.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: bgDark,
      //   centerTitle: true,
      //   title: const Text("Add Note"),
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: const [AddEventTop(), AddEventScreenBottom()],
        ),
      ),
    );
  }
}

class AddEventTop extends StatefulWidget {
  const AddEventTop({Key? key}) : super(key: key);

  @override
  State<AddEventTop> createState() => _AddEventTopState();
}

class _AddEventTopState extends State<AddEventTop> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 200.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [bgDark, bgBlackLight],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Add Your Note",
                          style: TextStyle(
                            color: kBackgroundColor,
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

class AddEventScreenBottom extends StatefulWidget {
  const AddEventScreenBottom({Key? key}) : super(key: key);

  @override
  State<AddEventScreenBottom> createState() =>
      _AddEventScreenBottomState();
}

class _AddEventScreenBottomState extends State<AddEventScreenBottom> {
  //static AppRepository _appRepository = GetIt.instance.get<AppRepository>();
  final List<bool> _selectedOption = <bool>[true, false];
  int repeatIndex = 0;
  DateTime selectedDate = DateTime.now();
  String selectedTime = "Select time";
  String pickedDate = "Select Date";
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool noteCreated = false;
  bool isLoading = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        pickedDate = "${selectedDate.toLocal()}".split(' ')[0];
        print("pickedDate : $pickedDate");
      });
    }
  }

  Future<void> displayTimeDialog(BuildContext context) async {
    final TimeOfDay? time =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null) {
      setState(() {
        selectedTime = time.format(context);
      });
    }
  }

  // Widget buildEventLocation() {
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(12),
  //     child: Image.asset(
  //       'assets/images/map.jpg',
  //       height: MediaQuery.of(context).size.height / 3,
  //       fit: BoxFit.cover,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return isLoading ? Center(child: ScalingText('Loading...'),): Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Title",
              style: TextStyle(
                  color: bgDark, fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: titleController,
              style: const TextStyle(color: bgTextColorBlack),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: bgDark), //<--<-- SEE HERE
                ),
                hintText: 'Enter Note Title',
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Description",
              style: TextStyle(
                  color: bgDark, fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: descriptionController,
              style: const TextStyle(color: bgTextColorBlack),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: bgDark), //<--<-- SEE HERE
                ),
                hintText: 'Enter Note Description',
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Enter Date",
              style: TextStyle(
                  color: bgDark, fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              readOnly: true,
              onTap: (){_selectDate(context);},
              style: const TextStyle(color: bgTextColorBlack),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: bgDark), //<-- SEE HERE
                ),
                hintText: pickedDate,
              ),
            ),


            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {

                      if(titleController.text.isNotEmpty && pickedDate != "Select Date" && descriptionController.text.isNotEmpty){
                        setState(() {
                          isLoading = true;
                        });
                        noteCreated = await  createNote(titleController.text,descriptionController.text,pickedDate);
                        setState(() {
                          isLoading = false;
                        });

                        if(noteCreated){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content:  Text("Note added successfully"),
                          ));
                        }

                       // Navigator.pop(context);
                      }

                      //_appRepository.addReminder(Reminder(selectedType, titleController.text, selectedTime, pickedDate,"false", _selectedOption[repeatIndex].toString()));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(color: bgDark)
                      ),
                      primary: bgDark,
                      elevation: 8,
                      shadowColor: Colors.black87,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "Add Note",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
