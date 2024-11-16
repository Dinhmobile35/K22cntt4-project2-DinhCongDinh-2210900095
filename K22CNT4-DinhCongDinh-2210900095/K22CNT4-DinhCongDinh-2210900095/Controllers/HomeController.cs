using System.Linq;
using System.Web.Mvc;
using K22CNT4_DinhCongDinh_2210900095.Models;

namespace K22CNT4_DinhCongDinh_2210900095.Controllers
{
    public class HomeController : Controller
    {
        private K22CNT4_DinhCongDinh_2210900095_dbEntities db = new K22CNT4_DinhCongDinh_2210900095_dbEntities();

        public ActionResult Index()
        {
            // Lấy danh sách sản phẩm từ cơ sở dữ liệu
            var products = db.Products.ToList();

            // Truyền danh sách sản phẩm vào view
            return View(products);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            return View();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
