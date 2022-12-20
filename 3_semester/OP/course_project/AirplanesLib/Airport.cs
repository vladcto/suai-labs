namespace AirplanesLib
{
    public class Airport : SimpleList<Airplane>
    {
        public event Action? ListUpdatedIvent;

        private List<Airplane> airplanes = new();

        public Airport()
        {
            Filters.FiltersAppliedEvent +=
                () => this.ListUpdatedIvent?.Invoke();
        }

        public Filters<Airplane> Filters { get; init; } = new();

        public IList<Airplane> FilteredPlanes { get => Filters.ApplyTo(airplanes); }

        public int Count() => airplanes.Count;

        public void Add(Airplane item)
        {
            airplanes.Add(item);
            ListUpdatedIvent?.Invoke();
        }

        public void Remove(Airplane item)
        {
            airplanes.Remove(item);
            ListUpdatedIvent?.Invoke();
        }
    }
}
