using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ars_Project
{
    internal class FitnessBracelet : Gadget
    {
        bool sports;
        bool bloodAirSensor;

        public FitnessBracelet(string name, string model, bool sports, bool bloodAirSensor) : base(name, model)
        {
            this.sports = sports;
            this.bloodAirSensor = bloodAirSensor;
        }

        protected override string GadgetType => "Фитнес браслет";

        public override Dictionary<string, string> GetInfo()
        {
            return new()
            {
                ["Модель"] = model,
                ["Название"] = name,
                ["Спортивный"] = sports ? "Да" : "Нет",
                ["Датчик воздуха в крови"] = bloodAirSensor? "Присутствует" : "Отсутствует"
            };
        }
    }
}
