// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class Notes extends StatelessWidget {
//   const Notes({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     List notes=[
//        {"text":"Don't forget to buy a book","color":Colors.cyan,"time":"10.09 am"}
//       ,{"text":"Brush my teeth","color":Colors.purple,"time":"12.10 pm"},
//       {"text":"Our exam tomorrow at 9 am ","color":Colors.orange,"time":"02.00 am"},
//       {"text":"finish our study","color":Colors.deepPurple,"time":"07.19 am"},
//        {"text":"playing football at 10 pm","color":Colors.deepPurpleAccent,"time":"09.09 pm"},
//       {"text":"Our exam tomorrow at 9 am ","color":Colors.lightGreen,"time":"12.15 pm"},
//       {"text":"Don't forget to buy a book","color":Colors.deepOrange,"time":"01.30 am"},
//       {"text":"finish our study","color":Colors.deepPurple,"time":"03.02 am"},
//      {"text":"Brush my teeth","color":Colors.blueAccent,"time":"05.19 pm"},
//
//     ];
//     return Scaffold(
//      backgroundColor: Colors.grey,
//       appBar: AppBar(
//         title: Text("Your Notes!",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
//         centerTitle: true,
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.black,),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Container(
//          width: MediaQuery.of(context).size.width,
//          height: MediaQuery.of(context).size.height,
//          child: Column(
//             children: [
//         SizedBox(height: 20.h,),
//         Container(
//           height:540.h ,
//           width: 400.w,
//           margin: EdgeInsets.all(5),
//           child: GridView.builder(
//             scrollDirection: Axis.vertical,
//               gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20,childAspectRatio: 1,crossAxisSpacing: 30,mainAxisExtent: 150) ,
//               itemCount: notes.length,
//               itemBuilder:(context,count){
//                return Container(
//                  padding: EdgeInsets.all(7),
//                   width: 150.w,
//                   height: 150.h,
//                   decoration: BoxDecoration(
//                     color: notes[count]['color'],
//                     border: Border.all( color: notes[count]['color'],width: 1.w),
//                     borderRadius: BorderRadius.circular(15.r),
//                   ),
//                   child: Stack(children:
//                   [
//                     Text("${notes[count]['text']}",style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.normal),)
//                   ,Positioned(child: Text("${notes[count]['time']}",style: TextStyle(color: Colors.black45,fontSize: 15.sp,fontWeight: FontWeight.normal),),bottom: 0,right: 0,)
//                   ]),
//                 );
//               }),
//         )
//          ],
//             )
//         ),
//       )
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Data model for notes
class NoteModel {
  final String text;
  final Color color;
  final String time;

  const NoteModel({
    required this.text,
    required this.color,
    required this.time,
  });
}

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  // Sample notes data
  final List<NoteModel> notes = [
    NoteModel(text: "Don't forget to buy a book", color: Colors.cyan, time: "10:09 AM"),
    NoteModel(text: "Brush my teeth", color: Colors.purple, time: "12:10 PM"),
    NoteModel(text: "Our exam tomorrow at 9 am", color: Colors.orange, time: "02:00 AM"),
    NoteModel(text: "Finish our study", color: Colors.deepPurple, time: "07:19 AM"),
    NoteModel(text: "Playing football at 10 pm", color: Colors.deepPurpleAccent, time: "09:09 PM"),
    NoteModel(text: "Our exam tomorrow at 9 am", color: Colors.lightGreen, time: "12:15 PM"),
    NoteModel(text: "Don't forget to buy a book", color: Colors.deepOrange, time: "01:30 AM"),
    NoteModel(text: "Finish our study", color: Colors.deepPurple, time: "03:02 AM"),
    NoteModel(text: "Brush my teeth", color: Colors.blueAccent, time: "05:19 PM"),
  ];

  void _addNewNote() {
    // TODO: Implement add note functionality
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Note'),
        content: const Text('Add note functionality coming soon!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 600;
    final crossAxisCount = isDesktop ? 3 : 2;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      floatingActionButton: _buildFloatingActionButton(),
      body: _buildBody(crossAxisCount),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        "Your Notes!",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          fontSize: 24.sp,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.blue),
          onPressed: () {
            // TODO: Implement search functionality
          },
        ),
      ],
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _addNewNote,
      backgroundColor: Colors.blue,
      elevation: 4,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  Widget _buildBody(int crossAxisCount) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: CustomScrollView(
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => _buildNoteCard(notes[index]),
                childCount: notes.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 80.h)),
          ],
        ),
      ),
    );
  }

  Widget _buildNoteCard(NoteModel note) {
    return Container(
      decoration: BoxDecoration(
        color: note.color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: note.color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // TODO: Implement note detail view
          },
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    note.text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      note.time,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12.sp,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        _showNoteOptions(note);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showNoteOptions(NoteModel note) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit'),
            onTap: () {
              Navigator.pop(context);
              // TODO: Implement edit functionality
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: const Text('Delete', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
              // TODO: Implement delete functionality
            },
          ),
        ],
      ),
    );
  }
}