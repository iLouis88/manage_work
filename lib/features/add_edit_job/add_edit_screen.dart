import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../ultils/palette.dart';

class AddEditJobScreen extends StatefulWidget {
  const AddEditJobScreen({super.key});

  @override
  _AddEditJobScreenState createState() => _AddEditJobScreenState();
}

class _AddEditJobScreenState extends State<AddEditJobScreen> {
  final _formKey = GlobalKey<FormState>();
  String _jobName = '';
  String _assignedEmployee = 'Nhân viên A';
  List<String> _participants = [];
  bool _isSurvey = false;
  List<String> _employees = ['Nhân viên A', 'Nhân viên B', 'Nhân viên C'];

  void _toggleParticipant(String emp) {
    if (_participants.contains(emp)) {
      setState(() {
        _participants.remove(emp);
      });
    } else {
      setState(() {
        _participants.add(emp);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> availableParticipants =
        _employees.where((emp) => emp != _assignedEmployee).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thêm công việc',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Palette.mainColor,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration:  BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(15)
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Tên Công Việc',
                    border: UnderlineInputBorder(borderSide: BorderSide.none)),
                onSaved: (value) {
                  _jobName = value!;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10,10,10,5),
              child: const Text(
                'Nhân viên được giao',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: const Text('Lựa chọn'),
                  isExpanded: true,
                 dropdownColor: Colors.white,
                  icon: const Icon(
                    Icons.keyboard_arrow_right_rounded,
                  ),
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
                  value: _assignedEmployee,
                  onChanged: (String? newValue) {
                    setState(() {
                      _assignedEmployee = newValue!;
                    });
                  },
                  items: _employees.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10,15,10,5),
              child: const Text(
                  'Người tham gia', style: TextStyle(
                fontWeight: FontWeight.bold,
                  fontSize: 15
              ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: availableParticipants
                    .map((emp) => CheckboxListTile(
                            title: Text(emp),
                            value: _participants.contains(emp),
                            onChanged: (bool? newValue) {
                              _toggleParticipant(emp);
                            },
                          ),
                    )
                    .toList(),
              ),
            ),
            SwitchListTile(
              title: const Text('Khảo sát lắp đặt'),
              value: _isSurvey,
              onChanged: (bool value) {
                setState(() {
                  _isSurvey = value;
                });
              },

            ),

            Visibility(
              visible: _isSurvey,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 1),
                    decoration: const BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.only( topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Tên Người Liên Hệ',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none
                      ),

                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 1),
                    decoration: const BoxDecoration(color: Colors.white,

                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Điện Thoại',
                        border: UnderlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 1),
                    decoration: const BoxDecoration(color: Colors.white,

                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Email',
                        border: UnderlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    decoration: const BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)
                      ),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Địa Chỉ',
                        border: UnderlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Thực hiện lưu thông tin
                  }
                },
                clipBehavior:  Clip.antiAlias,

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.white; // Màu nền khi nút được nhấn
                      }
                      return Palette.mainColor; // Màu nền mặc định
                    },
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black;
                      }
                      return Colors.white;
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Radius của nút
                    ),
                  ),
                ),
                child: const Text('Lưu Công Việc'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
