using System.Web;
using System.Web.Mvc;

namespace K22CNT4_DinhCongDinh_2210900095
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
