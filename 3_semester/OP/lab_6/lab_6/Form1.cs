using System.CodeDom.Compiler;

namespace lab_6
{
    public partial class Form1 : Form
    {
        Food? food;

        public Form1()
        {
            InitializeComponent();
        }

        //—читываем бургер
        private void button1_Click(object sender, EventArgs e)
        {
            int energy = int.Parse(textBox1.Text);
            int weight = int.Parse(textBox2.Text);
            string name = textBox3.Text;
            food = new Burger(energy, weight, name);
        }

        //—читываем пельмень
        private void button2_Click(object sender, EventArgs e)
        {
            int energy = int.Parse(textBox1.Text);
            int weight = int.Parse(textBox2.Text);
            int count = int.Parse(textBox3.Text);
            food = new Dumplings(energy, weight, count);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (food is Burger burger)
                burger.ShowInfo();
            else 
                ShowUserMistake();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (food is Dumplings dumplings)
                dumplings.ShowInfo();
            else
                ShowUserMistake();
        }

        private void ShowUserMistake()
        {
            MessageBox.Show("—оболезную, это так не работает");
        }

        private void button5_Click(object sender, EventArgs e)
        {
            MessageBox.Show($"—ьеденно {food!.Eat()}");
        }

    }
}