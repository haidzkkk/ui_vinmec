import 'package:flutter/material.dart';
import 'package:myvinmec/data/model/icon_model.dart';
import 'package:myvinmec/data/model/item_model.dart';
import 'package:myvinmec/data/model/language.dart';
import 'package:myvinmec/screen/splass/widget/item_language.dart';

const String assetsSource = "assets/images/";

var languageData = [
  Language(
    flagUrl: "assets/images/vietnam.png",
    name: "Việt Nam"
  ),
  Language(
    flagUrl: "assets/images/english.png",
    name: "English"
  ),
];

var appbarActionData = [
  IconModel(name: "voucher", img: "assets/images/voucher.png", isSelect: true),
  IconModel(name: "search", img: "assets/images/search.png"),
];

var appbarBodyData = [
  IconModel(name: "Lịch hẹn", img: "assets/images/calendar.png"),
  IconModel(name: "Liên hệ", img: "assets/images/call.png"),
  IconModel(name: "Khai báo trước khám", img: "assets/images/edit.png"),
  IconModel(name: "Cộng đồng hỏi đáp", img: "assets/images/smart_phone.png"),
  IconModel(name: "Sổ tiêm", img: "assets/images/injection.png"),
  IconModel(name: "Cẩm nang mẹ", img: "assets/images/mother_child.png"),
  IconModel(name: "Tư vấn sức khỏe", img: "assets/images/video_message.png"),
  IconModel(name: "Đơn thuốc", img: "assets/images/drug.png", isSelect: true),
];

var appbarBodyFloatingData = [
  IconModel(name: "Lịch hẹn", img: "assets/images/calendar.png"),
  IconModel(name: "Liên hệ", img: "assets/images/call.png"),
  IconModel(name: "Cẩm nang mẹ", img: "assets/images/mother_child.png"),
  IconModel(name: "Sổ tiêm", img: "assets/images/injection.png"),
];

var bannerData = [
  "assets/images/banner1.png",
  "assets/images/banner2.png",
];

var newServiceData = [
  ItemModel(imgUrl: "https://gamek.mediacdn.vn/133514250583805952/2020/6/8/873302766563216418622655364023183338578077n-15915865604311972647945.jpg", title: "Cổng chăm soc khác hàng, 24/7", desc: "Nhanh - Tiện - Dễ dàng"),
  ItemModel(imgUrl: "https://cafefcdn.com/thumb_w/640/203337114487263232/2023/11/8/avatar1699432229620-169943222999868965308.jpg", title: "Đặt lịch nhanh - Xác nhận lịch từ động", desc: "Xem ngay lịch khám, giờ khám với bác sĩ Vinmec ở bất cứ đâu"),
];

var questionData = [
  IconModel(img: "assets/images/sperm.png", name: "Sàng lọc Sức khỏe sinh sản"),
  IconModel(img: "assets/images/brain.png", name: "Sàng lọc đột quy."),
  IconModel(img: "assets/images/lung.png", name: "Sàng lọc ảnh hưởng sau covid"),
];

var notifyData = [
  "Mua thước tại nhà tiện lợi cùng các tính năng mới trên ứng dụng MyVinmec",
  "Khai trường Phòng khám Đa khỏa Quốc tế Vinmec Dương Động tại Trung tâm đảo Phú Quốc",
  "Đối tác của Vinmec được vinh danh là bệnh viện tốt thứ 2 thế giới",
  "Vinmec chính thức gia nhập hệ thống liên kết toàn cầu của Cleveland Clinic (Mỹ)",
  "Hệ thống Y tế Vinmec thông báo lịch hoạt động trong Tết Âm lịch 2023",
  "Hai bệnh biên Vinmec đạt chuẩn ACC (Mỹ) về quản lý và điều trị suy tim",
];

var itemInfoData = [
  IconModel(img: "assets/images/save.png", name: "Gói dịch vụ"),
  IconModel(img: "assets/images/hospital.png", name: "Hoạt động bệnh viên"),
  IconModel(img: "assets/images/book.png", name: "Thông tin sức khỏe"),
  IconModel(img: "assets/images/vacsine.png", name: "Vắc xin"),
  IconModel(img: "assets/images/wring.png", name: "Trung tâm sàng lọc vú"),
  IconModel(img: "assets/images/pergnacy.png", name: "Sản phụ khoa và Hỗ trợ sinh đẻ"),
  IconModel(img: "assets/images/heart.png", name: "Tim mạch"),
  IconModel(img: "assets/images/child.png", name: "Nhi"),
  IconModel(img: "assets/images/virus.png", name: "Ung bước - Xạ trị"),
  IconModel(img: "assets/images/body.png", name: "Sức khỏe tổng quan"),
  IconModel(img: "assets/images/leg.png", name: "Cơ xương khớp"),
  IconModel(img: "assets/images/trust.png", name: "Viện nghiên cứu tế bào"),
];

var newData = [
  ItemModel(imgUrl: "https://cdn.luatvietnam.vn/uploaded/Images/Original/2021/11/18/mau-bao-cao-cong-viec_1811103638.jpg", title: "Báo cáo tự kiểm tra, đánh giá chất lượng bệnh viện năm 2023"),
  ItemModel(imgUrl: "https://uploads-ssl.webflow.com/602bfd3cc368c527f1c2a863/60c844afa62d003266774427_Screenshot-2021-03-26-at-13.37.png", title: "[Vinmec Time City] Mở hội thảo sinh hoạt chuyển để \"Thực trạng hồ hơ bệnh án nội trú\""),
  ItemModel(imgUrl: "https://tinybeans.com/wp-content/uploads/2022/04/creative-kids-lunches.jpg", title: "Hướng dẫn lựa chọn bộ dụng cụ ăn dặm an toàn cho bé"),
  ItemModel(imgUrl: "https://www.lumahealth.com/wp-content/uploads/2023/09/Chiang-Mai-hospitals.jpg", title: "Hospital charges at Vinmec"),
  ItemModel(imgUrl: "https://cdn.britannica.com/27/93827-050-A91D558F/Patient-dialysis-treatment.jpg", title: "Visiting hour and regulations at Vinmec"),
];
