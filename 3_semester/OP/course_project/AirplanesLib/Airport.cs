namespace AirplanesLib
{
    public class Airport : ISimpleList<Airplane>
    {
        public event Action? ListUpdatedEvent;

        private List<Airplane> airplanes = new();

        public Airport()
        {
            Filters.FiltersAppliedEvent +=
                () => this.ListUpdatedEvent?.Invoke();
        }

        public Filters<Airplane> Filters { get; init; } = new();

        public IList<Airplane> FilteredPlanes { get => Filters.ApplyTo(airplanes); }

        public int Count => airplanes.Count;

        public void Add(Airplane item)
        {
            airplanes.Add(item);
            ListUpdatedEvent?.Invoke();
        }

        public void Remove(Airplane item)
        {
            airplanes.Remove(item);
            ListUpdatedEvent?.Invoke();
        }
    }
}
