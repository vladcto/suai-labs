using AirplanesLib;
using System.ComponentModel;

namespace course_project
{
    public partial class MainForm : Form
    {
        Airport airport = new();

        public MainForm()
        {
            InitializeComponent();
            airportListBox.DisplayMember = nameof(Airplane.FlightNumber);
            airportListBox.SelectedIndexChanged += 
                (sender, e) => DisplayAirplane((Airplane) airportListBox.SelectedItem);
            airport.ListUpdatedIvent += () =>
            {
                airportListBox.DataSource = airport.FilteredPlanes;
                airportListBox.Refresh();
            };
        }

        private void AddPlane(object sender, EventArgs e)
        {
            Airplane.Builder builder = new();
            builder.SetFlightNumber(flightNumberInput.Text);
            builder.SetCompany(companyInput.Text);
            builder.SetDestination(destinationInp.Text);
            builder.SetFlightCost((int)flightCostInp.Value);
            builder.SetDepartureTime(departureInput.Value);
            airport.Add(builder.Build());
        }

        private void RemovePlane(object sender, EventArgs e)
        {
            if(airportListBox.SelectedIndex == -1)
            {
                MessageBox.Show("Нечего удалять.", "Ошибка удаления!", 
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            airport.Remove((Airplane)airportListBox.SelectedItem);
        }

        private void DisplayAirplane(Airplane airplane)
        {
            companyNameLabel.Text = airplane.CompanyName;
            flightNumberLabel.Text = airplane.FlightNumber;
            flightCostLabel.Text = airplane.FlightCost.ToString();
            departureTimeLabel.Text = airplane.DepartuteTime.ToLongDateString();
            destinationLabel.Text = airplane.Destination;
        }

        private void UpdateAirportListBox()
        {
            airport.Filters.Clear();
            if (filterDateCheckBox.Checked)
                airport.Filters.Add((e) => timeFilterInput.Value <= e.DepartuteTime);
            if (filterDestinationCheckBox.Checked)
                airport.Filters.Add((e) => e.Destination == destinationFilterInp.Text);
            airport.Filters.Apply();
        }

        private void ChangedFilters(object sender, EventArgs e)
        {
            UpdateAirportListBox();
        }
    }
}