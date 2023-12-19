using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Windows.Forms;

namespace lab_5
{
    public partial class Form1 : Form
    {
        readonly IList<Shawarma> shawarmas = new BindingList<Shawarma>();

        public Form1()
        {
            InitializeComponent();
            listBox1.DataSource = shawarmas;
            listBox1.DisplayMember = nameof(Shawarma.Name);
            textBox1.DataBindings.Add(nameof(textBox1.Text), shawarmas, nameof(Shawarma.Name));
            checkBox1.DataBindings.Add(nameof(checkBox1.Checked),
                shawarmas, nameof(Shawarma.LimitedEdition));
            dateTimePicker1.DataBindings.Add(nameof(dateTimePicker1.Value),
                shawarmas, nameof(Shawarma.InventionTime));
            numericUpDown1.DataBindings.Add(nameof(numericUpDown1.Value),
                shawarmas, nameof(Shawarma.Cost));
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string name = textBox1.Text;
            bool isSpecial = checkBox1.Checked;
            DateTime date = dateTimePicker1.Value;
            int cost = (int) numericUpDown1.Value;
            shawarmas.Add(new Shawarma(name, isSpecial, date, cost));
            listBox1.Update();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if(openFileDialog1.ShowDialog() != DialogResult.Cancel)
            {
                (listBox1.SelectedItem as Shawarma).ImagePath = openFileDialog1.FileName;
                (listBox1.SelectedItem as Shawarma).ShowImageIn(pictureBox1);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog() != DialogResult.Cancel)
            {
                (listBox1.SelectedItem as Shawarma).ImagePath = openFileDialog1.FileName;
                (listBox1.SelectedItem as Shawarma).ShowImageIn(ActiveForm);
            }
        }
    }
}
