
namespace lab_1
{
    partial class MainForm
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.button1 = new System.Windows.Forms.Button();
            this.hooligansBox = new System.Windows.Forms.GroupBox();
            this.genderBox = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.strengthTextBox = new System.Windows.Forms.TextBox();
            this.nameTextBox = new System.Windows.Forms.TextBox();
            this.ageTextBox = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.hooligansBox.SuspendLayout();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(315, 14);
            this.button1.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(292, 300);
            this.button1.TabIndex = 5;
            this.button1.Text = "Превратить в быдло";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // hooligansBox
            // 
            this.hooligansBox.Controls.Add(this.genderBox);
            this.hooligansBox.Controls.Add(this.label4);
            this.hooligansBox.Controls.Add(this.strengthTextBox);
            this.hooligansBox.Controls.Add(this.nameTextBox);
            this.hooligansBox.Controls.Add(this.ageTextBox);
            this.hooligansBox.Location = new System.Drawing.Point(14, 14);
            this.hooligansBox.Margin = new System.Windows.Forms.Padding(9);
            this.hooligansBox.Name = "hooligansBox";
            this.hooligansBox.Padding = new System.Windows.Forms.Padding(19, 18, 19, 18);
            this.hooligansBox.Size = new System.Drawing.Size(288, 300);
            this.hooligansBox.TabIndex = 5;
            this.hooligansBox.TabStop = false;
            this.hooligansBox.Text = "Сведения о хулигане";
            // 
            // genderBox
            // 
            this.genderBox.DisplayMember = "male";
            this.genderBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.genderBox.FormattingEnabled = true;
            this.genderBox.Items.AddRange(new object[] {
            "male",
            "female",
            "censored"});
            this.genderBox.Location = new System.Drawing.Point(134, 240);
            this.genderBox.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.genderBox.Name = "genderBox";
            this.genderBox.Size = new System.Drawing.Size(71, 23);
            this.genderBox.TabIndex = 4;
            this.genderBox.ValueMember = "male";
            // 
            // label4
            // 
            this.label4.Location = new System.Drawing.Point(9, 232);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(117, 37);
            this.label4.TabIndex = 0;
            this.label4.Text = "Пол";
            this.label4.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // strengthTextBox
            // 
            this.strengthTextBox.Location = new System.Drawing.Point(89, 172);
            this.strengthTextBox.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.strengthTextBox.MinimumSize = new System.Drawing.Size(4, 32);
            this.strengthTextBox.Name = "strengthTextBox";
            this.strengthTextBox.PlaceholderText = "Введите силу";
            this.strengthTextBox.Size = new System.Drawing.Size(116, 23);
            this.strengthTextBox.TabIndex = 3;
            // 
            // nameTextBox
            // 
            this.nameTextBox.Location = new System.Drawing.Point(89, 37);
            this.nameTextBox.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.nameTextBox.MinimumSize = new System.Drawing.Size(4, 32);
            this.nameTextBox.Name = "nameTextBox";
            this.nameTextBox.PlaceholderText = "Введите имя";
            this.nameTextBox.Size = new System.Drawing.Size(116, 23);
            this.nameTextBox.TabIndex = 1;
            // 
            // ageTextBox
            // 
            this.ageTextBox.Location = new System.Drawing.Point(89, 103);
            this.ageTextBox.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.ageTextBox.MinimumSize = new System.Drawing.Size(4, 32);
            this.ageTextBox.Name = "ageTextBox";
            this.ageTextBox.PlaceholderText = "Введите возраст";
            this.ageTextBox.Size = new System.Drawing.Size(116, 23);
            this.ageTextBox.TabIndex = 2;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(756, 54);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(38, 15);
            this.label5.TabIndex = 6;
            this.label5.Text = "label5";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(756, 117);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(38, 15);
            this.label6.TabIndex = 7;
            this.label6.Text = "label6";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(756, 189);
            this.label7.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(38, 15);
            this.label7.TabIndex = 8;
            this.label7.Text = "label7";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(756, 262);
            this.label8.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(38, 15);
            this.label8.TabIndex = 9;
            this.label8.Text = "label8";
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(933, 329);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.hooligansBox);
            this.Controls.Add(this.button1);
            this.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.Name = "MainForm";
            this.Text = "MainForm";
            this.hooligansBox.ResumeLayout(false);
            this.hooligansBox.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.GroupBox hooligansBox;
        private System.Windows.Forms.TextBox nameTextBox;
        private System.Windows.Forms.TextBox ageTextBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox strengthTextBox;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.ComboBox genderBox;
    }
}

