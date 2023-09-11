using DACS.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DACS.DAO
{
    class HoaDonDAO
    {
        database db = new database();
        public List<HoaDonTheoBan> LayHoaDonTheoBan(int idchuong)
        {
            List<HoaDonTheoBan> hd = new List<HoaDonTheoBan>();
            string query = "select hd.idhoadon, m.ten, m.dongia, ct.soluong, (m.dongia * ct.soluong) as tongtien from hoadon hd, chitiethoadon ct , pet m where hd. idhoadon = ct.idhoadon and ct.idpet = m.idpet and trangthai = N'Chưa thanh toán' and hd.IDHOADON = " + idchuong;
            DataTable dt = db.Execute(query);
            foreach (DataRow item in dt.Rows)
            {
                HoaDonTheoBan hdb = new HoaDonTheoBan(item);
                hd.Add(hdb);
            }
            return hd;
        }
        public int layMaHoaDon(int idChuong)
        {
            string query = "select idhoadon from hoadon where trangthai= N'Chưa thanh toán' and idchuong = " + idChuong;
            DataTable dt = db.Execute(query);
            if (dt.Rows.Count > 0)
            {
                idHoaDon id = new idHoaDon(dt.Rows[0]);
                return id.ID;
            }
            return -1;
        }
        public int idMax()
        {
            try
            {
               return  (int)db.ExecuteScalar("select max(idhoadon) from hoadon");
            }
            catch { return 1; }
        }
        // xóa món trong hóa đơn
        public void XoaMonTheoID(int idpet)
        {
            db.Execute("delete chitiethoadon where idpet = " + idpet);
        }
        // bàn trống  ==> thêm hóa đơn == > gọi món
        public void TaoHoaDonMoi(int idChuong)
        {
            string query = string.Format("INSERT INTO HOADON(NGAYLAP, IDCHUONG VALUES(GETDATE(), {0})", idChuong);
            int result = db.ExecuteNonQuery(query);
        }
        public void thanhToan(int mahoadon)
        {
            string query = "update hoadon set TRANGTHAI = N'Đã thanh toán' where idhoadon = " + mahoadon;
            db.ExecuteNonQuery(query);
        }
        public DataTable ThongKe()
        {
            string query = "exec thongke";
            DataTable dt = db.Execute(query);
            return dt;
        }
        public DataTable ThongKeChuaTT()
        {
            string query = "exec thongke_ChuaThanhToan";
            DataTable dt = db.Execute(query);
            return dt;
        }
        public DataTable ThongKeDaTT()
        {
            string query = "exec thongke_DaThanhToan";
            DataTable dt = db.Execute(query);
            return dt;
        }
        public DataTable Tke_ChiTiet(int maHoaDon)
        {
            string query = "exec xemchitiet " + maHoaDon;
            DataTable dt = db.Execute(query);
            return dt;
        }
        public int kiemtra(int maHoaDon)
        {
            string query = string.Format("select * from hoadon where idhoadon = {0}", maHoaDon);
            DataTable dt = db.Execute(query);
            if (dt.Rows.Count > 0)
            {
                return 1;
            }
            return -1;
        }
        public int tongTien(int maHoaDon)
        {
            try
            {
                return (int)db.ExecuteScalar("exec tongtien " + maHoaDon);
            }
            catch { return 1; }
        }
        public void coNg_Trong(int idchuong)
        {
            string query = "update ban set trangthai = N'Trống' where idchuong = " + idchuong;
            db.ExecuteNonQuery(query);
        }
        public void trong_CoNg(int idchuong)
        {
            string query = "update ban set trangthai = N'Có người đặt' where idchuong = " + idchuong;
            db.ExecuteNonQuery(query);
        }
    }
}
