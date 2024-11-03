using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Dinhkeyshop.Models;

namespace Dinhkeyshop.Controllers
{
    public class HomeController : Controller
    {
        private readonly DinhKeyShopEntities _context; // Thay thế YourDbContext bằng tên ngữ cảnh của bạn

        public HomeController()
        {
            _context = new DinhKeyShopEntities(); // Khởi tạo ngữ cảnh
        }

        public ActionResult Index()
        {
            var products = _context.Products.ToList(); // Lấy danh sách sản phẩm từ cơ sở dữ liệu
            return View(products); // Trả về view với danh sách sản phẩm
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
    }
}
