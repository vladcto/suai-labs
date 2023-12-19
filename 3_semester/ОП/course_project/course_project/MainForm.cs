using AirplanesLib;

namespace CourseProject
{
    public partial class MainForm : Form
    {
        Airport airport = new();

        public MainForm()
        {
            InitializeComponent();
            airportListBox.DisplayMember = nameof(Airplane.FlightNumber);
            airportListBox.SelectedIndexChanged +=
                (sender, e) => DisplayAirplane((Airplane)airportListBox.SelectedItem);
            airport.ListUpdatedEvent += () =>
            {
                airportListBox.DataSource = airport.FilteredPlanes;
                airportListBox.Refresh();
            };
        }

        static void ValidateAction(Action validateOperation, Control errorLabel)
        {
            errorLabel.Hide();
            try
            {
                validateOperation();
            }
            catch (ArgumentException) { errorLabel.Show(); };
        }

        private void AddPlane(object sender, EventArgs e)
        {
            Airplane.Builder builder = new();
            ValidateAction(
                () => builder.SetFlightNumber(flightNumberInput.Text), flightNumberError);
            ValidateAction(
                () => builder.SetDestination(destinationInp.Text), destinationError);
            builder.SetCompany(companyInput.Text);
            builder.SetFlightCost((int)flightCostInp.Value);
            builder.SetDepartureTime(departureInput.Value);
            try
            {
                airport.Add(builder.Build());
            }
            catch (ArgumentException) { };

        }

        private void RemovePlane(object sender, EventArgs e)
        {
            if (airportListBox.SelectedIndex == -1)
            {
                MessageBox.Show("Нечего удалять.", "Ошибка удаления!",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            airport.Remove((Airplane)airportListBox.SelectedItem);
        }

        private void DisplayAirplane(Airplane airplane)
        {
            companyNameLabel.Text = $"Компания: {airplane.CompanyName}";
            flightNumberLabel.Text = $"Международный код: {airplane.FlightNumber}";
            flightCostLabel.Text = $"Стоимость пролета: {airplane.FlightCost} рупий.";
            departureTimeLabel.Text = $"Дата вылета: {airplane.DepartuteTime.ToLongDateString()}";
            destinationLabel.Text = $"Пункт назначения: {airplane.Destination}";
        }

        private void ChangedFilters(object sender, EventArgs e)
        {
            airport.Filters.Clear();
            if (flightNumberCheck.Checked)
                airport.Filters.Add((e) => e.FlightNumber == flightNumberFilter.Text);
            if (filterDateCheckBox.Checked)
                airport.Filters.Add((e) => timeFilterInput.Value <= e.DepartuteTime);
            if (filterDestinationCheckBox.Checked)
                airport.Filters.Add((e) => e.Destination == destinationFilterInp.Text);
            airport.Filters.Apply();
        }

        private void FlightNumberChanged(object sender, EventArgs e)
        {
            ValidateAction(() =>
                new Airplane.Builder().SetFlightNumber(flightNumberInput.Text),
                flightNumberError);
        }

        private void DestinationChanged(object sender, EventArgs e)
        {
            ValidateAction(() =>
                new Airplane.Builder().SetDestination(destinationInp.Text),
                destinationError);
        }
    }
}