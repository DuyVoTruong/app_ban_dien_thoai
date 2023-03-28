import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(apiKey: "AIzaSyCK2i7X4q7kWWt_Xb8wJcsQlZqsiKIfCPc"
          , appId: ""
          , messagingSenderId: ""
          ,
          projectId: "bandienthoaiapp")
  );
  runApp(const MyApp());
}

class Record {
  final String name;
  final int votes;
  final int groupId;
  final DocumentReference reference;
  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(
    snapshot.data() as Map<dynamic, dynamic>,
    reference: snapshot.reference,
  );
  Record.fromMap(
      Map<dynamic, dynamic> map, {
        required this.reference,
      }) :
        assert(map['name'] != null),
        assert(map['votes'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        votes = map['votes'],
        groupId = map['groupId'];
  @override
  String toString() => "Record<$name:$votes:$groupId>";
}

class Group {
  final String name;
  final int id;
  final DocumentReference reference;
  Group.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(
    snapshot.data() as Map<dynamic, dynamic>,
    reference: snapshot.reference,
  );
  Group.fromMap(
      Map<dynamic, dynamic> map, {
        required this.reference,
      }) :
        assert(map['name'] != null),
        assert(map['id'] != null),
        name = map['name'],
        id = map['id'];
  @override
  String toString() => "Group<$id:$name>";
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Group Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildBody(context),
    );
  }
  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('group').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data?.docs ?? []);
      }, ); }
  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 22.0),
      children: snapshot.map((data) =>
          _buildListItem(context, data)).toList(),
    ); }
  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final group = Group.fromSnapshot(data);
    return Padding(
      key: ValueKey(group.name),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical:
      7.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: ListTile(
            title: Text("Name: "+group.name),
            trailing: Text("Id: "+group.id.toString()),
            onTap: ()=>Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>RecordPage(group: group))
            )
        ), ),
    ); }
}


class RecordPage extends StatelessWidget{

  final Group group;


  const RecordPage({super.key, required this.group});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Group Id: ${group.id}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('document').where('groupId', isEqualTo: group.id).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data?.docs ?? []);
      }, ); }
  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 22.0),
      children: snapshot.map((data) =>
          _buildListItem(context, data)).toList(),
    ); }
  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);
    return Padding(
      key: ValueKey(group.name),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical:
      7.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width/3,
                child: Text("Name: "+record.name),
              ),
              Container(
                width: MediaQuery.of(context).size.width/3,
                child: Text("Group Id: "+record.groupId.toString()),
              ),
            ],
          ),
          trailing: Text("Votes: "+record.votes.toString()),
          onTap: () => FirebaseFirestore.instance.runTransaction((transaction)
          async {
            final freshFBsnapshot = await
            transaction.get(record.reference);
            final updated = Record.fromSnapshot(freshFBsnapshot);
            await transaction
                .update(record.reference, {'votes':
            updated.votes + 1});
          }), ), ),
    ); }
}
