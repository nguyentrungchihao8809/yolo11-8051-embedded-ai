# 🛡️ AI-Powered Security System (YOLO11 & 8051 Integration)

# Hệ thống Giám sát An ninh Thông minh tích hợp AI (8051-Based Edge AI)

[![Model: YOLO11](https://img.shields.io/badge/Model-YOLO11n-orange.svg)](https://ultralytics.com/)
[![Platform: 8051](https://img.shields.io/badge/Platform-AT89C51-blue.svg)](https://en.wikipedia.org/wiki/Intel_MCS-51)
[![Tools: Python & Proteus](https://img.shields.io/badge/Tools-Python%20%7C%20Proteus-green.svg)](#)

## 📝 Giới thiệu đề tài
Dự án triển khai hệ thống giám sát an ninh thông minh kết hợp giữa **Trí tuệ nhân tạo (Computer Vision)** và **Hệ thống nhúng truyền thống**. Thay vì sử dụng cảm biến PIR thông thường dễ gây báo động giả, hệ thống sử dụng mô hình **YOLO11** (SOTA 2026) để nhận diện người thời gian thực, ra quyết định và truyền lệnh điều khiển xuống vi điều khiển **AT89C51** qua giao thức UART.

## ✨ Tính năng chính
- **AI-Driven Detection:** Nhận diện đối tượng (Person) với độ chính xác cao bằng mô hình YOLO11n tối ưu hóa cho CPU.
- **Real-time Processing:** Tốc độ xử lý hình ảnh nhanh, đảm bảo phản hồi tức thì khi có xâm nhập.
- **Decision Logic:** Tự động lọc nhiễu và chỉ kích hoạt báo động khi độ tin cậy (Confidence) đạt ngưỡng thiết lập.
- **High-Low Linkage:** Giao tiếp UART 9600 bps ổn định giữa môi trường Python (High-level) và 8051 (Low-level).
- **Physical Response:** Điều khiển còi báo động (Buzzer) và hệ thống đèn LED chỉ thị trạng thái thông qua Transistor đệm dòng.

## 🛠 Danh sách linh kiện (Proteus)
| Linh kiện | Keyword | Vai trò |
| :--- | :--- | :--- |
| **MCU** | `AT89C51` | Tiếp nhận lệnh UART và điều khiển ngoại vi |
| **Interface** | `COMPIM` | Cổng COM ảo kết nối AI Engine với Proteus |
| **Driver** | `2N2222` | Transistor NPN đóng vai trò công tắc điện tử |
| **Alert** | `BUZZER` | Phát âm thanh cảnh báo khi phát hiện người |
| **Visual** | `LED-RED` | Đèn báo động trực quan trạng thái xâm nhập |
| **Timing** | `CRYSTAL` | Thạch anh 11.0592MHz (Tối ưu cho baudrate UART) |

## 📂 Cấu trúc thư mục
```text
/
├── AI_Engine/        # Mã nguồn Python (YOLO11, Serial Interface)
├── Firmware/         # Mã nguồn Assembly/C cho 8051 và file .hex
├── Simulation/       # File mô phỏng Proteus (.pdsprj)
├── Docs/             # Lưu đồ thuật toán, sơ đồ kết nối chân
└── Media/            # Hình ảnh sơ đồ mạch và video demo
