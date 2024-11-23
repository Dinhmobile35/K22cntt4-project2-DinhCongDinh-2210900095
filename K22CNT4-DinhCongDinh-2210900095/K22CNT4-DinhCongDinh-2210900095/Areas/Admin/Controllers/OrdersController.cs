using System.Linq;
using System.Web.Mvc;
using K22CNT4_DinhCongDinh_2210900095.Models;

namespace K22CNT4_DinhCongDinh_2210900095.Areas.Admin.Controllers
{
    public class OrdersController : Controller
    {
        private K22CNT4_DinhCongDinh_2210900095_dbEntities db = new K22CNT4_DinhCongDinh_2210900095_dbEntities();

        // GET: Admin/Orders
        public ActionResult Index()
        {
            // Lấy danh sách đơn hàng kèm thông tin người dùng
            var orders = db.Orders.Select(o => new
            {
                o.OrderID,
                o.OrderDate,
                o.TotalAmount,
                o.Status,
                UserName = db.Users.FirstOrDefault(u => u.UserID == o.UserID).Username
            }).ToList()
            .Select(o => new Orders
            {
                OrderID = o.OrderID,
                OrderDate = o.OrderDate,
                TotalAmount = o.TotalAmount,
                Status = o.Status,
                Username = o.UserName
            });

            return View(orders);
        }

        // POST: Admin/Orders/UpdateStatus
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateStatus(int id, string status)
        {
            var order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }

            // Cập nhật trạng thái đơn hàng
            order.Status = status;
            db.SaveChanges();

            TempData["SuccessMessage"] = "Trạng thái đơn hàng đã được cập nhật thành công.";
            return RedirectToAction("Index");
        }

        // GET: Admin/Orders/Details/5
        public ActionResult Details(int id)
        {
            var order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }

            // Lấy danh sách sản phẩm trong đơn hàng
            var orderDetails = db.OrderDetails
                .Where(od => od.OrderID == id)
                .Select(od => new
                {
                    od.Products.ProductName,
                    od.Quantity,
                    od.UnitPrice,
                    Total = od.Quantity * od.UnitPrice
                })
                .ToList();

            // Truyền dữ liệu qua ViewBag
            ViewBag.OrderDetails = orderDetails;

            // Thêm thông tin người dùng vào đơn hàng
            order.Users = db.Users.FirstOrDefault(u => u.UserID == order.UserID);

            return View(order);
        }
    }
}
