namespace AirplanesLib
{
    public interface ISimpleList<T>
    {
        public event Action? ListUpdatedEvent;

        public int Count { get; }

        public void Add(T item);
        public void Remove(T item);
    }
}
