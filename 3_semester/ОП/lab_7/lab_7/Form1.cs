namespace lab_7
{
    public partial class Form1 : Form
    {
        readonly InternetShop shop = new("Knife");
        readonly MyShop scamShop = new MyShop("Knife");

        public Form1()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
           richTextBox1.Text = shop.Rating;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            richTextBox1.Text = scamShop.Rating;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            richTextBox1.Text = shop.BuyItem();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            richTextBox1.Text = scamShop.BuyItem();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            richTextBox1.Text =shop.ToString();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            richTextBox1.Text =scamShop.ToString();
        }
    }
}