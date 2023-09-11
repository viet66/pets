using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DACS.DAO
{
    class DanhMucDAO
    {
        database db = new database();
        public DataTable Danhmuc()
        {
            string query = "select madanhmuc, tendanhmuc from danhmuc";
            DataTable dt = db.Execute(query);
            return dt;
        
        }
    }
}
