using System;
using System.Windows.Forms;

namespace lab_2
{
    public partial class Form1 : Form
    {
        FatePrediction _myPrediction;
        Person _myPerson;

        public Form1()
        {
            InitializeComponent();
        }

        private void ShowPrediction()
        {
            MessageBox.Show(_myPrediction.GetFor(_myPerson));
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //Считываем данные, введеные пользователем.
            _myPerson = new Person() { firstName = textBox1.Text, lastName = textBox2.Text };
            if (int.TryParse(textBox3.Text, out int moneySpend))
            {
                if (textBox4.Text.Trim().Length == 0)
                {
                    _myPrediction = new FatePrediction(moneySpend);
                }
                else
                {
                    _myPrediction = new FatePrediction(moneySpend, textBox4.Text);
                }
            }
            else
            {
                _myPrediction = new FatePrediction();
            }

            ShowPrediction();
        }
    }
}
