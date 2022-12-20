using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AirplanesLib
{
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
