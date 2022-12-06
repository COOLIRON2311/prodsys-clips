using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Windows.Forms;
using System.Collections.Generic;
using CLIPSNET;
using System.Globalization;

namespace prod_sys
{
    public partial class Form1 : Form
    {
        private CLIPSNET.Environment clips = new CLIPSNET.Environment();

        List<Fact> facts;
        List<Rule> rules;

        HashSet<Fact> leftCheckedFacts;
        HashSet<Fact> rightCheckedFacts;

        public void InitFacts()
        {
            facts = new List<Fact>();

            using (var reader = new StreamReader("../../facts.txt"))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    if (line != "")
                        facts.Add(new Fact(line));
                }
            }
            facts.Sort((x, y) => x.desc.CompareTo(y.desc));
        }
        public void InitRules()
        {
            rules = new List<Rule>();

            using (var reader = new StreamReader("../../rules.txt"))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    if (line != "")
                        rules.Add(new Rule(line, facts));
                }
            }
        }

        public void LoadCheckBox()
        {
            foreach (var f in facts)
            {
                checkedListBox1.Items.Add(f.iid + " " + f.desc);
                checkedListBox2.Items.Add(f.iid + " " + f.desc);
            }
        }

        public void InitClips()
        {
            string clp = System.IO.File.ReadAllText("../../generated_rules.clp");
            clips.LoadFromString(clp);
        }

        public Form1()
        {
            InitializeComponent();
            InitFacts();
            // InitRules();
            LoadCheckBox();
            InitClips();
            button2.Enabled = false;
            leftCheckedFacts = new HashSet<Fact>();
            rightCheckedFacts = new HashSet<Fact>();
        }

        private bool NewRecognPhrases(List<FactInstance> phrases)
        {
            String CropName(FactInstance f)
            {
                var val = f.GetSlotValues()[0];
                return val.ToString().Trim(new char[] { '(', ')', '"' });
            }
            String CropConf(FactInstance f)
            {
                var val = f.GetSlotValues()[1];
                var str = val.ToString().Trim(new char[] { '(', ')', '"' });
                var d = double.Parse(str, CultureInfo.InvariantCulture);
                return d.ToString("0.00");
        }
            var phrase = CropName(phrases[0]).Split(':');
            var fs = clips.GetFactList();
            var fact_conf = fs.Where(f => f.RelationName == "item").ToList().Where(f => CropName(f).Equals(phrase[0])).First();
            richTextBox1.Text += $"Выведен факт  {phrase[0]}: {phrase[1]}  ({CropConf(fact_conf)})\n";
            clips.Eval("(assert (clearmessage))");
            return rightCheckedFacts.Where(f => f.iid == phrase[0]).Count() == 1;
        }

        private void HandleResponse()
        {
            clips.Run();
            var fs = clips.GetFactList();
            var readyFacts = fs.Where(f => f.RelationName == "sendmessagehalt").ToList();
            bool goal= false;
            if (readyFacts.Count > 0)
            {
                goal = NewRecognPhrases(readyFacts);
            }
            else
            {
                //richTextBox1.Text += "Подходящих вариантов нет\n";
                button2.Enabled = false;
            }
            clips.Eval("(assert (clear-message))");

            if (goal)
            {
                richTextBox1.Text += "Целевой факт выведен\n";
            }

            if (readyFacts.Count > 0)
                HandleResponse();
        }

        private void Forward()
        {
            clips.Clear();
            InitClips();

            foreach (var f in leftCheckedFacts)
            {
                string factVal = $"item (name {f.iid}) (conf {f.conf.ToString(CultureInfo.InvariantCulture)})";
                clips.Eval($"(assert ({factVal}) )");
                richTextBox1.Text += "Добавлен факт " + f.desc + "\n";
            }

            button2.Enabled = true;
        }

        private void checkedListBox1_ItemCheck(object sender, ItemCheckEventArgs e)
        {
            if (e.NewValue == CheckState.Checked && !leftCheckedFacts.Contains(facts[e.Index]))
                leftCheckedFacts.Add(facts[e.Index]);
            else if (e.NewValue == CheckState.Unchecked)
                leftCheckedFacts.Remove(facts[e.Index]);
        }


        private void checkedListBox2_ItemCheck(object sender, ItemCheckEventArgs e)
        {

            if (e.NewValue == CheckState.Checked && !rightCheckedFacts.Contains(facts[e.Index]))
            {
                rightCheckedFacts.Add(facts[e.Index]);
            }
            else if (e.NewValue == CheckState.Unchecked)
            {
                rightCheckedFacts.Remove(facts[e.Index]);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            richTextBox1.Clear();
            if (leftCheckedFacts.Count > 0 && rightCheckedFacts.Count == 1)
                Forward();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            HandleResponse();
            button2.Enabled = false;
        }
    }
}
