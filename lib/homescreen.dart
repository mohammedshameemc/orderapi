import 'package:figmaapi/apiprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class notification extends StatelessWidget {
  const notification({super.key});

  @override
  Widget build(BuildContext context) {
    notificationProvider provider=Provider.of<notificationProvider>(context,listen: false);
    provider.getApi();
    return  SafeArea(
      child: Scaffold(



        appBar: AppBar(toolbarHeight: 100,elevation: 10,shadowColor: Colors.black,backgroundColor: Colors.white,

          leading:Image.asset("assets/Group 597.png",scale: .8),

          title: Text("Notifications",style: TextStyle(fontSize: 24,fontFamily: "Quicksand",fontWeight: FontWeight.w700)),
        ),

          backgroundColor: Colors.white,
        body:

        Consumer<notificationProvider>(
          builder: (context,value,child) {
            return ListView.builder(itemCount:value.ApiList.length ,
              itemBuilder: (context, index) {
              var item=value.ApiList[index];
              return Column(
                children: [
                  ListTile(

                    leading: Image.asset("assets/${item.image}"),

                    title:
                    Text(item.title.toString(),style: TextStyle(fontSize: 18,fontFamily: "Quicksand",fontWeight: FontWeight.w700)),
                    subtitle:Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.body,
                            style: TextStyle(fontSize: 16,fontFamily: "Quicksand",fontWeight:FontWeight. w500),),
                        Text(provider.formatTimestamp(value.ApiList[index].timestamp),style: TextStyle(fontSize: 12,fontFamily: "Quicksand",)),
                      ],
                    ),

                  ),
                  SizedBox(height: 10,),
                  Divider(color: Colors.grey,thickness: .3,)

                ],
              );

            },);
          }
        ),





      ),
    );
  }
}
