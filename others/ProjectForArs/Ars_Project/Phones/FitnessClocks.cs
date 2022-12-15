using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ars_Project
{
    internal class FitnessClocks : Gadget
    {
        string covering;

        public FitnessClocks(string name, string model, string covering) : base(name, model)
        {
            this.covering = covering;
        }

        protected override string GadgetType => "Фитнес-часы";

        public override Dictionary<string, string> GetInfo()
        {
            return new()
            {
                ["Модель"] = model,
                ["Название"] = name,
                ["Покрытие"] = covering
            };
        }
    }
}
