using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace lab_3
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string lunchName = textBox1.Text;
            ComboLunch lunch;
            if(int.TryParse(textBox2.Text,out int cost))
            {
                lunch = new ComboLunch(lunchName, cost);
            }
            else
            {
                lunch = new ComboLunch(lunchName);
            }
            lunch.LunchName += "!";
            ShowLunch(lunch);
        }

        public void ShowLunch(ComboLunch lunch)
        {
            label3.Text = lunch.LunchName;
            label4.Text = lunch.Cost.ToString();
        }
    }
}
