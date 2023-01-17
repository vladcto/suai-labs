namespace AirplanesLib
{
    public class Airport : ISimpleList<Airplane>
    {
        public event Action? ListUpdatedEvent;

        private List<Airplane> airplanes = new();
        private Filters<Airplane> filters = new Filters<Airplane>();

        public Airport()
        {
            filters.FiltersAppliedEvent +=
                () => this.ListUpdatedEvent?.Invoke();
        }

        public IFilterCall<Airplane> Filters { get => filters; }

        public IList<Airplane> FilteredPlanes { get => filters.ApplyTo(airplanes); }

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
