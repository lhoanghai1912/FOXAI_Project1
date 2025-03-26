import 'package:flutter/material.dart';

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
                 Padding(padding: const EdgeInsets.only(right: 10),
            child: Image.network('https://dkpharma.vn/wp-content/uploads/2024/08/logo-2024.png',
              height: 200,
              width: 150,
             ),
          ),
                Expanded(
                  // padding: const EdgeInsets.only(left: 10),
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
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            // color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildInputBox(
                        "Mã lệnh sản xuất",
                        DropdownButtonFormField<String>(
                          value: selectedOrder,
                          items:
                              workOrders.map((order) {
                                return DropdownMenuItem(
                                  value: order,
                                  child: Text(order),
                                );
                              }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedOrder = value!;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: "Mã lệnh sản xuất",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildInputBox(
                        "Mã sản phẩm",
                        TextFormField(
                          initialValue: "TP00624",
                          decoration: const InputDecoration(
                            labelText: "Mã sản phẩm",
                            border: OutlineInputBorder(),
                          ),
                          readOnly: true,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildInputBox(
                        "Tên sản phẩm",
                        TextFormField(
                          initialValue: "TP thực phẩm chức năng",
                          decoration: const InputDecoration(
                            labelText: "Tên sản phẩm",
                            border: OutlineInputBorder(),
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
                        onPressed: () {},
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
                        onPressed: () {},
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
    );
  }

  Widget _buildInputBox(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [child],
    );
  }
}
