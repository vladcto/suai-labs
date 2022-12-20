namespace AirplanesLib
{
    public class Airplane
    {
        public string FlightNumber { get; init; }
        public string Destination { get; init; }
        public DateTime DepartuteTime { get; init; }
        public string CompanyName { get; init; }
        public float FlightCost { get; init; }

        private Airplane(string flightNumber, string destination, DateTime departuteTime, string companyName, float flightCost)
        {
            FlightNumber = flightNumber;
            Destination = destination;
            DepartuteTime = departuteTime;
            CompanyName = companyName;
            FlightCost = flightCost;
        }

        public class Builder
        {
            private string? _flightNumber;
            private string? _destination = null;
            private DateTime? _departureTime = null;
            private string? _company = null;
            private float? _flightCost = null;

            public Builder SetFlightNumber(string inp)
            {
                if (inp.Trim().Length < 3 || inp.Trim().Length > 8)
                {
                    _flightNumber = null;
                    throw new ArgumentException();
                }
                _flightNumber = inp.Trim();
                return this;
            }

            public Builder SetDestination(string inp)
            {
                if (inp.Trim() == "")
                {
                    _destination = null;
                    throw new ArgumentException();
                }
                _destination = inp.Trim();
                return this;
            }

            public Builder SetDepartureTime(DateTime inp)
            {
                _departureTime = inp;
                return this;
            }

            public Builder SetCompany(string inp)
            {
                _company = inp.Trim();
                return this;
            }

            public Builder SetFlightCost(float inp)
            {
                if (inp < 0)
                {
                    _flightCost = null;
                    throw new ArgumentException();
                }
                _flightCost = inp;
                return this;
            }

            public Airplane Build()
            {
                if (_destination == null || _flightNumber == null ||
                    _departureTime == null || _company == null || _flightCost == null)
                {
                    throw new ArgumentException();
                }
                return new Airplane(_flightNumber,
                    _destination,
                    (DateTime)_departureTime,
                    _company,
                    (float)_flightCost);
            }
        }
    }

}