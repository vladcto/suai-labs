using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab_6
{
    internal class Burger : Food
    {
        string name;

        public Burger(int energy, int weight, string name) : base(energy, weight)
        {
            this.name = name;
        }

        public override void ShowInfo()
        {
            MessageBox.Show($"WOW, it's burger {name}","OMAGAD");
        }
    }
}
