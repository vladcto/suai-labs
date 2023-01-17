namespace AirplanesLib
{
    public class Filters<T>: AbstractFilters<T> {
        internal event Action? FiltersAppliedEvent;

        public override void Apply() => FiltersAppliedEvent?.Invoke();
    }

    public abstract class AbstractFilters<T>: IFilterCall<T>
    {
        readonly List<Func<T, bool>> filters = new();

        public abstract void Apply();

        public void Add(Func<T, bool> predicate) => filters.Add(predicate);
        public void Clear() => filters.Clear();

        internal IList<T> ApplyTo(IEnumerable<T> filtered)
        {
            foreach (var filter in filters)
                filtered = filtered.Where(filter);
            return filtered.ToList();
        }
    }

    public interface IFilterCall<T>
    {   
        public void Add(Func<T, bool> predicate);
        public void Clear();
        public void Apply();
    }
}
