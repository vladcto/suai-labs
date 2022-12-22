namespace CourseProject
{
    partial class MainForm
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.flightCostLabel = new System.Windows.Forms.Label();
            this.companyNameLabel = new System.Windows.Forms.Label();
            this.departureTimeLabel = new System.Windows.Forms.Label();
            this.destinationLabel = new System.Windows.Forms.Label();
            this.flightNumberLabel = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.flightNumberFilter = new System.Windows.Forms.TextBox();
            this.timeFilterInput = new System.Windows.Forms.DateTimePicker();
            this.destinationFilterInp = new System.Windows.Forms.TextBox();
            this.filterDateCheckBox = new System.Windows.Forms.CheckBox();
            this.filterDestinationCheckBox = new System.Windows.Forms.CheckBox();
            this.flightNumberCheck = new System.Windows.Forms.CheckBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.departureInput = new System.Windows.Forms.DateTimePicker();
            this.flightCostInp = new System.Windows.Forms.NumericUpDown();
            this.destinationError = new System.Windows.Forms.Label();
            this.destinationInp = new System.Windows.Forms.TextBox();
            this.companyInput = new System.Windows.Forms.TextBox();
            this.flightNumberError = new System.Windows.Forms.Label();
            this.flightNumberInput = new System.Windows.Forms.TextBox();
            this.addBtn = new System.Windows.Forms.Button();
            this.removeBtn = new System.Windows.Forms.Button();
            this.airportListBox = new System.Windows.Forms.ListBox();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.flightCostInp)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.flightCostLabel);
            this.groupBox1.Controls.Add(this.companyNameLabel);
            this.groupBox1.Controls.Add(this.departureTimeLabel);
            this.groupBox1.Controls.Add(this.destinationLabel);
            this.groupBox1.Controls.Add(this.flightNumberLabel);
            this.groupBox1.Location = new System.Drawing.Point(462, 81);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(445, 220);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Информаця о самолете";
            // 
            // flightCostLabel
            // 
            this.flightCostLabel.AutoSize = true;
            this.flightCostLabel.Location = new System.Drawing.Point(26, 148);
            this.flightCostLabel.Name = "flightCostLabel";
            this.flightCostLabel.Size = new System.Drawing.Size(12, 15);
            this.flightCostLabel.TabIndex = 4;
            this.flightCostLabel.Text = "-";
            // 
            // companyNameLabel
            // 
            this.companyNameLabel.AutoSize = true;
            this.companyNameLabel.Location = new System.Drawing.Point(26, 185);
            this.companyNameLabel.Name = "companyNameLabel";
            this.companyNameLabel.Size = new System.Drawing.Size(12, 15);
            this.companyNameLabel.TabIndex = 3;
            this.companyNameLabel.Text = "-";
            // 
            // departureTimeLabel
            // 
            this.departureTimeLabel.AutoSize = true;
            this.departureTimeLabel.Location = new System.Drawing.Point(26, 116);
            this.departureTimeLabel.Name = "departureTimeLabel";
            this.departureTimeLabel.Size = new System.Drawing.Size(12, 15);
            this.departureTimeLabel.TabIndex = 2;
            this.departureTimeLabel.Text = "-";
            // 
            // destinationLabel
            // 
            this.destinationLabel.AutoSize = true;
            this.destinationLabel.Location = new System.Drawing.Point(26, 77);
            this.destinationLabel.Name = "destinationLabel";
            this.destinationLabel.Size = new System.Drawing.Size(12, 15);
            this.destinationLabel.TabIndex = 1;
            this.destinationLabel.Text = "-";
            // 
            // flightNumberLabel
            // 
            this.flightNumberLabel.AutoSize = true;
            this.flightNumberLabel.Location = new System.Drawing.Point(26, 38);
            this.flightNumberLabel.Name = "flightNumberLabel";
            this.flightNumberLabel.Size = new System.Drawing.Size(12, 15);
            this.flightNumberLabel.TabIndex = 0;
            this.flightNumberLabel.Text = "-";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.flightNumberFilter);
            this.groupBox2.Controls.Add(this.timeFilterInput);
            this.groupBox2.Controls.Add(this.destinationFilterInp);
            this.groupBox2.Controls.Add(this.filterDateCheckBox);
            this.groupBox2.Controls.Add(this.filterDestinationCheckBox);
            this.groupBox2.Controls.Add(this.flightNumberCheck);
            this.groupBox2.Location = new System.Drawing.Point(32, 416);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(386, 172);
            this.groupBox2.TabIndex = 3;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Фильтры";
            // 
            // flightNumberFilter
            // 
            this.flightNumberFilter.Location = new System.Drawing.Point(128, 42);
            this.flightNumberFilter.Name = "flightNumberFilter";
            this.flightNumberFilter.Size = new System.Drawing.Size(231, 23);
            this.flightNumberFilter.TabIndex = 5;
            this.flightNumberFilter.Leave += new System.EventHandler(this.ChangedFilters);
            // 
            // timeFilterInput
            // 
            this.timeFilterInput.Location = new System.Drawing.Point(128, 123);
            this.timeFilterInput.Name = "timeFilterInput";
            this.timeFilterInput.Size = new System.Drawing.Size(231, 23);
            this.timeFilterInput.TabIndex = 4;
            this.timeFilterInput.ValueChanged += new System.EventHandler(this.ChangedFilters);
            this.timeFilterInput.Leave += new System.EventHandler(this.ChangedFilters);
            // 
            // destinationFilterInp
            // 
            this.destinationFilterInp.Location = new System.Drawing.Point(128, 92);
            this.destinationFilterInp.Name = "destinationFilterInp";
            this.destinationFilterInp.Size = new System.Drawing.Size(231, 23);
            this.destinationFilterInp.TabIndex = 3;
            this.destinationFilterInp.Leave += new System.EventHandler(this.ChangedFilters);
            // 
            // filterDateCheckBox
            // 
            this.filterDateCheckBox.AutoSize = true;
            this.filterDateCheckBox.Location = new System.Drawing.Point(20, 127);
            this.filterDateCheckBox.Name = "filterDateCheckBox";
            this.filterDateCheckBox.Size = new System.Drawing.Size(114, 19);
            this.filterDateCheckBox.TabIndex = 2;
            this.filterDateCheckBox.Text = "Время вылета >";
            this.filterDateCheckBox.UseVisualStyleBackColor = true;
            this.filterDateCheckBox.CheckedChanged += new System.EventHandler(this.ChangedFilters);
            // 
            // filterDestinationCheckBox
            // 
            this.filterDestinationCheckBox.AutoSize = true;
            this.filterDestinationCheckBox.Location = new System.Drawing.Point(20, 96);
            this.filterDestinationCheckBox.Name = "filterDestinationCheckBox";
            this.filterDestinationCheckBox.Size = new System.Drawing.Size(98, 19);
            this.filterDestinationCheckBox.TabIndex = 1;
            this.filterDestinationCheckBox.Text = "Назначение: ";
            this.filterDestinationCheckBox.UseVisualStyleBackColor = true;
            this.filterDestinationCheckBox.CheckedChanged += new System.EventHandler(this.ChangedFilters);
            // 
            // flightNumberCheck
            // 
            this.flightNumberCheck.AutoSize = true;
            this.flightNumberCheck.Location = new System.Drawing.Point(20, 44);
            this.flightNumberCheck.Name = "flightNumberCheck";
            this.flightNumberCheck.Size = new System.Drawing.Size(106, 19);
            this.flightNumberCheck.TabIndex = 0;
            this.flightNumberCheck.Text = "Поиск по коду";
            this.flightNumberCheck.UseVisualStyleBackColor = true;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.label5);
            this.groupBox3.Controls.Add(this.label4);
            this.groupBox3.Controls.Add(this.label1);
            this.groupBox3.Controls.Add(this.label3);
            this.groupBox3.Controls.Add(this.label2);
            this.groupBox3.Controls.Add(this.departureInput);
            this.groupBox3.Controls.Add(this.flightCostInp);
            this.groupBox3.Controls.Add(this.destinationError);
            this.groupBox3.Controls.Add(this.destinationInp);
            this.groupBox3.Controls.Add(this.companyInput);
            this.groupBox3.Controls.Add(this.flightNumberError);
            this.groupBox3.Controls.Add(this.flightNumberInput);
            this.groupBox3.Location = new System.Drawing.Point(462, 326);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(442, 214);
            this.groupBox3.TabIndex = 4;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Ввод нового самолета";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(244, 28);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(73, 15);
            this.label5.TabIndex = 15;
            this.label5.Text = "Назначение";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(23, 30);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(123, 15);
            this.label4.TabIndex = 14;
            this.label4.Text = "Международный код";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(26, 104);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(63, 15);
            this.label1.TabIndex = 13;
            this.label1.Text = "Компания";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(71, 176);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(84, 15);
            this.label3.TabIndex = 12;
            this.label3.Text = "Время вылета";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(244, 104);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(118, 15);
            this.label2.TabIndex = 11;
            this.label2.Text = "Стоимость в рупиях";
            // 
            // departureInput
            // 
            this.departureInput.Location = new System.Drawing.Point(161, 170);
            this.departureInput.Name = "departureInput";
            this.departureInput.Size = new System.Drawing.Size(209, 23);
            this.departureInput.TabIndex = 10;
            // 
            // flightCostInp
            // 
            this.flightCostInp.Increment = new decimal(new int[] {
            100,
            0,
            0,
            0});
            this.flightCostInp.Location = new System.Drawing.Point(244, 122);
            this.flightCostInp.Maximum = new decimal(new int[] {
            100000,
            0,
            0,
            0});
            this.flightCostInp.Name = "flightCostInp";
            this.flightCostInp.Size = new System.Drawing.Size(173, 23);
            this.flightCostInp.TabIndex = 8;
            // 
            // destinationError
            // 
            this.destinationError.AutoSize = true;
            this.destinationError.ForeColor = System.Drawing.Color.Red;
            this.destinationError.Location = new System.Drawing.Point(244, 74);
            this.destinationError.Name = "destinationError";
            this.destinationError.Size = new System.Drawing.Size(113, 15);
            this.destinationError.TabIndex = 7;
            this.destinationError.Text = "Пустое назначение";
            this.destinationError.Visible = false;
            // 
            // destinationInp
            // 
            this.destinationInp.Location = new System.Drawing.Point(244, 48);
            this.destinationInp.Name = "destinationInp";
            this.destinationInp.PlaceholderText = "Назначение";
            this.destinationInp.Size = new System.Drawing.Size(173, 23);
            this.destinationInp.TabIndex = 6;
            this.destinationInp.TextChanged += new System.EventHandler(this.DestinationChanged);
            // 
            // companyInput
            // 
            this.companyInput.Location = new System.Drawing.Point(23, 122);
            this.companyInput.Name = "companyInput";
            this.companyInput.PlaceholderText = "Компания";
            this.companyInput.Size = new System.Drawing.Size(209, 23);
            this.companyInput.TabIndex = 3;
            // 
            // flightNumberError
            // 
            this.flightNumberError.AutoSize = true;
            this.flightNumberError.ForeColor = System.Drawing.Color.Red;
            this.flightNumberError.Location = new System.Drawing.Point(26, 74);
            this.flightNumberError.Name = "flightNumberError";
            this.flightNumberError.Size = new System.Drawing.Size(138, 15);
            this.flightNumberError.TabIndex = 2;
            this.flightNumberError.Text = "Неверный формат кода";
            this.flightNumberError.Visible = false;
            // 
            // flightNumberInput
            // 
            this.flightNumberInput.Location = new System.Drawing.Point(23, 48);
            this.flightNumberInput.Name = "flightNumberInput";
            this.flightNumberInput.PlaceholderText = "Международный код";
            this.flightNumberInput.Size = new System.Drawing.Size(209, 23);
            this.flightNumberInput.TabIndex = 1;
            this.flightNumberInput.TextChanged += new System.EventHandler(this.FlightNumberChanged);
            // 
            // addBtn
            // 
            this.addBtn.Location = new System.Drawing.Point(217, 354);
            this.addBtn.Name = "addBtn";
            this.addBtn.Size = new System.Drawing.Size(201, 49);
            this.addBtn.TabIndex = 5;
            this.addBtn.Text = "Добавить";
            this.addBtn.UseVisualStyleBackColor = true;
            this.addBtn.Click += new System.EventHandler(this.AddPlane);
            // 
            // removeBtn
            // 
            this.removeBtn.Location = new System.Drawing.Point(32, 354);
            this.removeBtn.Name = "removeBtn";
            this.removeBtn.Size = new System.Drawing.Size(187, 49);
            this.removeBtn.TabIndex = 6;
            this.removeBtn.Text = "Удалить";
            this.removeBtn.UseVisualStyleBackColor = true;
            this.removeBtn.Click += new System.EventHandler(this.RemovePlane);
            // 
            // airportListBox
            // 
            this.airportListBox.FormattingEnabled = true;
            this.airportListBox.ItemHeight = 15;
            this.airportListBox.Location = new System.Drawing.Point(32, 55);
            this.airportListBox.Name = "airportListBox";
            this.airportListBox.Size = new System.Drawing.Size(386, 304);
            this.airportListBox.TabIndex = 7;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(933, 622);
            this.Controls.Add(this.removeBtn);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.addBtn);
            this.Controls.Add(this.airportListBox);
            this.Name = "MainForm";
            this.Text = "ИС Аэропорта";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.flightCostInp)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private GroupBox groupBox1;
        private Label flightCostLabel;
        private Label companyNameLabel;
        private Label departureTimeLabel;
        private Label destinationLabel;
        private Label flightNumberLabel;
        private GroupBox groupBox2;
        private CheckBox filterDateCheckBox;
        private CheckBox filterDestinationCheckBox;
        private CheckBox flightNumberCheck;
        private GroupBox groupBox3;
        private TextBox companyInput;
        private Label flightNumberError;
        private TextBox flightNumberInput;
        private DateTimePicker timeFilterInput;
        private TextBox destinationFilterInp;
        private DateTimePicker departureInput;
        private NumericUpDown flightCostInp;
        private Label destinationError;
        private TextBox destinationInp;
        private Button addBtn;
        private Button removeBtn;
        private TextBox flightNumberFilter;
        private ListBox airportListBox;
        private Label label2;
        private Label label3;
        private Label label1;
        private Label label5;
        private Label label4;
    }
}