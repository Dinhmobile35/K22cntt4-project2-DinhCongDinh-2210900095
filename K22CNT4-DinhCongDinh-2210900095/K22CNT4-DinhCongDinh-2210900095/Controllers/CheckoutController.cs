using System;
using System.Linq;
using System.Web.Mvc;
using K22CNT4_DinhCongDinh_2210900095.Models;

namespace K22CNT4_DinhCongDinh_2210900095.Controllers
{
    public class CheckoutController : Controller
    {
        private readonly K22CNT4_DinhCongDinh_2210900095_dbEntities db = new K22CNT4_DinhCongDinh_2210900095_dbEntities();

        // Hiển thị trang thanh toán
        public ActionResult Index()
        {
            int userId = 1; // Thay bằng UserID thực tế (ví dụ: lấy từ Session)
            var cartItems = db.ShoppingCart
                .Where(c => c.UserID == userId)
                .ToList();

            if (!cartItems.Any())
            {
                TempData["Message"] = "Giỏ hàng của bạn đang trống. Không thể thanh toán.";
                return RedirectToAction("Index", "ShoppingCart");
            }

            ViewBag.TotalAmount = cartItems.Sum(c => c.Quantity * c.Products.Price);
            return View(cartItems);
        }

        // Xử lý thanh toán
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ProcessOrder(string recipientName, string recipientEmail, string recipientPhone, string recipientAddress)
        {
            int userId = 1; // Thay bằng UserID thực tế (ví dụ: lấy từ Session)

            var cartItems = db.ShoppingCart.Where(c => c.UserID == userId).ToList();
            if (!cartItems.Any())
            {
                TempData["Message"] = "Giỏ hàng trống. Không thể thanh toán.";
                return RedirectToAction("Index", "ShoppingCart");
            }

            // Tạo đơn hàng mới
            var order = new Orders
            {
                UserID = userId,
                OrderDate = DateTime.Now,
                RecipientName = recipientName,
                RecipientEmail = recipientEmail,
                RecipientPhone = recipientPhone,
                RecipientAddress = recipientAddress,
                TotalAmount = cartItems.Sum(c => c.Quantity * c.Products.Price),
                Status = "Chưa xử lý" // Trạng thái mặc định của đơn hàng
            };
            db.Orders.Add(order);
            db.SaveChanges();

            // Lưu chi tiết đơn hàng
            foreach (var item in cartItems)
            {
                var orderDetail = new OrderDetails
                {
                    OrderID = order.OrderID,
                    ProductID = item.ProductID,
                    Quantity = item.Quantity,
                    UnitPrice = item.Products.Price
                };
                db.OrderDetails.Add(orderDetail);
            }

            // Xóa giỏ hàng sau khi đặt hàng
            db.ShoppingCart.RemoveRange(cartItems);
            db.SaveChanges();

            TempData["Message"] = "Đặt hàng thành công!";
            return RedirectToAction("OrderConfirmation", new { orderId = order.OrderID });
        }

        // Hiển thị xác nhận đơn hàng
        public ActionResult OrderConfirmation(int orderId)
        {
            var order = db.Orders.FirstOrDefault(o => o.OrderID == orderId);
            if (order == null)
            {
                return HttpNotFound();
            }

            return View(order);
        }
    }
}
