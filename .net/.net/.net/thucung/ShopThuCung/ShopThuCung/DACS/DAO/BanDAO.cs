using DACS.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DACS.DAO
{
    class BanDAO
    {
        database db = new database();
        //Lấy danh sách bàn
        public List<DanhSachBan> loadDSB()
        {
            List<DanhSachBan> table = new List<DanhSachBan>();
            string query = "select * from chuong";
            DataTable data = db.Execute(query);
            foreach (DataRow item in data.Rows)
            {
                DanhSachBan dsb = new DanhSachBan(item);
                table.Add(dsb);
            }
            return table;
        }
        public bool datBan(int idChuong)
        {
            string query = "update chuong set trangthai = N'Đã đặt' where idchuong = " + idChuong;
            int result = db.ExecuteNonQuery(query);
            return result > 0;
        }
        public bool huyDat(int idChuong)
        {
            string query = "update chuong set trangthai = N'Trống' where idchuong = " + idChuong;
            int result = db.ExecuteNonQuery(query);
            return result > 0;
        }
    }
}
