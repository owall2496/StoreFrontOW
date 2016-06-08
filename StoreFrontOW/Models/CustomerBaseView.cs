using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StoreFrontOW.Models
{
    public class CustomerBaseView
    {
        private int UID = 0;
        
        public int GetUID()
        {
            return UID;
        }

        public void SetUID(int id)
        {
            UID = id;
        }

        private string UNAME = string.Empty;

        public string GetUNAME()
        {
            return UNAME;
        }

        public void SetUNAME(string name)
        {
            UNAME = name;
        }
    }

    public class CustomerManagerWithAccessorMethods
    {
        public static void Main()
        {
            CustomerBaseView cust = new CustomerBaseView();

            cust.SetUID(1);
            //cust.SetUNAME(Session);

        }
    }

}