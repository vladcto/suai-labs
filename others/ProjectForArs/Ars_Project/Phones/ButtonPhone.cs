using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ars_Project
{
    internal class ButtonPhone : Gadget, IMessanger
    {
        List<Message> messages = new ();
        string buttonsRegion;
        bool clamshell;

        public ButtonPhone(string name, string model, string buttonsRegion, bool clamshell) : base(name, model)
        {
            this.buttonsRegion = buttonsRegion;
            this.clamshell = clamshell;
        }

        public List<Message> MessageSource {
            get => messages;
            set => messages = value;
        }

        public List<string> MessagesTemplates => new() { "Привет, внучок", "Здравия желаю" };

        protected override string GadgetType => "Кнопочный телефон";

        public override Dictionary<string, string> GetInfo()
        {
            return new()
            {
                ["Модель"] = model,
                ["Название"] = name,
                ["Раскладка"] = buttonsRegion,
                ["Раскладной"] = clamshell ? "Да" : "Нет"
            };
        }

        public void SendMessage()
        {
            var form = new MessageForm(this);
            form.SetSendLabel("Отправить по ИК-порту");
            form.Show();
        }

        public void TakeMessage()
        {
            var form = new ShowMessageForm(this);
            form.Show();
        }
    }
}
