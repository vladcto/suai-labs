namespace lab_6
{
    public abstract class Food
    {
        readonly protected int energy;
        readonly protected int weight;

        protected Food(int energy, int weight)
        {
            this.energy = energy;
            this.weight = weight;
        }

        public int Eat() => energy * weight;

        public abstract void ShowInfo();
    }
}
