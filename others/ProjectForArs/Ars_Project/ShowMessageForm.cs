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
    public partial class ShowMessageForm : Form
    {
        public ShowMessageForm(IMessanger messanger)
        {
            InitializeComponent();
            var messages = messanger.MessageSource;
            messages.Add(new() { sender = "Собеседник", 
                text =  messanger.MessagesTemplates[
                    new Random().Next(0, messanger.MessagesTemplates.Count)
                    ]});
            listBox1.DataSource = messages;
            listBox1.DisplayMember = nameof(messanger.ToString);
        }
    }
}
