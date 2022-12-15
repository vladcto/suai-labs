namespace Ars_Project
{
    public partial class Form1 : Form
    {
        Gadget gadget;

        public Form1()
        {
            InitializeComponent();
            groupBox1.Hide();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            var infos = gadget.GetInfo();
            string message = "";
            foreach (var pair in infos)
            {
                message += $"{pair.Key} - {pair.Value} \n";
            }
            MessageBox.Show(message, "Информация о гаджете");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            gadget.Call();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            gadget.TakeCall();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            var messanger = gadget as IMessanger;
            if (messanger != null)
            {
                messanger.SendMessage();
            }
            else
            {
                MessageBox.Show("Нет возможности отправить сообщение", "Ошибка");
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            var messanger = gadget as IMessanger;
            if (messanger != null)
            {
                messanger.TakeMessage();
            }
            else
            {
                MessageBox.Show("Нет возможности отправить сообщение", "Ошибка");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            groupBox1.Show();
            if (tabControl1.SelectedTab == tabPage1)
            {
                gadget = new MobilePhone(textBox1.Text, textBox2.Text, (uint)numericUpDown1.Value, (uint)numericUpDown2.Value);
            }
            else if (tabControl1.SelectedTab == tabPage2)
            {
                gadget = new ButtonPhone(textBox1.Text, textBox2.Text, textBox3.Text, checkBox1.Checked);
            }
            else if (tabControl1.SelectedTab == tabPage3)
            {
                gadget = new FitnessBracelet(textBox1.Text, textBox2.Text, checkBox2.Checked, checkBox3.Checked);
            }
            else
            {
                gadget = new FitnessClocks(textBox1.Text, textBox2.Text, textBox4.Text);
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            if(openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                pictureBox1.Image = Image.FromFile(openFileDialog1.FileName);
            }
        }
    }
}