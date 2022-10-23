using System;
using System.IO;
using System.Windows.Forms;

class Audiotrack
{
    public string name;
    public string lyrics;
    DateTime releaseDate;

    public Audiotrack(string name, string lirycs, DateTime solds)
    {
        this.name = name;
        this.lyrics = lirycs;
        this.releaseDate = solds;
    }

    public void WriteToFile(SaveFileDialog dialog)
    {
        if (dialog.ShowDialog() == DialogResult.Cancel)
            return;
        WriteToFile(dialog.FileName);
    }

    public void WriteToFile(string path)
    {
        using StreamWriter writer = new StreamWriter(path);
        writer.WriteLine($"{name}|{lyrics}|{releaseDate.Ticks}");
    }

    public static Audiotrack ReadFromFile(OpenFileDialog dialog)
    {
        if (dialog.ShowDialog() == DialogResult.Cancel)
            return null;
        return ReadFromFile(dialog.FileName);
    }

    public static Audiotrack ReadFromFile(string path)
    {
        using StreamReader reader = new StreamReader(path);
        var texts = reader.ReadLine().Split('|');
        return new Audiotrack(texts[0], texts[1], new DateTime(long.Parse(texts[2])));
    }

    public override string ToString()
    {
        return $"{name}\n{lyrics}\n{releaseDate.ToShortDateString()}";
    }
}
