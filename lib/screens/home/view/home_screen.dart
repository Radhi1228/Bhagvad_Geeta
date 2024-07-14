import 'package:bhagvatgita_departure/screens/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getChapter();
    context.read<HomeProvider>().getData();
  }

  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: providerW!.theme == true ? Colors.orange.shade500 : Colors.orange.shade200,
          title: const Text("|| श्रीमद् भगवद् गीता ||"),
          centerTitle: true,
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
                IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border))
              ],
            ),
          ]),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/image/krishna.jpg",fit: BoxFit.cover),
          ListView.builder(
          itemCount: providerW!.chapterList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding:const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: providerW!.theme == true ? Colors.black.withOpacity(0.5) : Colors.white.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: ListTile(
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                  // ),
                  onTap: () {
                     providerR!.getSelectedVerse(providerR!.chapterList[index].chapterNumber!);
                    Navigator.pushNamed(context, 'detail');
                    providerR!.setIndex(index);
                  },
                  leading: Text(
                    "${providerW!.chapterList[index].chapterNumber}",
                    style:TextStyle(fontSize: 20,color: providerW!.theme == true ? Colors.white : Colors.black),
                  ),
                  title: Text(
                    "${providerW!.chapterList[index].name}",
                    style:TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color:providerW!.theme == true ? Colors.white : Colors.black ),
                  ),
                  subtitle: Text(
                    "${providerW!.chapterList[index].versesCount} श्लोक",
                    style: TextStyle(fontSize: 15,color: providerW!.theme == true ? Colors.white : Colors.black),
                  ),
                ),
              ),
            );
          },
        ),
      ],
      ),
    );
  }
}
