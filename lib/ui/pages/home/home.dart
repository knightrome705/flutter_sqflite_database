import 'package:flutter/material.dart';
import 'package:note_app/database/add_notes.dart';
import 'package:note_app/model/notes.dart';
import 'package:note_app/ui/components/appstyle.dart';
import 'package:note_app/utils/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController title=TextEditingController();
    TextEditingController des=TextEditingController();
    getNotes();
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          'NoteApp',
          style: AppStyle.heading1.copyWith(fontSize: 25),
        ),
        backgroundColor: primary,
      ),
      body: ValueListenableBuilder(
        valueListenable: noteslist,
        builder: (context,notes,_) {
          return ListView.builder(
            itemCount: notes.length,
            physics:const BouncingScrollPhysics(),
            itemBuilder: (context,index) {
              var data=notes[index];
              // print(data.title);
              return Card(
                child: ListTile(
                  title: Text(data.title),
                  subtitle: Text(data.des),
                  trailing: InkWell(
                    onTap: ()=>removeNotes(id:data.id!),
                    child:const Icon(Icons.delete,color: Colors.red,)),
                ),
              );
            }
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        shape:const CircleBorder(),
        onPressed: () {
          showSheet(context,title,des);
        },
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
  Future<void> showSheet(context,title,des)async{
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        padding:const EdgeInsets.symmetric(horizontal: 20),
        child:  Column(
          children: [
            const SizedBox(height: 40,),
           const Text('Add Notes',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
           const  SizedBox(height: 40,),
            TextField(
            controller: title,
              decoration:const InputDecoration(
                  hintText: 'Enter title', border: OutlineInputBorder()),
            ),
          const  SizedBox(
              height: 30,
            ),
            TextField(
            controller: des,
              decoration:const InputDecoration(
                hintText: 'Description',
                border: OutlineInputBorder()),
            ),
           const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              final data=Notes(title: title.text, des: des.text);
              addNotes(data);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize:const Size(180, 40)
            ),
             child:const Text('ADD',style: TextStyle(color: Colors.white),))
          ],
        ),
      );
    },);
  }
}
