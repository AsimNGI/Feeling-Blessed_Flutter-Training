import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const MyHomePage(title: 'First Method'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isGridView = true;
  @override
  Widget build(BuildContext context) {
    print('build called');

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      drawer: Drawer(child: Column(children: [Text('Drawer')])),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
          onPressed: () {
            print('Back pressed');
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('Search pressed');
            },
            icon: Icon(Icons.search),
          ),
        ],
        centerTitle: false,
        title: Text("Talha"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('1'),
            10.verticalSpace,
            Text('2'),
            Row(children: [Text('3'), Text('4')]),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isGridView = !isGridView;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text('Change developer'),
            ),
            isGridView
                ? Container(color: Colors.red, width: 100.w, height: 100.h)
                : Container(color: Colors.blue, width: 100.w, height: 100.h),
            if (isGridView) Container(color: Colors.green, width: 100.w, height: 100.h),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, color: Colors.blue),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    print('Imran tapped');
                  },
                  child: Container(
                    width: 150.w,
                    height: 150.h,
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2),
                      image: DecorationImage(
                        image: AssetImage('asset/images/profile.png'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 8,
                          blurRadius: 20,
                          offset: Offset(2, 6),
                        ),
                      ],
                    ),
                    child: Text(
                      'Container',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: Colors.red,
                      width: 150,
                      height: 150,
                      padding: EdgeInsets.all(20),

                      alignment: Alignment.center,
                    ),
                    Row(
                      children: [
                        Container(
                          color: Colors.blue,
                          width: 30,
                          height: 30,
                          padding: EdgeInsets.all(20),
                        ),
                        SizedBox(width: 10),
                        Container(
                          color: Colors.blue,
                          width: 30,
                          height: 30,
                          padding: EdgeInsets.all(20),
                        ),
                      ],
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                print('Text Button pressed');
              },
              child: Text('Text Button'),
            ),

            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your name',
              ),
            ),
            SizedBox(
              height: ScreenUtil().screenHeight * 0.2,
              width: ScreenUtil().screenWidth * 0.5,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [Text('1'), Text('2'), Text('3'), Text('4'), Text('5'), Text('6')],
              ),
            ),
            Container(
              color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: mockList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CharityNameWidget(charityName: mockList[index].charityName),
                      Text(mockList[index].charityDescription),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return index != 2 ? Divider() : SizedBox.shrink();
                },
                itemCount: mockList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CharityNameWidget(charityName: mockList[index].charityName),
                      Text(mockList[index].charityDescription),
                    ],
                  );
                },
              ),
            ),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1 / 1.5,
              ),
              children: [
                Container(color: Colors.red),
                Container(color: Colors.blue),
                Container(color: Colors.green),
                Container(color: Colors.yellow),
                Container(color: Colors.purple),
                Container(color: Colors.orange, width: 100, height: 100),
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1 / 1.5,
              ),
              itemCount: mockList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CharityNameWidget(charityName: mockList[index].charityName),
                    Text(mockList[index].charityDescription),
                  ],
                );
              },
            ),
            Image.asset(
              'asset/images/profile.png',
              width: 100,
              height: 400,
              // fit: BoxFit.fitWidth,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
            ),
            Column(spacing: 10.h, children: [Text('1'), Text('2'), Text('3')]),
            Container(
              width: 50.w,
              height: 50.h,
              padding: EdgeInsets.all(14.75.r),
              decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: FlutterLogo(),
            ),
          ],
        ),
      ),
    );
  }
}

class MockClass {
  String charityName;
  String charityDescription;

  MockClass({required this.charityName, required this.charityDescription});
}

List<MockClass> mockList = [
  MockClass(charityName: 'Charity 1', charityDescription: 'Description 1'),
  MockClass(charityName: 'Charity 2', charityDescription: 'Description 2'),
  MockClass(charityName: 'Charity 3', charityDescription: 'Description 3'),
];

class CharityNameWidget extends StatelessWidget {
  final String charityName;
  const CharityNameWidget({super.key, required this.charityName});

  @override
  Widget build(BuildContext context) {
    return Text(charityName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }
}
