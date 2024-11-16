using System.Linq;
using System.Web.Mvc;
using K22CNT4_DinhCongDinh_2210900095.Models;

namespace Dinhkeyshop.Controllers
{
    public class ProductsController : Controller
    {
        private readonly K22CNT4_DinhCongDinh_2210900095_dbEntities _context; // Thay thế YourDbContext bằng tên ngữ cảnh của bạn

        public ProductsController()
        {
            _context = new K22CNT4_DinhCongDinh_2210900095_dbEntities(); // Khởi tạo ngữ cảnh
        }

        public ActionResult Index()
        {
            var products = _context.Products.ToList(); // Lấy danh sách sản phẩm từ cơ sở dữ liệu
            return View(products); // Trả về view với danh sách sản phẩm
        }

        public ActionResult Details(int id)
        {
            var product = _context.Products.Find(id); // Lấy sản phẩm theo ID
            if (product == null)
            {
                return HttpNotFound(); // Trả về 404 nếu không tìm thấy
            }
            return View(product); // Trả về view với sản phẩm
        }
    }
}
