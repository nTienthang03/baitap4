DECLARE @StartTime TIME = '07:00';
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
