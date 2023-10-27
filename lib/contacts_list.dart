import 'package:contacta_apps/add_contact.dart';
import 'package:contacta_apps/contact_box.dart';
import 'package:flutter/material.dart';

class ContactsList  extends StatefulWidget {
 
   ContactsList({super.key});
   
   




  @override
   State<ContactsList> createState() => _ContactsListState();
  }
  class _ContactsListState extends State<ContactsList>{
     List liste =[
    ["1 contact",false],
    ["2 contact",false],
    ["3 contact",false],
    ["4 contact",false],
    ["5 contact",false]
  ];
  void change(bool? value,int index){
    setState(() {
      liste[index][1]=value;
    });
  }


  final controller = TextEditingController();
   void saveContact()
   {
    setState(() {
      liste.add([controller.text, false]);
      controller.clear();
      Navigator.of(context).pop();
    });
   }
   void addContact(){
    showDialog(context: context, builder: (context)
    {
      return AddContact(controller: controller, onAdd: saveContact, onCancel: ()=> Navigator.of(context).pop());
    });
   }

   void delContact(index)
   {
    setState(() {
      liste.removeAt(index);
    });
   }
  
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(appBar: AppBar(title: Text("Mes Contacts"),),
                      body:  ListView.builder(
                        itemCount: liste.length,itemBuilder: (context,index){
                          return ContactBox(nomContact: liste[index][0],
                                            selContact: liste[index][1],
                                            onChanged: (value) => change(value, index),
                                            delContact: (context) => delContact(index),  );
                        },),
                        floatingActionButton: FloatingActionButton(onPressed: () => addContact() ,child: Icon(Icons.person),)

    ,);
  }


  }