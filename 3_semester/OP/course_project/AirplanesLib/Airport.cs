namespace AirplanesLib
{
    public interface SimpleList<T>
    {
        public event Action? ListUpdatedIvent;

        public int Count();
        public void Add(T item);
        public void Remove(T item);
    }

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

    public class Filters<T>
    {
        internal event Action? FiltersAppliedEvent;

        readonly List<Func<T, bool>> filters = new();

        public void Add(Func<T, bool> predicate) => filters.Add(predicate);
        public void Clear() => filters.Clear();
        public void Apply() => FiltersAppliedEvent?.Invoke();

        internal IList<T> ApplyTo(IEnumerable<T> filtered)
        {
            foreach (var filter in filters)
                filtered = filtered.Where(filter);
            return filtered.ToList();
        }
    }
}
