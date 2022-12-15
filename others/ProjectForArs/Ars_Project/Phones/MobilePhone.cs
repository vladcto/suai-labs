using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ars_Project
{
    internal class MobilePhone : Gadget, IMessanger
    {
        List<Message> messages = new();
        uint simsCount;
        uint memoryCapacity;

        public MobilePhone(string name, string model, uint simsCount, uint memoryCapacity) : base(name, model)
        {
            this.simsCount = simsCount;
            this.memoryCapacity = memoryCapacity;
        }


        public List<string> MessagesTemplates => new() { "Вы отчислены", "Ты смотрел списки на отчисление?" };

        public List<Message> MessageSource
        {
            get => messages;
            set => messages = value;
        }

        protected override string GadgetType => "Мобильный Телефон";

        public override Dictionary<string, string> GetInfo()
        {
            return new()
            {
                ["Модель"] = this.model,
                ["Название"] = this.name,
                ["Количество симок"] = this.simsCount.ToString(),
                ["Обьем памяти"] = this.memoryCapacity.ToString()
            };
        }

        public void SendMessage()
        {
            var form = new MessageForm(this);
            form.SetSendLabel("Отправить по интернету");
            form.Show();
        }

        public void TakeMessage()
        {
            var form = new ShowMessageForm(this);
            form.Show();
        }
    }
}
