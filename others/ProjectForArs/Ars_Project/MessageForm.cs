using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ars_Project
{
    public partial class MessageForm : Form
    {
        List<Message> messages;

        public MessageForm(IMessanger messanger)
        {
            InitializeComponent();
            messages = messanger.MessageSource;
            listBox1.DataSource = messages;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            messages.Add(new() { sender = "Я", text = textBox1.Text });
            listBox1.DataSource = null;
            listBox1.DataSource = messages;
        }

        public void SetSendLabel(string label)
        {
            button1.Text = label;
        }
    }
}
