using System;
using System.Collections.Generic;
using System.Windows.Forms;
using CLIPSNET;

namespace prod_sys
{
    public partial class Dialog : Form
    {
        public int SelectedInd;
        public Dialog(List<FactInstance> facts)
        {
            InitializeComponent();
            foreach (var f in facts)
            {
                var item = f.GetSlotValues()[0].ToString().Trim(new char[] { '(', ')' , '"'});
                comboBox1.Items.Add(item);
            }
            comboBox1.SelectedIndex = comboBox1.Items.Count-1;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.OK;
            SelectedInd = comboBox1.SelectedIndex;
            Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
            SelectedInd = comboBox1.SelectedIndex;
            Close();
        }
    }
}
