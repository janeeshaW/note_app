import 'package:flutter/material.dart';

import '../../models/notes.dart';
import '../../services/api_services.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_shape_clipper.dart';
import 'package:progress_indicators/progress_indicators.dart';

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {

  bool isLoading = true;
  bool hasData = false;


  NotesModel? notes;
  @override
  void initState() {
    getData ();

    super.initState();
  }

  void getData () async {
    notes = await requestGetALLNotes();
    isLoading = false;
    if(notes != null){
      if(notes!.results.isNotEmpty){
        hasData = true;
      }
    }
    setState(() {
    });
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: isLoading ?  Center(child: ScalingText('Loading...'),): !hasData? const Text("You Dont Have Any Saved Notes"): SingleChildScrollView(
        child: Column(
          children: [const AddEventTop(), AddEventScreenBottom(notes: notes!,)],
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
                    padding: const EdgeInsets.only(left: 16,top: 16,right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "My Notes",
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
  final NotesModel notes;
  const AddEventScreenBottom({Key? key,required this.notes,}) : super(key: key);

  @override
  State<AddEventScreenBottom> createState() =>
      _AddEventScreenBottomState();
}

class _AddEventScreenBottomState extends State<AddEventScreenBottom> {
  bool delete = false;
  bool isLoading = false;
  //List<int> items = List<int>.generate(100, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return  isLoading ? Center(child: ScalingText('Loading...'),): SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: ListView.builder(
          //physics: ,
          primary: false,
          //physics: Scroll,
         shrinkWrap: true,
          itemCount: widget.notes.results.length,
            itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              background: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.red,),

                ),
              ),
              key: ValueKey<ResultGroup>(widget.notes.results[index]),
              onDismissed: (DismissDirection direction) async {
                setState(() {
                  widget.notes.results.removeAt(index);
                  isLoading = true;
                });
                delete = await deleteNote(widget.notes.results[index].id!);
                setState(() {
                  isLoading = false;
                });
              },
              child:   Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.black,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      //leading: Icon(Icons.album, size: 70),
                      title: Text(widget.notes.results[index].title!, style: TextStyle(color: Colors.white)),
                      subtitle: Text(widget.notes.results[index].description!, style: TextStyle(color: Colors.white)),
                    ),
                    Row(
                      children:  [
                        TextButton(
                          child: const Text('Edit', style: TextStyle(color: Colors.white)),
                          onPressed: () {},
                        ),
                        const Spacer(),
                        TextButton(
                          child: const Text('Delete', style: TextStyle(color: Colors.white)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
