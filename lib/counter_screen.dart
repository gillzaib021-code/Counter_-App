import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter=0;
  bool isloading=true;

  @override
  void initState() {
   
    super.initState();
    loadcounter();
  }

  Future <void> loadcounter()async{
    final prefs=await SharedPreferences.getInstance();
    setState(() {
      _counter=prefs.getInt('counter')??0;
      isloading=false;
    });
  }

  Future<void> savecounter()async{
final prefs= await SharedPreferences.getInstance();
await prefs.setInt('counter', _counter);
  }

  Future<void> incrementcounter()async{
    setState(() {
  _counter++;
});
savecounter();
  }

  Future<void> decrementcounter()async{
    setState(() {
      if (_counter>0) {
         _counter--;
      }
     
    });
    savecounter();
  }


   Future<void> resetcounter()async{
    setState(() {
      _counter=0;
    });
    savecounter();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text("Counter App", style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        
        ),
      ),

      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text
            ('Counter Value',style: 
            TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold
            ),
          ),
          ),
          SizedBox(height: 10,),
          Text(
            '$_counter',style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: (){
                  decrementcounter();
                },
               backgroundColor: Colors.red,
              child: Icon(Icons.remove, color: Colors.white,),
              ),
                
              
              FloatingActionButton(onPressed: (){
                incrementcounter();
              },
                backgroundColor: Colors.green,
               child: Icon(Icons.add,color: Colors.white,),
               ),
               
              
            ],
          ),
             SizedBox(height: 20,),
           TextButton(onPressed: (){
               resetcounter();
           }, 
           style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 17, 59, 94)
           ),
           child: Text('Reset Counter', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
           ),))
          

        ],
      ),
    );
  }
}