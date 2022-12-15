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
    public partial class TakeCallForm : Form
    {
        public TakeCallForm(Gadget gadget)
        {
            InitializeComponent();
            if (gadget is MobilePhone)
            {
                label1.Text = "Вам позвонили на телефон";
            }
            else if (gadget is ButtonPhone)
            {
                label1.Text = "Вам позвонили на кнопочочный телефон";
            }
            else if (gadget is FitnessBracelet)
            {
                label1.Text = "Вам позвонили на фитнес-браслет";
            }
            else
            {
                label1.Text = "Вам позвонили на фитнес-часы";
            }
        }
    }
}
