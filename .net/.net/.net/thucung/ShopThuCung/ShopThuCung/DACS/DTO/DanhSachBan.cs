using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DACS.DTO
{
    class DanhSachBan
    {
        public DanhSachBan(int id, string name, string status)
        {
            this.ID = id;
            this.Name = name;
            this.Status = status;
        }
        public DanhSachBan(DataRow row)
        {
            this.ID = (int)row["IDCHUONG"];
            this.Name = row["TENCHUONG"].ToString();
            this.Status = row["TRANGTHAI"].ToString();
        }
        private int iD;

        public int ID
        {
            get { return iD; }
            set { iD = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string status;

        public string Status
        {
            get { return status; }
            set { status = value; }
        }

       
    }
}
