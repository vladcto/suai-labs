using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab_7
{
    internal class MyShop : InternetShop
    {
        public MyShop(string item) : base(item) {}

        public override string Rating => base.Rating + "!!!!!!!!!!";
        public override string BuyItem()
        {
            return "Для получения покупки, киньте 5 рублей на телефон +7(***)-***-**-**";
        }
        new public string ToString()
        {
            return base.ToString() + "Даю зуб, офиц. сайт!!";
        }
    }
}
