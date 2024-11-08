using System.Web.Mvc;

namespace K22CNT4_DinhCongDinh_2210900095.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin/Admin
        public ActionResult Index()
        {
            return View();
        }

        // Add other management actions here
        public ActionResult ManageUsers()
        {
            return View();
        }

        public ActionResult ManageProducts()
        {
            return View();
        }

        public ActionResult ManageOrders()
        {
            return View();
        }

        public ActionResult ManageCategories()
        {
            return View();
        }
    }
}
