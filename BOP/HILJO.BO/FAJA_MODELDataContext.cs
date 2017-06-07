using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Configuration;

namespace BOP.BO
{
    public partial class FAJA_MODELDataContext
    {
        public FAJA_MODELDataContext() :
            base(ConfigurationManager.ConnectionStrings["FAJA_DBConnectionString"].ConnectionString, mappingSource)
        {
            OnCreated();
        }

    }
}
