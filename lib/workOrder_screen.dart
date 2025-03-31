import 'package:first_foxai_project/menu_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class WorkOrderScreen extends StatefulWidget {
  @override
  State<WorkOrderScreen> createState() => _WorkOrderScreenState();
}

class _WorkOrderScreenState extends State<WorkOrderScreen> {
  String selectedOrder = "TP00624-21120001";
  final List<String> workOrders = [
    "TP00624-21120001",
    "TP00625-21120002",
    "TP00626-21120003",
  ];

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                  width: 180,
                ),
              ),
              Expanded(
                // padding: const EdgeInsets.only(left: 10),
                child: Transform.translate(
                  offset: Offset(-70, 0), //dịch phần tử sang trái 20px
                  child: Text(
                    "Chọn ca làm việc",
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
          // backgroundColor: Colors.red[700],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFFA9BDBF), Color(0xFF1768A6)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 8),
              child: Text(
                "Welcome, username",
                style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        foregroundDecoration: BoxDecoration(
                          // color: Colors.white,
                        ),
                        height: MediaQuery.of(context).size.height * 0.5,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildInputBox(
                              "Mã lệnh sản xuất",
                              Container(
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButtonFormField<String>(
                                  value: selectedOrder,
                                  items:
                                      workOrders.map((order) {
                                        return DropdownMenuItem(
                                          value: order,
                                          child: Text(
                                            order,
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOrder = value!;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    labelText: "Mã lệnh sản xuất",
                                    labelStyle: TextStyle(fontSize: 26),
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            _buildInputBox(
                              "Mã sản phẩm",
                              TextFormField(
                                initialValue: "TP00624",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(fontSize: 26),
                                  labelText: "Mã sản phẩm",
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                readOnly: true,
                              ),
                            ),
                            const SizedBox(height: 50),
                            _buildInputBox(
                              "Tên sản phẩm",
                              TextFormField(
                                initialValue: "TP thực phẩm chức năng",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: const InputDecoration(
                                  labelText: "Tên sản phẩm",
                                  labelStyle: TextStyle(fontSize: 26),
                                  // filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                readOnly: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MenuScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 30,
                                ),
                              ),
                              child: const Text(
                                "Xác nhận",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[700],
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 30,
                                ),
                              ),
                              child: const Text(
                                "Đăng xuất",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputBox(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [child],
    );
  }
}
