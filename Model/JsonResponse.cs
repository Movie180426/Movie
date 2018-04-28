using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using static Movie.Common.Enums;

namespace Movie.Model
{
    public class JsonResponse<T>
    {
        public ResultStatus Code { get; set; }
        public string Message { get; set; }
        public T Data { get; set; }
    }
}
