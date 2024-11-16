using System.Linq;
using System.Web.Mvc;
using K22CNT4_DinhCongDinh_2210900095.Models;

namespace K22CNT4_DinhCongDinh_2210900095.Areas.Admin.Controllers
{
    public class OrdersController : Controller
    {
        private K22CNT4_DinhCongDinh_2210900095_dbEntities db = new K22CNT4_DinhCongDinh_2210900095_dbEntities();

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
                Username = o.UserName // Bổ sung tên người dùng
            });

            return View(orders);
        }
    }
}
