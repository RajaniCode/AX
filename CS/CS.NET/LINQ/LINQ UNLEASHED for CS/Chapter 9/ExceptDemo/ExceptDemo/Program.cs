﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ExceptDemo
{
  class Program
  {
    static void Main(string[] args)
    {

      var evens = new int[] { 2, 4, 6, 8, 10, 12, 14, 16, 19, 20, 22, 24, 26, 28, 30, 32, 34};
      var fibos = new int[] { 1, 1, 2, 3, 5, 8, 13, 21, 34 };

      var setDifference = evens.Except(fibos);

      Array.ForEach<int>(setDifference.ToArray(), e => Console.WriteLine(e));
      Console.ReadLine();

    }
  }
}
