import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: demo(),
  ));
}

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  Future<int> get() async {
    int t = 1;
    await Future.delayed(Duration(seconds: 3));
    for (t = 1; t <= 5; t++) {
      print("${t}");
    }
    return t;
  }

  Stream<int> get2()
  async* {
    int t=1;
    for(t=1;t<=10;t++)
      {
        await Future.delayed(Duration(seconds: 1));
        yield t;
      }

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Futuer Bilder and Stream Bilder"),
      ),
      body: Column(
        children: [
          Expanded(child: Container(width: double.infinity,color: Colors.green,
          child: FutureBuilder(future: get(),builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting)
              {
                return Center(child: Text("Getting Data"),);
              }
            else{
              int t=snapshot.data as int;
              return Text("${t}");
            }
          },),
          )),
          Expanded(child: Container(width: double.infinity,color: Colors.red,
          child:StreamBuilder(stream: get2(),builder: (context, snapshot) {
            print(snapshot.connectionState);
            if(snapshot.connectionState==ConnectionState.active)
              {
                int t=snapshot.data as int;
                print("${t}");
                return Slider(value: t.toDouble(), onChanged: (value) {

                },min: 1,max: 10,);

              }
            else{
              return Center(child: Text("Getting Data"),);
            }
          },),

          )),
          Expanded(child: Container(width: double.infinity,color: Colors.yellow,))
        ],
      ),
    );
  }
}
