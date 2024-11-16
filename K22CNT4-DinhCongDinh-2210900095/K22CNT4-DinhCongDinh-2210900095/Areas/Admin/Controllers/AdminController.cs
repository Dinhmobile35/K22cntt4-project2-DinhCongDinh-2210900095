using System.Web.Mvc;

namespace K22CNT4_DinhCongDinh_2210900095.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        // Kiểm tra quyền truy cập trước khi thực thi action
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                filterContext.Result = new RedirectResult("~/Account/Login");
                return;
            }

            base.OnActionExecuting(filterContext);
        }

        // Trang Admin Dashboard
        public ActionResult AdminDashboard()
        {
            return View();
        }
    }
}
