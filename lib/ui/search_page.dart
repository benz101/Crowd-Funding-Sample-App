import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 50),
            NecessaryFormInputBuilder(),
            SizedBox(height: 5),
            RecentSearchingBuilder(),
            SizedBox(height: 5),
            ListOfMostlySearchedBuilder(),
          ],
        ),
      ),
    );
  }
}

class NecessaryFormInputBuilder extends StatelessWidget {
  const NecessaryFormInputBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cari Kebutuhanmu'),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          child: TextFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!))),
          ),
        )
      ],
    );
  }
}

class RecentSearchingBuilder extends StatelessWidget {
  const RecentSearchingBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(child: Text('Terakhir dicari')),
                GestureDetector(onTap: () {}, child: Text('Hapus Semua'))
              ],
            ),
            Row(
              children: [
                Icon(Icons.history),
                Expanded(child: Text('Terakhir dicari')),
                IconButton(onPressed: () {}, icon: Icon(Icons.close)),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class ListOfMostlySearchedBuilder extends StatelessWidget {
  const ListOfMostlySearchedBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Paling Sering Dicari',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: 5,
                itemBuilder: (context, index) => ItemOfMostlySearchedBuilder()),
          )
        ],
      ),
    );
  }
}

class ItemOfMostlySearchedBuilder extends StatelessWidget {
  const ItemOfMostlySearchedBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            color: Colors.grey[300],
          )),
          Text(
            'Wellness Label',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
