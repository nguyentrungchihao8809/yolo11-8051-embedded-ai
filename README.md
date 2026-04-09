# AI-Powered Security System (YOLO11 & 8051 Integration)

# Hệ thống Giám sát An ninh Thông minh tích hợp AI (8051-Based Edge AI)

[![Model: YOLO11](https://img.shields.io/badge/Model-YOLO11n-orange.svg)](https://ultralytics.com/)
[![Platform: 8051](https://img.shields.io/badge/Platform-AT89C51-blue.svg)](https://en.wikipedia.org/wiki/Intel_MCS-51)
[![Tools: Python & Proteus](https://img.shields.io/badge/Tools-Python%20%7C%20Proteus-green.svg)](#)

## Giới thiệu đề tài
Dự án triển khai hệ thống giám sát an ninh thông minh kết hợp giữa **Trí tuệ nhân tạo (Computer Vision)** và **Hệ thống nhúng truyền thống**. Thay vì sử dụng cảm biến PIR thông thường dễ gây báo động giả, hệ thống sử dụng mô hình **YOLO11** (SOTA 2026) để nhận diện người thời gian thực, ra quyết định và truyền lệnh điều khiển xuống vi điều khiển **AT89C51** qua giao thức UART.

## Tính năng chính
- **AI-Driven Detection:** Nhận diện đối tượng (Person) với độ chính xác cao bằng mô hình YOLO11n tối ưu hóa cho CPU.
- **Real-time Processing:** Tốc độ xử lý hình ảnh nhanh, đảm bảo phản hồi tức thì khi có xâm nhập.
- **Decision Logic:** Tự động lọc nhiễu và chỉ kích hoạt báo động khi độ tin cậy (Confidence) đạt ngưỡng thiết lập.
- **High-Low Linkage:** Giao tiếp UART 9600 bps ổn định giữa môi trường Python (High-level) và 8051 (Low-level).
- **Physical Response:** Điều khiển còi báo động (Buzzer) và hệ thống đèn LED chỉ thị trạng thái thông qua Transistor đệm dòng.

## Danh sách linh kiện (Proteus)
| Linh kiện | Keyword | Vai trò |
| :--- | :--- | :--- |
| **MCU** | `AT89C51` | Tiếp nhận lệnh UART và điều khiển ngoại vi |
| **Interface** | `COMPIM` | Cổng COM ảo kết nối AI Engine với Proteus |
| **Driver** | `2N2222` | Transistor NPN đóng vai trò công tắc điện tử |
| **Alert** | `BUZZER` | Phát âm thanh cảnh báo khi phát hiện người |
| **Visual** | `LED-RED` | Đèn báo động trực quan trạng thái xâm nhập |
| **Timing** | `CRYSTAL` | Thạch anh 11.0592MHz (Tối ưu cho baudrate UART) |

## Cài đặt Cổng COM ảo (Virtual Serial Port)
Để kết nối Python và Proteus trên cùng một máy tính, bạn cần tạo một cặp cổng COM ảo:
1. Sử dụng phần mềm **VSPD (Virtual Serial Port Driver)** hoặc **com0com**.
2. Tạo một cặp cổng mới (Ví dụ: **COM1** và **COM2**).
3. Trong **Proteus (COMPIM):** Chọn `Physical Port` là `COM1`, Baudrate `9600`.
4. Trong **Python Code:** Cấu hình Serial port là `COM2`, Baudrate `9600`.

## Quy trình vận hành (Execution Guide)

### Bước 1: Chuẩn bị Firmware
- Biên dịch code (C/Assembly) bằng **Keil C51** để lấy file `.hex`.
- Nạp file `.hex` vào vi điều khiển AT89C51 trong Proteus.

### Bước 2: Khởi chạy hệ thống
1. **Chạy Proteus:** Nhấn nút **Play** để bắt đầu mô phỏng và mở cổng lắng nghe từ COMPIM.
2. **Cài đặt thư viện Python:**
   ```bash
   pip install ultralytics pyserial opencv-python

### Bước 3: Chạy code Python
   ```bash
   python main.py
