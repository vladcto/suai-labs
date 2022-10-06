using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using StrengthDisplay;

namespace lab_1
{
    public partial class MainForm : Form
    {

        public MainForm()
        {
            InitializeComponent();
            Hooligan hooligan = new Hooligan("Kostya",
                18,
                0,
                Hooligan.Gender.male);
            SetupHooligan(hooligan);
        }

        protected void SetupHooligan(Hooligan hooligan)
        {
            this.label5.Text = hooligan.name;
            this.label6.Text = hooligan.age.ToString();
            this.label7.Text = StrengthDisplayer.InNewton(hooligan.strength);
            this.label8.Text = hooligan.gender.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string name = this.nameTextBox.Text;
            int age = int.Parse(this.ageTextBox.Text);
            int strength = int.Parse(this.strengthTextBox.Text);
            var gender = (string)genderBox.SelectedItem switch
            {
                "male" => Hooligan.Gender.male,
                "female" => Hooligan.Gender.female,
                "censored" => Hooligan.Gender.censored,
                _ => Hooligan.Gender.male,
            };
            Hooligan hooligan = new Hooligan(name,age,strength,gender);
            SetupHooligan(hooligan);
        }
    }
}
