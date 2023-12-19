using System;
using System.Collections.Generic;
using System.Text;

namespace StrengthDisplay
{
    public static class StrengthDisplayer
    {
        public const string NEWTON_TEXT = "н.";

        public static string InNewton(in float strength)
        {
            return strength.ToString() + " " + NEWTON_TEXT;
        }
    }
}