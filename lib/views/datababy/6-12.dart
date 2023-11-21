import 'package:flutter/material.dart';

class SixtoTwel extends StatefulWidget {
  const SixtoTwel({super.key});

  @override
  State<SixtoTwel> createState() => _SixtoTwelState();
}

class _SixtoTwelState extends State<SixtoTwel> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        //unfocus
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                height: height * 0.1,
                width: width,
                child: Text(
                  'คำนวนน้ำหนัก',
                  style: TextStyle(
                      fontSize: height * 0.03, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                height: height * 0.1,
                width: width,
                child: Text(
                  'เด็กอายุ 6 - 12 เดือน',
                  style: TextStyle(
                      fontSize: height * 0.03, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  height: height * 0.1,
                  width: width,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ส่วนสูง',
                    ),
                  )),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  height: height * 0.1,
                  width: width,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'น้ำหนัก',
                    ),
                  )),
              Container(
                  padding: EdgeInsets.all(8),
                  height: height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.topCenter,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'ผลลัพธ์',
                          style: TextStyle(
                              fontSize: height * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          '22 ',
                          style: TextStyle(
                              fontSize: height * 0.03,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
