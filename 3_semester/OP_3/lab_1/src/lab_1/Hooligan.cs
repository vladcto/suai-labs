using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab_1
{
    public class Hooligan
    {
        public enum Gender
        {
            male,
            female,
            censored
        }

        public string name;
        public int age;
        public int strength;
        readonly public Gender gender;

        public Hooligan(string name, int age, int strength, Gender gender)
        {
            this.name = name;
            this.age = age;
            this.strength = strength;
            this.gender = gender;
        }

        public override string ToString()
        {
            return $"name = {name} \n " +
                $"age = {age} \n"+
                $"sila = {strength} \n" +
                $"gender = {gender} .";
        }
    }
}
