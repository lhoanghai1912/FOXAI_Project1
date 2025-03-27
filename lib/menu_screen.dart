import 'setting_Screen.dart';
import 'package:flutter/material.dart';
import 'user_Screen.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    //List text label
    final List<String> buttonTexts = [
      "Kiểm tra nguyên vật liệu đầu vào",
      "Xuất kho sản xuất",
      "Nhập kho bán thành phẩm",
      "Nhập kho thành phẩm",
      "Biểu mẫu pha chế",
      "Trả lại nguyên vật liệu",
      "Nhập điều chỉnh",
      "Xuất điểu chỉnh",
    ];

    //Style nút dùng chung
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.white38,
      foregroundColor: Colors.black,
      side: BorderSide(color: Colors.blue, width: 1.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: const TextStyle(fontSize: 16),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFA9BDBF), Color(0xFF1768A6)],
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.network(
                  'https://dkpharma.vn/wp-content/uploads/2024/08/logo-2024.png',
                  height: 200,
                  width: 150,
                ),
              ),
              Expanded(
                child: Transform.translate(
                  offset: Offset(-70, 0), //dịch phần tử sang trái 20px
                  child: Text(
                    "Menu",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Image.asset('assets/icons/settings.png'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingScreen()),
                );
              },
            ),

            IconButton(
              icon: Image.asset('assets/icons/user.png'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFFA9BDBF), Color(0xFF1768A6)],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                children: List.generate(buttonTexts.length, (index) {
                  return ElevatedButton(
                    style: buttonStyle,
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => SettingScreen()),
                      // );
                    },
                    child: Text(buttonTexts[index]),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SettingScreen()),
                    // );
                  },
                  child: Text("Báo cáo"),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Button 10
            Center(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SettingScreen()),
                    // );
                  },
                  child: Text("Đăng xuất"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
