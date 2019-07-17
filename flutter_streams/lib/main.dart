import 'package:flutter/material.dart';
import 'package:flutter_streams/BlocProvider.dart';
import 'package:flutter_streams/Blocs/ClientBloc.dart';
import 'package:flutter_streams/ClientModel.dart';
import 'package:flutter_streams/DBProvider.dart';
import 'package:flutter_streams/Message.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Streams',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BlocProvider(
        bloc: UserBloc(),
        child: MyHomePage(title: 'Flutter Streams'),
        ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Client client = new Client(true, true, true, true);
  UserBloc bloc;

  @override 
void initState(){
  // controller = AnimationController(
  //     duration: const Duration(milliseconds: 1000), vsync: );
  //animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  //getClient();
  super.initState();
  bloc = BlocProvider.of<UserBloc>(context);
}

  // void getClient()async{
  //   client= await DBProvider.db.getClient(1);
  //   setState(() { 
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                StreamBuilder<Message>(
                  stream: bloc.outStatusOne,
                  initialData: Message(true, 1),
                  builder: (BuildContext context, AsyncSnapshot<Message> snapshot){
                    return (snapshot.data.value == true)?
                Flexible(child: GestureDetector(
                  onDoubleTap: (){
                    bloc.sinkStatusOne.add(new Message(false, 1));
                    bloc.sinkCounter.add(null);
                    //client.setStatusOne(false);
                  },
                  child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 45),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 5),
                        child: Text("First Card"),)
                    )
                )): Container();
                  }),
                
                
              ],
            ),
            Column(
              children: <Widget>[

                StreamBuilder<Message>(
                  stream: bloc.outStatusTwo,
                  initialData: Message(true, 1),
                  builder: (BuildContext context, AsyncSnapshot<Message> snapshot){
                    return (snapshot.data.value == true)?
                GestureDetector(
                  onDoubleTap: (){
                    bloc.sinkStatusTwo.add(new Message(false, 1));
                    bloc.sinkCounter.add(null);
                    //client.setStatusTwo(false);
                  },
                  child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                        child: Text("Second Card"),)
                    )
                ): Container();
                  }),
                (client.statusThree == true)?
                GestureDetector(
                  onDoubleTap: (){
                    setState(() {
                     client.setStatusThree(false);
                     bloc.sinkCounter.add(null);
                    });
                    //client.setStatusTwo(false);
                  },
                  child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                        child: Text("Third Card"),)
                    )
                ): Container(),
              ],
            ),
            Column(
              children: <Widget>[
                Card(
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        child: Text("Fourth Card"),)
                    ),
              ],
            ),
          ],
        ),
      
      floatingActionButton: StreamBuilder(
        stream: bloc.counterObserverController.stream,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot){
          return FloatingActionButton(
          onPressed: (){},
          tooltip: 'Number',
          child: Text("${snapshot.data}"),
          );
        },
      ) 
        
       
    );
  }
}
