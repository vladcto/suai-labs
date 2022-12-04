using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace AirplanesLib
{
    public class Airport : List<Airplane>
    {
        public Airport() { }

        private static bool DestinationCompare(Airplane a1, string destination)
            => a1.Destination == destination;
        private static bool DepartureTimeCompare(Airplane a1, DateTime time)
            => a1.DepartuteTime > time;

        public Airplane FindFlightNumber(string flightNumber)
        {
            return this.First((e) => e.FlightNumber == flightNumber);
        }

        public IEnumerable FindBy(string destination)
        {
            return this.Where((e) => DestinationCompare(e, destination));
        }

        public IEnumerable FindBy(DateTime dateTime)
        {
            return this.Where((e) => DepartureTimeCompare(e, dateTime));
        }

        public IEnumerable FindBy(string destination, DateTime dateTime)
        {
            return this.Where((e) => DestinationCompare(e, destination))
                .Where((e) => DepartureTimeCompare(e, dateTime));
        }
    }
}
