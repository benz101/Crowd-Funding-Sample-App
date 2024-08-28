import 'package:crowd_funding_sample_app/controller/home_controller.dart';
import 'package:crowd_funding_sample_app/controller/search_controller.dart';
import 'package:crowd_funding_sample_app/helper/currency_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchAllController>(
      builder: (controller) {
        return Container(
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
                ListOfMostlySearchedBuilder(controller: controller),
              ],
            ),
          );
      }
    );  }
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
  final SearchAllController controller;
  const ListOfMostlySearchedBuilder({super.key, required this.controller});

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
                itemCount: controller.listOfWellness.length,
                itemBuilder: (context, index) => ItemOfMostlySearchedBuilder(item: controller.listOfWellness[index])),
          )
        ],
      ),
    );
  }
}

class ItemOfMostlySearchedBuilder extends StatelessWidget {
  final Wellness item;
  const ItemOfMostlySearchedBuilder({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: item.icon,
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                item.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
               Text(
                CurrencyFormatter.convertToIdr(item.price, 0),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
