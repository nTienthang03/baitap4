# baitap4
# Nguyễn Tiến Thắng K225480106058
# Bai Tập
 bai tap 4: (sql server)
yêu cầu bài toán:
 - Tạo csdl cho hệ thống TKB (đã nghe giảng, đã xem cách làm)
 - Nguồn dữ liệu: TMS.tnut.edu.vn
 - Tạo các bảng tuỳ ý (3nf)
 - Tạo được query truy vấn ra thông tin gồm 4 cột: họ tên gv, môn dạy, giờ vào lớp, giờ ra.
   trả lời câu hỏi: trong khoảng thời gian từ datetime1 tới datetime2 thì có những gv nào đang bận giảng dạy.

# Tạo Các bảng
Bảng GiangViên 
![image](https://github.com/user-attachments/assets/3b8c0723-b1bb-46c0-8fb0-ad7001f7d8b6)

BanglopHoc
![image](https://github.com/user-attachments/assets/38001440-5ca2-471e-a995-ba1443501989)

Bảng Monhoc
![image](https://github.com/user-attachments/assets/a15bc524-d97a-4ab5-98dc-55ddf1679fa8)

Bảng Phonghoc
![image](https://github.com/user-attachments/assets/99a9ff0a-3497-415f-b5a1-1309449d68e6)

bảng tiethoc
![image](https://github.com/user-attachments/assets/966576ac-6a73-482c-9623-a08ebe714d99)

bang TKB
![image](https://github.com/user-attachments/assets/e83624ed-3359-4aee-8742-ec2b1e91d87b)

Các khóa ngoại (FK) của bảng TKB
![image](https://github.com/user-attachments/assets/5ab72d6d-dfbd-4409-bc0a-ed997cb77f6d)



# Thêm Thông tin cho các bảng

Truy cập Tms.tnut để lấy dữ liệu
![image](https://github.com/user-attachments/assets/d346207a-3764-42ff-aad5-b43c7e606c74)

paste dữ liệu vào ex
![image](https://github.com/user-attachments/assets/05590103-eb74-4931-8404-41f4320d0eb8)

.Sao chép dữ liệu và paste vào các bảng
Bang GiangVien
![image](https://github.com/user-attachments/assets/72beb63f-bded-4fce-ba66-af1ebef584e1)

Bang Lophoc
![image](https://github.com/user-attachments/assets/dce942bd-b638-48df-81b7-fccd4080d677)

Bang MonHoc
![image](https://github.com/user-attachments/assets/323a9637-21ad-4a65-93ae-feba8830cf62)

BangPhongHoc

![image](https://github.com/user-attachments/assets/ae8289ec-0f33-485d-9c54-29bdb0f3a152)

Bang TietHoc
![image](https://github.com/user-attachments/assets/0623e27f-3ab9-4a6f-8baf-8d510debd8b5)

Bang TKb
![image](https://github.com/user-attachments/assets/51c638d4-43d5-417d-9c25-69d3dfc2a0d7)


# Lệnh Truy vấn

```DECLARE @StartTime TIME = '07:00';
DECLARE @EndTime TIME = '10:00';

SELECT 
    gv.HoTen,
    mh.TenMon,
    CONVERT(VARCHAR(5), th1.GioVao, 108) AS GioVao,  
    CONVERT(VARCHAR(5), th2.GioRa, 108) AS GioRa     
FROM TKB tkb
JOIN GiangVien gv ON tkb.MaGV = gv.MaGV
JOIN MonHoc mh ON tkb.MaMon = mh.MaMon
JOIN TietHoc th1 ON tkb.TietBD = th1.Tiet
JOIN TietHoc th2 ON tkb.TietBD + tkb.SoTiet - 1 = th2.Tiet
WHERE
    th1.GioVao < @EndTime AND th2.GioRa > @StartTime;
```
 Kết Quả Truy Vấn
 ![image](https://github.com/user-attachments/assets/cbfd0544-4389-4a45-b316-bd6d61f0b9db)

 






