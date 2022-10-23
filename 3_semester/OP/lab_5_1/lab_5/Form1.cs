using System;
using System.Windows.Forms;

namespace lab_5
{
    public partial class Form1 : Form
    {
        Audiotrack nowTrack;
        
        public Form1()
        {
            InitializeComponent();
        }

        private void writeToFileBtn_Click(object sender, EventArgs e)
        {
            nowTrack.WriteToFile(saveFileDialog1);
        }

        private void writePathBtn_Click(object sender, EventArgs e)
        {
            nowTrack.WriteToFile(pathTextBox.Text);
        }

        private void CreateTrackFromInterface(object sender, EventArgs e)
        {
            string name = nameTextBox.Text;
            string lyrics = lyricsTextBox.Text;
            DateTime date = releaseTimePicker.Value;
            nowTrack = new Audiotrack(name, lyrics, date);
            UpdateResultBox();
        }

        private void readFileBtn_Click(object sender, EventArgs e)
        {
            nowTrack = Audiotrack.ReadFromFile(openFileDialog1);
            UpdateResultBox();
        }

        private void readPathBtn_Click(object sender, EventArgs e)
        {
            nowTrack = Audiotrack.ReadFromFile(pathTextBox.Text);
            UpdateResultBox();
        }

        private void UpdateResultBox()
        {
            resultBox.Text = nowTrack.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DoSmth(ref nowTrack.name);
        }

        private void DoSmth(ref string name, string appendTxt = "!")
        {
            name += appendTxt;
            UpdateResultBox();
        }
    }
}
