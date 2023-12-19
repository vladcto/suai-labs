using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab_7
{
    internal class InternetShop
    {
        readonly string item;

        public InternetShop(string item)
        {
            this.item = item;
        }

        public virtual string Rating { get => "4.97 / 5"; }

        public virtual string BuyItem() => item;

        public sealed override string ToString()
        {
            return $"{nameof(InternetShop)} продает {item}";
        }
    }
}
