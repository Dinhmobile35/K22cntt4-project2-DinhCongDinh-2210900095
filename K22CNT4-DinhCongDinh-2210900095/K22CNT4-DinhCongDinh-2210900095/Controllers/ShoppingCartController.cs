using System;
using System.Linq;
using System.Web.Mvc;
using K22CNT4_DinhCongDinh_2210900095.Models;

namespace K22CNT4_DinhCongDinh_2210900095.Controllers
{
    public class ShoppingCartController : Controller
    {
        private readonly K22CNT4_DinhCongDinh_2210900095_dbEntities db = new K22CNT4_DinhCongDinh_2210900095_dbEntities();

        // Hiển thị giỏ hàng
        public ActionResult Index()
        {
            int userId = 1;
            var cartItems = db.ShoppingCart
                .Where(c => c.UserID == userId)
                .ToList();

            return View(cartItems);
        }

        // Thêm sản phẩm vào giỏ hàng
        public ActionResult AddToCart(int productId, int quantity)
        {
            int userId = 1; 

            // Kiểm tra sản phẩm đã tồn tại trong giỏ hàng chưa
            var existingCartItem = db.ShoppingCart.FirstOrDefault(c => c.UserID == userId && c.ProductID == productId);

            if (existingCartItem != null)
            {
                // Nếu sản phẩm đã có, tăng số lượng
                existingCartItem.Quantity += quantity;
                existingCartItem.AddedAt = DateTime.Now; // Cập nhật thời gian thêm
            }
            else
            {
                // Nếu chưa có, thêm mới vào giỏ hàng
                var newCartItem = new ShoppingCart
                {
                    UserID = userId,
                    ProductID = productId,
                    Quantity = quantity,
                    AddedAt = DateTime.Now
                };
                db.ShoppingCart.Add(newCartItem);
            }

            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // Xóa sản phẩm khỏi giỏ hàng
        public ActionResult RemoveFromCart(int cartId)
        {
            var cartItem = db.ShoppingCart.Find(cartId);
            if (cartItem != null)
            {
                db.ShoppingCart.Remove(cartItem);
                db.SaveChanges();
            }

            return RedirectToAction("Index");
        }

        // Chuyển sang trang thanh toán
        public ActionResult Checkout()
        {
            int userId = 1; 
            var cartItems = db.ShoppingCart
                .Where(c => c.UserID == userId)
                .ToList();

            if (!cartItems.Any())
            {
                TempData["Message"] = "Giỏ hàng trống, không thể thanh toán.";
                return RedirectToAction("Index");
            }

            return RedirectToAction("Index", "Checkout");
        }
    }
}
