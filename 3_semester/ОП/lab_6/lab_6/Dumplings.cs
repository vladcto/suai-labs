using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab_6
{
    internal class Dumplings : Food
    {
        readonly int count;

        public Dumplings(int energy, int weight, int count) : base(energy, weight)
        {
            this.count = count;
        }

        public override void ShowInfo()
        {
            MessageBox.Show($"{count} damplings?! Why so few??", "CRUTO");
        }

    }
}
