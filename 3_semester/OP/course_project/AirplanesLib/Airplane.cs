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
            private string _flightNumber = "Любительская авиация";
            private string? _destination = null;
            private DateTime? _departureTime = null;
            private string? _company = null;
            private float? _flightCost = null;

            public Builder SetFlightNumber(string inp) { _flightNumber = inp; return this; }
            public Builder SetDestination(string inp) { _destination = inp; return this; }
            public Builder SetDepartureTime(DateTime inp)
            {
                _departureTime = inp;
                return this;
            }
            public Builder SetCompany(string inp) { _company = inp; return this; }
            public Builder SetFlightCost(float inp) { _flightCost = inp; return this; }

            public Airplane Build()
            {
                if (_destination == null ||
                    _departureTime == null || _company == null || _flightCost == null)
                {
                    throw new Exception();
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