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
            UpdateAirportListBox();
            airportListBox.DisplayMember = nameof(Airplane.FlightNumber);
            airportListBox.SelectedIndexChanged += 
                (sender, e) => DisplayAirplane((Airplane) airportListBox.SelectedItem);
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
            UpdateAirportListBox();
        }

        private void RemovePlane(object sender, EventArgs e)
        {
            if(airportListBox.SelectedIndex == -1)
            {
                MessageBox.Show("Нечего удалять.", "Ошибка удаления!", 
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            airport.RemoveAt(airportListBox.SelectedIndex);
            UpdateAirportListBox();
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
            var toShow = airport.AsEnumerable();
            if (filterDateCheckBox.Checked)
            {
                toShow = toShow.Where((e) => timeFilterInput.Value <= e.DepartuteTime);
            }
            if (filterDestinationCheckBox.Checked)
            {
                toShow = toShow.Where((e) => e.Destination == destinationFilterInp.Text);
            }
            airportListBox.DataSource = new BindingList<Airplane>(toShow.ToList());
            airportListBox.Refresh();
        }

        private void ChangedFilters(object sender, EventArgs e)
        {
            UpdateAirportListBox();
        }
    }
}