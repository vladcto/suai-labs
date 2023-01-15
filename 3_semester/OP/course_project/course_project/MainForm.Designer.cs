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
            this.groupBox1.Location = new System.Drawing.Point(528, 108);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.groupBox1.Size = new System.Drawing.Size(509, 293);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Информаця о самолете";
            // 
            // flightCostLabel
            // 
            this.flightCostLabel.AutoSize = true;
            this.flightCostLabel.Location = new System.Drawing.Point(30, 197);
            this.flightCostLabel.Name = "flightCostLabel";
            this.flightCostLabel.Size = new System.Drawing.Size(15, 20);
            this.flightCostLabel.TabIndex = 4;
            this.flightCostLabel.Text = "-";
            // 
            // companyNameLabel
            // 
            this.companyNameLabel.AutoSize = true;
            this.companyNameLabel.Location = new System.Drawing.Point(30, 247);
            this.companyNameLabel.Name = "companyNameLabel";
            this.companyNameLabel.Size = new System.Drawing.Size(15, 20);
            this.companyNameLabel.TabIndex = 3;
            this.companyNameLabel.Text = "-";
            // 
            // departureTimeLabel
            // 
            this.departureTimeLabel.AutoSize = true;
            this.departureTimeLabel.Location = new System.Drawing.Point(30, 155);
            this.departureTimeLabel.Name = "departureTimeLabel";
            this.departureTimeLabel.Size = new System.Drawing.Size(15, 20);
            this.departureTimeLabel.TabIndex = 2;
            this.departureTimeLabel.Text = "-";
            // 
            // destinationLabel
            // 
            this.destinationLabel.AutoSize = true;
            this.destinationLabel.Location = new System.Drawing.Point(30, 103);
            this.destinationLabel.Name = "destinationLabel";
            this.destinationLabel.Size = new System.Drawing.Size(15, 20);
            this.destinationLabel.TabIndex = 1;
            this.destinationLabel.Text = "-";
            // 
            // flightNumberLabel
            // 
            this.flightNumberLabel.AutoSize = true;
            this.flightNumberLabel.Location = new System.Drawing.Point(30, 51);
            this.flightNumberLabel.Name = "flightNumberLabel";
            this.flightNumberLabel.Size = new System.Drawing.Size(15, 20);
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
            this.groupBox2.Location = new System.Drawing.Point(37, 555);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.groupBox2.Size = new System.Drawing.Size(441, 229);
            this.groupBox2.TabIndex = 3;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Фильтры";
            // 
            // flightNumberFilter
            // 
            this.flightNumberFilter.Location = new System.Drawing.Point(146, 56);
            this.flightNumberFilter.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.flightNumberFilter.Name = "flightNumberFilter";
            this.flightNumberFilter.Size = new System.Drawing.Size(263, 27);
            this.flightNumberFilter.TabIndex = 5;
            this.flightNumberFilter.Leave += new System.EventHandler(this.ChangedFilters);
            // 
            // timeFilterInput
            // 
            this.timeFilterInput.Location = new System.Drawing.Point(146, 164);
            this.timeFilterInput.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.timeFilterInput.Name = "timeFilterInput";
            this.timeFilterInput.Size = new System.Drawing.Size(263, 27);
            this.timeFilterInput.TabIndex = 4;
            this.timeFilterInput.ValueChanged += new System.EventHandler(this.ChangedFilters);
            this.timeFilterInput.Leave += new System.EventHandler(this.ChangedFilters);
            // 
            // destinationFilterInp
            // 
            this.destinationFilterInp.Location = new System.Drawing.Point(146, 123);
            this.destinationFilterInp.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.destinationFilterInp.Name = "destinationFilterInp";
            this.destinationFilterInp.Size = new System.Drawing.Size(263, 27);
            this.destinationFilterInp.TabIndex = 3;
            this.destinationFilterInp.Leave += new System.EventHandler(this.ChangedFilters);
            // 
            // filterDateCheckBox
            // 
            this.filterDateCheckBox.AutoSize = true;
            this.filterDateCheckBox.Location = new System.Drawing.Point(23, 169);
            this.filterDateCheckBox.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.filterDateCheckBox.Name = "filterDateCheckBox";
            this.filterDateCheckBox.Size = new System.Drawing.Size(143, 24);
            this.filterDateCheckBox.TabIndex = 2;
            this.filterDateCheckBox.Text = "Время вылета >";
            this.filterDateCheckBox.UseVisualStyleBackColor = true;
            this.filterDateCheckBox.CheckedChanged += new System.EventHandler(this.ChangedFilters);
            // 
            // filterDestinationCheckBox
            // 
            this.filterDestinationCheckBox.AutoSize = true;
            this.filterDestinationCheckBox.Location = new System.Drawing.Point(23, 128);
            this.filterDestinationCheckBox.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.filterDestinationCheckBox.Name = "filterDestinationCheckBox";
            this.filterDestinationCheckBox.Size = new System.Drawing.Size(123, 24);
            this.filterDestinationCheckBox.TabIndex = 1;
            this.filterDestinationCheckBox.Text = "Назначение: ";
            this.filterDestinationCheckBox.UseVisualStyleBackColor = true;
            this.filterDestinationCheckBox.CheckedChanged += new System.EventHandler(this.ChangedFilters);
            // 
            // flightNumberCheck
            // 
            this.flightNumberCheck.AutoSize = true;
            this.flightNumberCheck.Location = new System.Drawing.Point(23, 59);
            this.flightNumberCheck.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.flightNumberCheck.Name = "flightNumberCheck";
            this.flightNumberCheck.Size = new System.Drawing.Size(131, 24);
            this.flightNumberCheck.TabIndex = 0;
            this.flightNumberCheck.Text = "Поиск по коду";
            this.flightNumberCheck.UseVisualStyleBackColor = true;
            this.flightNumberCheck.Click += new System.EventHandler(this.ChangedFilters);
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
            this.groupBox3.Location = new System.Drawing.Point(528, 435);
            this.groupBox3.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Padding = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.groupBox3.Size = new System.Drawing.Size(505, 285);
            this.groupBox3.TabIndex = 4;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Ввод нового самолета";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(279, 37);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(94, 20);
            this.label5.TabIndex = 15;
            this.label5.Text = "Назначение";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(26, 40);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(156, 20);
            this.label4.TabIndex = 14;
            this.label4.Text = "Международный код";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(30, 139);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(81, 20);
            this.label1.TabIndex = 13;
            this.label1.Text = "Компания";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(81, 235);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(107, 20);
            this.label3.TabIndex = 12;
            this.label3.Text = "Время вылета";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(279, 139);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(148, 20);
            this.label2.TabIndex = 11;
            this.label2.Text = "Стоимость в рупиях";
            // 
            // departureInput
            // 
            this.departureInput.Location = new System.Drawing.Point(184, 227);
            this.departureInput.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.departureInput.Name = "departureInput";
            this.departureInput.Size = new System.Drawing.Size(238, 27);
            this.departureInput.TabIndex = 10;
            // 
            // flightCostInp
            // 
            this.flightCostInp.Increment = new decimal(new int[] {
            100,
            0,
            0,
            0});
            this.flightCostInp.Location = new System.Drawing.Point(279, 163);
            this.flightCostInp.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.flightCostInp.Maximum = new decimal(new int[] {
            100000,
            0,
            0,
            0});
            this.flightCostInp.Name = "flightCostInp";
            this.flightCostInp.Size = new System.Drawing.Size(198, 27);
            this.flightCostInp.TabIndex = 8;
            // 
            // destinationError
            // 
            this.destinationError.AutoSize = true;
            this.destinationError.ForeColor = System.Drawing.Color.Red;
            this.destinationError.Location = new System.Drawing.Point(279, 99);
            this.destinationError.Name = "destinationError";
            this.destinationError.Size = new System.Drawing.Size(144, 20);
            this.destinationError.TabIndex = 7;
            this.destinationError.Text = "Пустое назначение";
            this.destinationError.Visible = false;
            // 
            // destinationInp
            // 
            this.destinationInp.Location = new System.Drawing.Point(279, 64);
            this.destinationInp.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.destinationInp.Name = "destinationInp";
            this.destinationInp.PlaceholderText = "Назначение";
            this.destinationInp.Size = new System.Drawing.Size(197, 27);
            this.destinationInp.TabIndex = 6;
            this.destinationInp.TextChanged += new System.EventHandler(this.DestinationChanged);
            // 
            // companyInput
            // 
            this.companyInput.Location = new System.Drawing.Point(26, 163);
            this.companyInput.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.companyInput.Name = "companyInput";
            this.companyInput.PlaceholderText = "Компания";
            this.companyInput.Size = new System.Drawing.Size(238, 27);
            this.companyInput.TabIndex = 3;
            // 
            // flightNumberError
            // 
            this.flightNumberError.AutoSize = true;
            this.flightNumberError.ForeColor = System.Drawing.Color.Red;
            this.flightNumberError.Location = new System.Drawing.Point(30, 99);
            this.flightNumberError.Name = "flightNumberError";
            this.flightNumberError.Size = new System.Drawing.Size(175, 20);
            this.flightNumberError.TabIndex = 2;
            this.flightNumberError.Text = "Неверный формат кода";
            this.flightNumberError.Visible = false;
            // 
            // flightNumberInput
            // 
            this.flightNumberInput.Location = new System.Drawing.Point(26, 64);
            this.flightNumberInput.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.flightNumberInput.Name = "flightNumberInput";
            this.flightNumberInput.PlaceholderText = "Международный код";
            this.flightNumberInput.Size = new System.Drawing.Size(238, 27);
            this.flightNumberInput.TabIndex = 1;
            this.flightNumberInput.TextChanged += new System.EventHandler(this.FlightNumberChanged);
            // 
            // addBtn
            // 
            this.addBtn.Location = new System.Drawing.Point(248, 472);
            this.addBtn.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.addBtn.Name = "addBtn";
            this.addBtn.Size = new System.Drawing.Size(230, 65);
            this.addBtn.TabIndex = 5;
            this.addBtn.Text = "Добавить";
            this.addBtn.UseVisualStyleBackColor = true;
            this.addBtn.Click += new System.EventHandler(this.AddPlane);
            // 
            // removeBtn
            // 
            this.removeBtn.Location = new System.Drawing.Point(37, 472);
            this.removeBtn.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.removeBtn.Name = "removeBtn";
            this.removeBtn.Size = new System.Drawing.Size(214, 65);
            this.removeBtn.TabIndex = 6;
            this.removeBtn.Text = "Удалить";
            this.removeBtn.UseVisualStyleBackColor = true;
            this.removeBtn.Click += new System.EventHandler(this.RemovePlane);
            // 
            // airportListBox
            // 
            this.airportListBox.FormattingEnabled = true;
            this.airportListBox.ItemHeight = 20;
            this.airportListBox.Location = new System.Drawing.Point(37, 73);
            this.airportListBox.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.airportListBox.Name = "airportListBox";
            this.airportListBox.Size = new System.Drawing.Size(441, 404);
            this.airportListBox.TabIndex = 7;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1066, 829);
            this.Controls.Add(this.removeBtn);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.addBtn);
            this.Controls.Add(this.airportListBox);
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
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