using System;
using System.Collections.Generic;
using System.Text;

namespace lab_2
{
    public class FatePrediction
    {
        static readonly int year;
        readonly int moneySpend;
        readonly string showedCardTaro;

        static FatePrediction()
        {
            year = DateTime.Now.Year;
        }

        public FatePrediction(int moneySpend, string showedCardTaro)
        {
            this.moneySpend = moneySpend;
            this.showedCardTaro = showedCardTaro;
        }

        public FatePrediction(int moneySpend)
            : this(moneySpend, "debit")
        { 
        }

        public FatePrediction() : this(0, "exit_card") { }

        public string GetFor(Person person)
        {
            return $"Уважаемый {person.firstName} {person.lastName}, спасибо, что потратили {moneySpend} у.е. в {year} г.\n" +
                $"Я нагадал вам {showedCardTaro}." +
                $"А это значит, что вас ждет {(moneySpend > 0 ? "успех" : "допсессия")}";
        }
    }
}