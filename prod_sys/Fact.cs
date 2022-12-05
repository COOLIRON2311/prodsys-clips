using System;
using System.Globalization;
using System.Linq;

namespace prod_sys
{
    public class Fact
    {
        public string iid;
        public string desc;
        public double conf;

        public Fact(string str)
        {
            var res = str.Split(new[] { ';' }, StringSplitOptions.RemoveEmptyEntries).Select(s => s.Trim()).ToList();
            iid = res[0];
            desc = res[1];
            conf = double.Parse(res[2], CultureInfo.InvariantCulture);
        }

        public bool Equals(Fact b)
        {
            return iid.Equals(b.iid);
        }

        public override bool Equals(object obj)
        {
            return obj is Fact && Equals((Fact)obj);
        }

        public override int GetHashCode()
        {
            return iid.GetHashCode();
        }
    }
}
