import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:manage_work/ultils/palette.dart'; // Thêm thư viện này để định dạng ngày giờ

class ViewJobScreen extends StatefulWidget {
  @override
  _ViewJobScreenState createState() => _ViewJobScreenState();
}

class _ViewJobScreenState extends State<ViewJobScreen> {
  final List<Map<String, dynamic>> updates = []; // Lưu trữ các cập nhật
  final TextEditingController messageController = TextEditingController();
  final ScrollController chatScrollController = ScrollController();

  final List<String> messages = []; // Danh sách các tin nhắn chat
  final ScrollController scrollController = ScrollController();

  void _showUpdateDialog() {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Cập nhật tiến độ công việc'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Tiêu đề',
                    contentPadding: EdgeInsets.only(left: 10),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: contentController,
                  decoration: InputDecoration(
                    hintText: 'Nội dung',
                    contentPadding: EdgeInsets.only(left: 10),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Hủy',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _addUpdate(titleController.text, contentController.text);
              },
              child: Text('Lưu'),
            ),
          ],
        );
      },
    );
  }

  void _addUpdate(String title, String content) {
    if (title.isNotEmpty && content.isNotEmpty) {
      setState(() {
        updates.add({
          'title': title,
          'content': content,
          'time': DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String linkImage =
        'https://i.pinimg.com/736x/6e/af/1a/6eaf1a844ae4b6fa6eeb6ff17f468cc0.jpg';
    String linkImageDefault =
        'https://i.pinimg.com/1200x/18/c4/dd/18c4dd7c757bcde577e4c9dae06062cf.jpg';
    String linkImg2 =
        'https://i.pinimg.com/564x/36/02/bc/3602bc802fba971ab22783aba887f095.jpg';
    final mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông Tin Công Việc'),
        actions: [
          InkWell(
            onTap: _showUpdateDialog,
            child: Container(
              width: 24,
              height: 24,
              margin: EdgeInsets.only(right: 10),
              child: Image.network(
                'https://i.imgur.com/bSuZWfs.png',
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: mWidth,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tên công việc',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text('Phát triển ứng dụng Flutter'),
                    ],
                  )),
              Container(
                width: mWidth,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phân loại:',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text('Khảo sát lắp đặt'),
                        ],
                      ),
                    ),
                    Container(
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Người tạo:',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text('Nguyễn Văn Thành'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: mWidth,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Chi tiết công việc',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: const Text(
                        'Xây dựng giao diện ứng dụng theo bên dưới bằng flutter\nThiết kế giao diện responsive với các kích thước màn hình\nThời gian hoàn thành sớm nhất có thể',
                        style: TextStyle(),
                      ),
                    ),
                  ],
                ),
              ),
              ExpansionTile(
                backgroundColor: Colors.white,
                title: Row(
                  children: [
                    SizedBox(
                        width: 24,
                        height: 24,
                        child:
                            Image.network('https://i.imgur.com/0zC7VJw.png')),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Chat',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                initiallyExpanded: false,
                children: [
                  buildContainerChat(
                    Palette.backgroundColor,
                    10,
                    mWidth * 0.2,
                    'Hari - Admin',
                    linkImageDefault,
                    'Phân chia task nhe mọi người',
                    '8 phút trước',
                  ),
                  buildContainerChat(
                    Palette.mainColor,
                    mWidth * 0.2,
                    10,
                    'Louis - NVT',
                    linkImage,
                    'Ok bro',
                    '7 phút trước',
                    colContent: Colors.white,
                    colName: Colors.white,
                    colTime: Colors.white,
                  ),
                  buildContainerChat(
                    Palette.backgroundColor,
                    10,
                    mWidth * 0.2,
                    'Blake - Staff',
                    linkImg2,
                    'Yes sir :v',
                    '7 phút trước',
                  ),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      controller: chatScrollController,
                      itemCount: messages.length,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.fromLTRB(mWidth * 0.2, 0, 10, 10),
                        decoration: BoxDecoration(
                            color: Palette.mainColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          title: const Text(
                            'Louis-NVT',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                messages[index],
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                DateFormat.yMd()
                                    .add_jm()
                                    .format(DateTime.now()),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                            ],
                          ),
                          leading: CircleAvatar(
                            backgroundImage: Image.network(linkImage).image,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          )),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: messageController,
                              decoration: const InputDecoration(
                                  hintText: 'Nhập văn bản',
                                  contentPadding: EdgeInsets.only(left: 10),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                          InkWell(
                              onTap: _sendMessage,
                              child: Container(
                                width: 30,
                                height: 30,
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Image.network(
                                  'https://i.imgur.com/h4Gyjj6.png',
                                  color: Palette.mainColor,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                  backgroundColor: Colors.white,
                  title: const Text(
                    'Lịch sử cập nhật',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  initiallyExpanded: false,
                  children: [
                    ListTile(
                      title: const Text(
                        'Update ngày 11/05',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hoàn thành basic UI các chức năng'),
                          Text(
                            '1 ngày trước',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            Image.network('https://i.imgur.com/SvbWRtF.png')
                                .image,
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        'Update ngày 12/5',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hoàn thành UI app quản lý công việc'),
                          Text(
                            '6 giờ trước',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            Image.network('https://i.imgur.com/SvbWRtF.png')
                                .image,
                      ),
                    ),
                    ...updates
                        .map(
                          (update) => ListTile(
                            title: Text(
                              update['title'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${update['content']}'),
                                Text(
                                  '${update['time']}',
                                  style: const TextStyle(fontSize: 11),
                                )
                              ],
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: Image.network(
                                      'https://i.imgur.com/SvbWRtF.png')
                                  .image,
                            ),
                          ),
                        )
                        .toList(),
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainerChat(
    Color bgColor,
    double left,
    double right,
    String name,
    String linkImageDefault,
    String content,
    String time, {
    Color colName = Colors.black,
    Color colContent = Colors.black,
    Color colTime = Colors.black,
  }) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 10),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.w600, color: colName),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              content,
              style: TextStyle(color: colContent),
            ),
            Text(
              time,
              style: TextStyle(fontSize: 11, color: colTime),
            )
          ],
        ),
        leading: CircleAvatar(
          backgroundImage: Image.network(linkImageDefault).image,
        ),
      ),
    );
  }

  void _sendMessage() {
    if (messageController.text.isNotEmpty) {
      setState(() {
        messages.add(messageController.text);
        messageController.clear();
        chatScrollController.animateTo(
          chatScrollController.position.maxScrollExtent + 60.0,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    chatScrollController.dispose();
    super.dispose();
  }
}
