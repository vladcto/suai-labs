using System;
using System.Drawing;
using System.Windows.Forms;

public class Shawarma
{
    public string Name { get; }
    public int Cost { get; }
    public DateTime InventionTime { get; }
    public bool LimitedEdition { get; }
    public string ImagePath { get; set; }

    public Shawarma(string name, bool limitedEdition, DateTime inventionTime, int cost)
    {
        this.Name = name;
        this.LimitedEdition = limitedEdition;
        this.InventionTime = inventionTime;
        this.Cost = cost;
    }

    public void ShowImageIn(PictureBox box)
    {
        box.Image = Image.FromFile(ImagePath);
    }

    public void ShowImageIn(Form form)
    {
        form.BackgroundImage = Image.FromFile(ImagePath);
    }
}

