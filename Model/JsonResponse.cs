using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace Movie.Model
{
    public class JsonResponse<T>
    {
        public Movie.Common.Enums.ResultStatus Code { get; set; }
        public string Message { get; set; }
        public T Data { get; set; }
    }
}
