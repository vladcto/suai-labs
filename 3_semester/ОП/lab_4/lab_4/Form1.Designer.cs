
namespace lab_5
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.nameTextBox = new System.Windows.Forms.TextBox();
            this.lyricsTextBox = new System.Windows.Forms.TextBox();
            this.releaseTimePicker = new System.Windows.Forms.DateTimePicker();
            this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.writePathBtn = new System.Windows.Forms.Button();
            this.writeToFileBtn = new System.Windows.Forms.Button();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.readPathBtn = new System.Windows.Forms.Button();
            this.readFileBtn = new System.Windows.Forms.Button();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.button1 = new System.Windows.Forms.Button();
            this.resultBox = new System.Windows.Forms.RichTextBox();
            this.pathTextBox = new System.Windows.Forms.TextBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabPage3.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // nameTextBox
            // 
            this.nameTextBox.Location = new System.Drawing.Point(48, 50);
            this.nameTextBox.Name = "nameTextBox";
            this.nameTextBox.Size = new System.Drawing.Size(145, 23);
            this.nameTextBox.TabIndex = 0;
            this.nameTextBox.TextChanged += new System.EventHandler(this.CreateTrackFromInterface);
            // 
            // lyricsTextBox
            // 
            this.lyricsTextBox.Location = new System.Drawing.Point(48, 107);
            this.lyricsTextBox.Name = "lyricsTextBox";
            this.lyricsTextBox.Size = new System.Drawing.Size(145, 23);
            this.lyricsTextBox.TabIndex = 1;
            this.lyricsTextBox.TextChanged += new System.EventHandler(this.CreateTrackFromInterface);
            // 
            // releaseTimePicker
            // 
            this.releaseTimePicker.Location = new System.Drawing.Point(48, 173);
            this.releaseTimePicker.Name = "releaseTimePicker";
            this.releaseTimePicker.Size = new System.Drawing.Size(145, 23);
            this.releaseTimePicker.TabIndex = 2;
            this.releaseTimePicker.ValueChanged += new System.EventHandler(this.CreateTrackFromInterface);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.lyricsTextBox);
            this.groupBox1.Controls.Add(this.releaseTimePicker);
            this.groupBox1.Controls.Add(this.nameTextBox);
            this.groupBox1.Location = new System.Drawing.Point(22, 26);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(239, 234);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Информация о треке";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(48, 152);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(81, 15);
            this.label4.TabIndex = 5;
            this.label4.Text = "Дата выпуска";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(48, 86);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(36, 15);
            this.label3.TabIndex = 4;
            this.label3.Text = "Текст";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(48, 32);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(59, 15);
            this.label2.TabIndex = 3;
            this.label2.Text = "Название";
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tabPage3);
            this.tabControl1.Location = new System.Drawing.Point(33, 31);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(297, 162);
            this.tabControl1.TabIndex = 5;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.writePathBtn);
            this.tabPage1.Controls.Add(this.writeToFileBtn);
            this.tabPage1.Location = new System.Drawing.Point(4, 24);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(289, 134);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Запись";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // writePathBtn
            // 
            this.writePathBtn.Location = new System.Drawing.Point(156, 17);
            this.writePathBtn.Name = "writePathBtn";
            this.writePathBtn.Size = new System.Drawing.Size(100, 92);
            this.writePathBtn.TabIndex = 1;
            this.writePathBtn.Text = "Записать по пути";
            this.writePathBtn.UseVisualStyleBackColor = true;
            this.writePathBtn.Click += new System.EventHandler(this.writePathBtn_Click);
            // 
            // writeToFileBtn
            // 
            this.writeToFileBtn.Location = new System.Drawing.Point(26, 17);
            this.writeToFileBtn.Name = "writeToFileBtn";
            this.writeToFileBtn.Size = new System.Drawing.Size(101, 92);
            this.writeToFileBtn.TabIndex = 0;
            this.writeToFileBtn.Text = "Записать в файл";
            this.writeToFileBtn.UseVisualStyleBackColor = true;
            this.writeToFileBtn.Click += new System.EventHandler(this.writeToFileBtn_Click);
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.readPathBtn);
            this.tabPage2.Controls.Add(this.readFileBtn);
            this.tabPage2.Location = new System.Drawing.Point(4, 24);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(289, 134);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Чтение";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // readPathBtn
            // 
            this.readPathBtn.Location = new System.Drawing.Point(157, 19);
            this.readPathBtn.Name = "readPathBtn";
            this.readPathBtn.Size = new System.Drawing.Size(99, 94);
            this.readPathBtn.TabIndex = 1;
            this.readPathBtn.Text = "Прочитать по пути";
            this.readPathBtn.UseVisualStyleBackColor = true;
            this.readPathBtn.Click += new System.EventHandler(this.readPathBtn_Click);
            // 
            // readFileBtn
            // 
            this.readFileBtn.Location = new System.Drawing.Point(26, 19);
            this.readFileBtn.Name = "readFileBtn";
            this.readFileBtn.Size = new System.Drawing.Size(101, 94);
            this.readFileBtn.TabIndex = 0;
            this.readFileBtn.Text = "Прочитать файл";
            this.readFileBtn.UseVisualStyleBackColor = true;
            this.readFileBtn.Click += new System.EventHandler(this.readFileBtn_Click);
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.button1);
            this.tabPage3.Location = new System.Drawing.Point(4, 24);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Size = new System.Drawing.Size(289, 134);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "Тест аргументов";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(35, 20);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(219, 94);
            this.button1.TabIndex = 0;
            this.button1.Text = "Тест";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // resultBox
            // 
            this.resultBox.Location = new System.Drawing.Point(309, 26);
            this.resultBox.Name = "resultBox";
            this.resultBox.ReadOnly = true;
            this.resultBox.Size = new System.Drawing.Size(235, 234);
            this.resultBox.TabIndex = 6;
            this.resultBox.Text = "";
            // 
            // pathTextBox
            // 
            this.pathTextBox.Location = new System.Drawing.Point(98, 210);
            this.pathTextBox.Name = "pathTextBox";
            this.pathTextBox.Size = new System.Drawing.Size(248, 23);
            this.pathTextBox.TabIndex = 7;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label1);
            this.groupBox2.Controls.Add(this.tabControl1);
            this.groupBox2.Controls.Add(this.pathTextBox);
            this.groupBox2.Location = new System.Drawing.Point(101, 279);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(367, 251);
            this.groupBox2.TabIndex = 8;
            this.groupBox2.TabStop = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(21, 213);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(71, 15);
            this.label1.TabIndex = 8;
            this.label1.Text = "Путь файла";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(567, 551);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.resultBox);
            this.Controls.Add(this.groupBox1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage2.ResumeLayout(false);
            this.tabPage3.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.TextBox nameTextBox;
        private System.Windows.Forms.TextBox lyricsTextBox;
        private System.Windows.Forms.DateTimePicker releaseTimePicker;
        private System.Windows.Forms.SaveFileDialog saveFileDialog1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.Button writePathBtn;
        private System.Windows.Forms.Button writeToFileBtn;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Button readPathBtn;
        private System.Windows.Forms.Button readFileBtn;
        private System.Windows.Forms.RichTextBox resultBox;
        private System.Windows.Forms.TextBox pathTextBox;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
    }
}

