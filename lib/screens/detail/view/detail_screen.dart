import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/provider/home_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getData();
  }
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
     appBar: AppBar(title: providerR!.lng == 'sanskrit'?
        Text("${providerR!.chapterList[providerW!.index].name}" ) :
     providerR!.lng == 'english' ?
     Text("${providerR!.chapterList[providerW!.index].nameTranslation}") : const Text(""),
       centerTitle: true,
       backgroundColor: providerW!.theme == true ? Colors.orange.shade500 : Colors.orange.shade200,
         actions: [
           Row(
             children: [
               IconButton(
                 onPressed: () {
                   providerR!.setThemeData();
                 },
                 icon: Icon(providerW!.theme == true
                     ? Icons.light_mode
                     : Icons.dark_mode),
               ),
               IconButton(onPressed: (){
                 const AlertDialog(
                   actions: [
                     AlertDialog(title: Text("English"),)
                   ],
                 );
               }, icon: const Icon(Icons.language))
             ],
           ),
         ],
     ),
      body: Stack(
        children: [
          Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBTDTyyxqXpGuTDwh-TMw8U8tncPAeBKtEzA&s",
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation(0.5),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 280,
                  width: 400,
                  child: Image.network(
                    "${providerR!.chapterList[providerW!.index].imageUrl}",
                    height: 200,
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // Text("${providerW!.chapterList[providerR!.index].name_sanskrit}"),
              const Text("|| श्रीमद् भगवद् गीता ||",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              Expanded(
                child: ListView.builder(
                  itemCount: providerW!.filterList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          "${providerW!.filterList[index].text}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void showFavList()
  {
    showModalBottomSheet(context: context, builder: (context) =>
        Padding(padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(child: ListView.builder(itemCount:providerR!.favList.length,
                itemBuilder: (context, index) {
                  return Container(

                  );
                },
              ),
              ),
            ],
          ),
        ),
      );
  }
  void showWebDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Column(
              children: [
                RadioListTile(
                  value: "Sanskrit",
                  groupValue: providerW!.lng,
                  onChanged: (value) {
                    providerW!.setLang(value.toString());
                    Navigator.pop(context);
                  }, title: const Text("Sanskrit"),),
                RadioListTile(
                  value: "Hindi",
                  groupValue: providerW!.lng,
                  onChanged: (value) {
                    providerW!.setLang(value.toString());
                    Navigator.pop(context);
                  }, title: const Text("Hindi"),),
                RadioListTile(
                  value: "English",
                  groupValue: providerW!.lng,
                  onChanged: (value) {
                    providerW!.setLang(value.toString());
                    Navigator.pop(context);
                  }, title: const Text("English"),),
              ],
            )
          ],
        );
      },);
  }
}