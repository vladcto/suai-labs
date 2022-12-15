namespace Ars_Project
{
    public abstract class Gadget: ICallable
    {
        protected string name;
        protected string model;

        protected Gadget(string name, string model)
        {
            this.name = name;
            this.model = model;
        }

        public void Call() {
            var form = new CallForm(this);
            form.Show();
        }
        public void TakeCall()
        {
            var form = new TakeCallForm(this);
            form.Show();
        }

        protected abstract string GadgetType { get; }
        public abstract Dictionary<String, String> GetInfo();

        public override string? ToString()
        {
            return $"{GadgetType} {name} : {model}";
        }
    }
}