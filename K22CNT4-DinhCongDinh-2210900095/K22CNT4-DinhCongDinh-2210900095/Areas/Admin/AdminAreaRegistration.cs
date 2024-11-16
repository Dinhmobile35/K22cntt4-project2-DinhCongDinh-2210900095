using System.Web.Mvc;

namespace K22CNT4_DinhCongDinh_2210900095.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get { return "Admin"; }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { controller = "Admin", action = "AdminDashboard", id = UrlParameter.Optional },
                namespaces: new[] { "K22CNT4_DinhCongDinh_2210900095.Areas.Admin.Controllers" }
            );
        }
    }
}
