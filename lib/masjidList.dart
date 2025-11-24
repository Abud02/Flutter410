// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'masjid.dart';

class Masjidlist extends StatefulWidget {
  final String title;
  final List<Masjid>? masjids;

  Masjidlist({super.key, required this.title, required this.masjids});
  @override
  State<Masjidlist> createState() => _MasjidlistState();
}

class _MasjidlistState extends State<Masjidlist> {
  late Masjid selectedMasjid = widget.masjids!.first;
  late int rating = widget.masjids!.first.ratings;
  bool liked = false;
  bool disliked = false;
  String review = "";
  List<String> salawat = ["Fajr", "Dhuhur", "Asr", "Maghrib", "Isha"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${widget.title} Masjids",
          style: TextStyle(
            fontSize: 31,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.indigo[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            DropdownMenu(
              width: 400,
              initialSelection: selectedMasjid.name,
              dropdownMenuEntries: widget.masjids!.map((masjid) {
                return DropdownMenuEntry<String>(
                  value: masjid.name,
                  label: "Masjid: ${masjid.name} - Address: ${masjid.city}",
                );
              }).toList(),
              onSelected: (value) {
                setState(() {
                  selectedMasjid = widget.masjids!.firstWhere(
                    (masjid) => masjid.name == value,
                  );
                  rating = selectedMasjid.ratings;
                  liked = false;
                  disliked = false;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text(
                    "Total Reviews: ${rating}",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w100),
                  ),
                  Text(
                    "Prayer Times ",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w100),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 100,
                        vertical: 15,
                      ),
                      child: salawatTime(
                        salah: salawat[index],
                        masjid: selectedMasjid
                            .getSalahTime(salawat[index])
                            .toString(),
                      ),
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       salawat[index],
                      //       style: TextStyle(
                      //         fontSize: 29,
                      //         fontWeight: FontWeight.w400,
                      //       ),
                      //     ),
                      //     Text(
                      //       style: TextStyle(
                      //         fontSize: 29,
                      //         fontWeight: FontWeight.w400,
                      //       ),
                      //       textAlign: TextAlign.center,
                      //       selectedMasjid
                      //           .getSalahTime(salawat[index])
                      //           .toString(),
                      //     ),
                      //   ],
                      // ),
                    ),
                    itemCount: salawat.length,
                  ),
                  Text(rating.toString()),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 200,
                      vertical: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (liked == false && disliked == true) {
                                liked = true;
                                disliked = false;
                                rating++;
                              } else if (liked == false) {
                                liked = true;
                                rating++;
                              } else {
                                liked = false;
                                rating--;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.thumb_up_alt_sharp,
                            size: 36,
                            color: liked ? Colors.green : Colors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (liked == true && disliked == false) {
                                liked = false;
                                disliked = true;
                                rating--;
                              } else if (disliked == false) {
                                disliked = true;
                                rating--;
                              } else {
                                disliked = false;
                                rating++;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.thumb_down_alt_sharp,
                            size: 36,
                            color: disliked ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "This is your current review: \n $review",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: "You can leave a review here..",
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (text) {
                            setState(() {
                              updateText(text);
                            });
                          },
                        ),
                        SizedBox(height: 25),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Submit", style: TextStyle(fontSize: 24)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo[500],
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateText(String text) {
    setState(() {
      review = text;
    });
  }
}

class salawatTime extends StatelessWidget {
  String salah;
  String masjid;
  salawatTime({super.key, required this.salah, required this.masjid});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          salah,
          style: TextStyle(fontSize: 29, fontWeight: FontWeight.w400),
        ),
        Text(
          style: TextStyle(fontSize: 29, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
          masjid,
        ),
      ],
    );
  }
}
