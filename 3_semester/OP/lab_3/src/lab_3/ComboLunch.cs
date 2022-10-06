using System;
using System.Collections.Generic;
using System.Text;

namespace lab_3
{
    public class ComboLunch
    {
        string _lunchName;
        public int Cost { get; private set; } = 99999;

        public string LunchName
        {
            get => _lunchName;
            set
            {
                string lunchName = value;
                _lunchName = char.ToUpper(value[0]) + value[1..];
            }
        }

        public ComboLunch(string lunchName, int cost)
        {
            LunchName = lunchName;
            Cost = cost;
        }

        public ComboLunch(string lunchName)
        {
            LunchName = lunchName;
        }
    }
}
