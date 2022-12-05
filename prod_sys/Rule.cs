﻿using System;
using System.Collections.Generic;
using System.Linq;

namespace prod_sys
{
    public class Rule
    {
        public string iid;
        public string desc;
        double conf;

        public HashSet<Fact> lhs;
        public HashSet<Fact> rhs;

        public Rule(string str, List<Fact> facts)
        {
            var res = str.Split(new[] { ';' }, StringSplitOptions.RemoveEmptyEntries).Select(s=>s.Trim()).ToList();

            iid = res[0];
            conf = double.Parse(res[3]);
            desc = res[4];

            var pre = res[1].Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries).Select(s => s.Trim()).ToList();
            lhs = new HashSet<Fact>();
            foreach (var f in pre)
            {
                lhs.Add(facts.Where(fact => fact.iid == f).ToList()[0]);
            }

            rhs = new HashSet<Fact>
            {
                facts.Where(fact => fact.iid == res[2]).ToList()[0]
            };
        }

        public bool Equals(Rule b)
        {
            return iid == b.iid;
        }

        public override bool Equals(object obj)
        {
            return obj is Rule rule && Equals(rule);
        }

        public override int GetHashCode()
        {
            return iid.GetHashCode();
        }
    }
}
