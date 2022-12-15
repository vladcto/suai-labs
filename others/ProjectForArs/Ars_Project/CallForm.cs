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
    public partial class CallForm : Form
    {
        public CallForm(Gadget gadget)
        {
            InitializeComponent();
            if (gadget is MobilePhone)
            {
                label1.Text = "Вы позвонили по модному сотовому телефону";
            }
            else if (gadget is ButtonPhone)
            {
                label1.Text = "Вы позвонили по древнему кнопочному телефону";
            }
            else if (gadget is FitnessBracelet)
            {
                label1.Text = "Вы позвонили с фитнес-браслета";
            }
            else
            {
                label1.Text = "Вы позвонили с фитнес-часов";
            }
        }
    }
}
