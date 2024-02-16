import 'package:flutter/material.dart';
const urlImage1 =
    'https://img.freepik.com/free-photo/red-boat-moored-idyllic-lake-near-rocky-mountains_23-2148153611.jpg?w=740&t=st=1705867475~exp=1705868075~hmac=5d42db9f3cc3a0e1ef6710bf5bdde9d0222a6ae59c10c3c074620a7e278178e0';
const urlImage2 = 'https://img.freepik.com/free-photo/red-boat-lake-near-mountain_198523-37.jpg?size=626&ext=jpg&ga=GA1.1.730623105.1705839148&semt=ais';
const urlImage3 = 'https://img.freepik.com/free-photo/horizontal-shot-prags-lake_181624-32498.jpg?size=626&ext=jpg&ga=GA1.1.730623105.1705839148&semt=ais';
const urlImage4 = 'https://img.freepik.com/free-photo/beautiful-village-hallstatt-lake-hallstatt-austria_181624-39270.jpg?size=626&ext=jpg&ga=GA1.1.730623105.1705839148&semt=ais';
const urlImage5 = 'https://img.freepik.com/free-photo/scenery-beautiful-river-mountains-small-houses-cloudy-sky_181624-4443.jpg?size=626&ext=jpg&ga=GA1.1.730623105.1705839148&semt=ais';
const description =
    'Lake Oeschinen lies at the foot of the Bluemlisalp in the Bernese Alps. Situated 1,57 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersterg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer, Activities enjoyed here include rowing, and riding the summer toboggan run.';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final imageList = [urlImage1, urlImage2, urlImage3, urlImage4, urlImage5,];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example'),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _imageSection(),
            _headerSection(),
            _navigationSection(),
            _bodySection(),
          ],
        ),
      ),
    );
  }

  Widget _bodySection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(description),
    );
  }

  Widget _navigationSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.call, color: Colors.blue),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'CALL',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.near_me, color: Colors.blue),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'ROUTE',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.share, color: Colors.blue),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'SHARE',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Oeschinen Lake Campground',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Kandersterg, Switzerland',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              )
            ],
          ),
          Spacer(),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Text(
            '9.5',
          )
        ],
      ),
    );
  }

  Widget _imageSection() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.network(
          imageList[index],
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
        Positioned.fill(
          child: Center(
            child: Text(
              'Oeschinen Lake',
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: -35,
          left: 10,
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                size: 50,
                color: Colors.amber,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: ElevatedButton(
              onPressed: index == imageList.length - 1 ? null : () {
                setState(() {
                  index++;
                });
              },
              child: Text('>>'),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: ElevatedButton(
              onPressed: index == 0 ? null : () {
                setState(() {
                  index--;
                });
              }, child: Text('<<'),
          ),
        ),
      ],
    );
  }
}