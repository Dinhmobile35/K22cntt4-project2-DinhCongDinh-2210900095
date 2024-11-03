using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dinhkeyshop.Models;

namespace Dinhkeyshop.Controllers
{
    public class ShoppingCartController : Controller
    {
        private DinhKeyShopEntities db = new DinhKeyShopEntities();

        // GET: ShoppingCart
        public ActionResult Index()
        {
            var cart = GetCart();
            return View(cart);
        }

        public List<ShoppingCart> GetCart()
        {
            int userId = Convert.ToInt32(Session["UserID"]);
            return db.ShoppingCart.Where(c => c.UserID == userId).ToList();
        }

        public ActionResult AddToCart(int productId)
        {
            int userId = Convert.ToInt32(Session["UserID"]);
            var cartItem = db.ShoppingCart.SingleOrDefault(c => c.UserID == userId && c.ProductID == productId);
            if (cartItem == null)
            {
                cartItem = new ShoppingCart
                {
                    UserID = userId,
                    ProductID = productId,
                    Quantity = 1,
                    AddedAt = DateTime.Now
                };
                db.ShoppingCart.Add(cartItem);
            }
            else
            {
                cartItem.Quantity++;
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult RemoveFromCart(int productId)
        {
            int userId = Convert.ToInt32(Session["UserID"]);
            var cartItem = db.ShoppingCart.SingleOrDefault(c => c.UserID == userId && c.ProductID == productId);
            if (cartItem != null)
            {
                db.ShoppingCart.Remove(cartItem);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult UpdateCart(int productId, int quantity)
        {
            int userId = Convert.ToInt32(Session["UserID"]);
            var cartItem = db.ShoppingCart.SingleOrDefault(c => c.UserID == userId && c.ProductID == productId);
            if (cartItem != null)
            {
                cartItem.Quantity = quantity;
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        public ActionResult Checkout()
        {
            var cart = GetCart();
            if (cart.Count == 0)
            {
                return RedirectToAction("Index");
            }

            var order = new Orders
            {
                UserID = Convert.ToInt32(Session["UserID"]),
                OrderDate = DateTime.Now,
                TotalAmount = cart.Sum(c => c.Quantity * c.Products.Price),
                Status = "Pending",
                PaymentMethod = "COD",
                DeliveryAddress = "Địa chỉ giao hàng" // Replace with actual address
            };

            db.Orders.Add(order);
            db.SaveChanges();

            foreach (var item in cart)
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

            db.ShoppingCart.RemoveRange(cart);
            db.SaveChanges();

            return RedirectToAction("OrderConfirmation");
        }

        public ActionResult OrderConfirmation()
        {
            return View();
        }
    }
}
