namespace AirplanesLib
{
    public interface SimpleList<T>
    {
        public event Action? ListUpdatedIvent;

        public int Count();
        public void Add(T item);
        public void Remove(T item);
    }
}
