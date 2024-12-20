using System;
using System.IO;
using System.Collections.Generic;
using System.Reflection;
using Valil.Chess.Engine.Properties;

namespace Valil.Chess.Engine
{
    public sealed partial class ChessEngine
    {
        // hashtable with the board hash as the key and a list of moves for this board configuration as the value
        private Dictionary<int, List<short>> book;

        // helps choose a move when the list contains more than one
        private Random random;

        /// <summary>
        /// Initializes the opening book.
        /// </summary>
        private void InitializeOpeningBook()
        {
            // initialize the random generator
            random = new Random(unchecked((int)DateTime.Now.Ticks));

            // the "book.bin" file is a binary file with this pattern: int,short,int,short etc.
            // a 4-byte int represent a board hash, the following 2-byte short is a move (the first byte represents the starting square, the second one the ending square)

            // read "book.bin" and put the values in the hashtable
            try
            {
                using (BinaryReader br = new BinaryReader(new BufferedStream(Assembly.GetExecutingAssembly().GetManifestResourceStream("Valil.Chess.Engine.book.bin"), Settings.Default.OpeningBookByteSize)))
                {
                    book = new Dictionary<int, List<short>>(Settings.Default.OpeningBookSize);

                    for (int i = 0; i < Settings.Default.OpeningBookSize; i++)
                    {
                        int hash = br.ReadInt32();
                        short move = br.ReadInt16();

                        // if the hashtable already contains this hash, add the move to the list
                        // otherwise create a new list and add the pair to the hashtable
                        if (book.ContainsKey(hash))
                        {
                            book[hash].Add(move);
                        }
                        else
                        {
                            List<short> list = new List<short>(1);
                            list.Add(move);
                            book.Add(hash, list);
                        }
                    }
                }
            }
            catch
            {
            }
        }
    }
}