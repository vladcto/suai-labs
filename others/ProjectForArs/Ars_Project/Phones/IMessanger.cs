using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ars_Project
{
    public interface IMessanger
    {
        public List<Message> MessageSource { get; set; }
        public List<String> MessagesTemplates { get; }
        public void SendMessage();
        public void TakeMessage();
    }

    public struct Message
    {
        public string sender;
        public string text;

        public override string? ToString()
        {
            return $"{sender} : {text}";
        }
    }
}
