import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DischargeScreen extends StatefulWidget {
  @override
  State<DischargeScreen> createState() => _DischargeScreenState();
}

class _DischargeScreenState extends State<DischargeScreen>{

  // Dummy data
  final maCTController = TextEditingController(text: '44');
  final maYCController = TextEditingController(text: '68');
  final ngayXuatController = TextEditingController(text: '24/02/2025');
  final tenTPController = TextEditingController(
    text: 'TPBVSX Siro Berberis 30ml',
  );
  final maTPController = TextEditingController(text: 'TP00624');
  final trangThaiController = TextEditingController(text: 'Mở');
  final khoXuatController = TextEditingController(text: 'K-SX');
  final nguoiNhapController = TextEditingController(text: 'Nguyễn Thị Hồng');

  // Dropdown
  String selectedOrder = 'TP00624-21120001';
  final List<String> orderList = [
    'TP00624-21120001',
    'TP00624-21120002',
    'TP00624-21120003',
  ];


@override
Widget build(BuildContext context){
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
                  "Phiếu xuất kho sản xuất",
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Thông báo lỗi QR
          // Container(
          //   width: double.infinity,
          //   padding: const EdgeInsets.all(12),
          //   margin: const EdgeInsets.only(bottom: 16),
          //   color: Colors.red[100],
          //   child: const Text(
          //     'Mã QR không hợp lệ!',
          //     style: TextStyle(
          //       color: Colors.red,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),

          // Thông tin chung
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Cột 1
                    Expanded(
                      child: Column(
                        children: [
                          buildTextField(
                            label: 'Mã CT',
                            controller: maCTController,
                            readOnly: true,
                          ),
                          const SizedBox(height: 12),
                          buildTextField(
                            label: 'Ngày xuất kho',
                            controller: ngayXuatController,
                            readOnly: true,
                          ),
                          const SizedBox(height: 12),
                          buildTextField(
                            label: 'Trạng thái',
                            controller: trangThaiController,
                            readOnly: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Cột 2
                    Expanded(
                      child: Column(
                        children: [
                          // Dropdown Lệnh sản xuất
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Lệnh sản xuất',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 4),
                              DropdownButtonFormField<String>(
                                value: selectedOrder,
                                items:
                                orderList
                                    .map(
                                      (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedOrder = value!;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  isDense: true,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          buildTextField(
                            label: 'Tên thành phẩm',
                            controller: tenTPController,
                            readOnly: true,
                          ),
                          const SizedBox(height: 12),
                          buildTextField(
                            label: 'Kho xuất',
                            controller: khoXuatController,
                            readOnly: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Cột 3
                    Expanded(
                      child: Column(
                        children: [
                          buildTextField(
                            label: 'Mã yêu cầu chuyển kho',
                            controller: maYCController,
                            readOnly: true,
                          ),
                          const SizedBox(height: 12),
                          buildTextField(
                            label: 'Mã thành phẩm',
                            controller: maTPController,
                            readOnly: true,
                          ),
                          const SizedBox(height: 12),
                          buildTextField(
                            label: 'Người nhập',
                            controller: nguoiNhapController,
                            readOnly: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          // Table Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            color: Colors.green[200],
            child: Row(
              children: const [
                Expanded(child: Text('STT',textAlign: TextAlign.center)),
                Expanded(child: Text('Mã NVL',textAlign: TextAlign.center)),
                Expanded(child: Text('Tên NVL',textAlign: TextAlign.center)),
                Expanded(child: Text('Số lô',textAlign: TextAlign.center)),
                Expanded(child: Text('Hạn sử dụng',textAlign: TextAlign.center)),
                Expanded(child: Text('Kiểm tra QR',textAlign: TextAlign.center)),
                Expanded(child: Text('SL theo yêu cầu',textAlign: TextAlign.center)),
                Expanded(child: Text('SL xuất thực tế',textAlign: TextAlign.center)),
                Expanded(child: Text('SL lũy kế',textAlign: TextAlign.center)),
                Expanded(child: Text('SL còn lại',textAlign: TextAlign.center)),
                Expanded(child: Text('DVT',textAlign: TextAlign.center)),
                Expanded(child: Text('Ghi chú',textAlign: TextAlign.center)),
              ],
            ),
          ),

          // Dummy Table Data
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Text('${index + 1}',textAlign: TextAlign.center)),
                      Expanded(child: Text('BB00${index + 1}',textAlign: TextAlign.center)),
                      const Expanded(child: Text('Tên NVL',textAlign: TextAlign.center)),
                      const Expanded(child: Text('1226',textAlign: TextAlign.center)),
                      const Expanded(child: Text('31/12/2025',textAlign: TextAlign.center)),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(child: Text('1',textAlign: TextAlign.center)),
                      const Expanded(child: Text('0',textAlign: TextAlign.center)),
                      const Expanded(child: Text('0',textAlign: TextAlign.center)),
                      const Expanded(child: Text('0',textAlign: TextAlign.center)),
                      const Expanded(child: Text('Cái',textAlign: TextAlign.center)),
                      const Expanded(child: Text('',textAlign: TextAlign.center)),
                    ],
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  print('Lưu phiếu');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                ),
                child: const Text(
                  'Lưu phiếu',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Đồng bộ');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                ),
                child: const Text(
                  'Đồng bộ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                ),
                child: const Text(
                  'Quay lại',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildTextField({
  required String label,
  TextEditingController? controller,
  bool readOnly = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      const SizedBox(height: 4),
      TextFormField(
        controller: controller,
        readOnly: readOnly,
        // textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          isDense: true,
        ),
      ),
    ],
  );
}
}
