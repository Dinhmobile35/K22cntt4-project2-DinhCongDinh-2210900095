using System;
using System.Linq;
using System.Web.Mvc;
using Dinhkeyshop.Models;

namespace Dinhkeyshop.Controllers
{
    public class AccountController : Controller
    {
        private DinhKeyShopEntities db = new DinhKeyShopEntities();

        // GET: Account/Register
        public ActionResult Register()
        {
            return View();
        }

        // POST: Account/Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(Users model)
        {
            if (ModelState.IsValid)
            {
                // Kiểm tra xem Username có tồn tại không
                var existingUser = db.Users.FirstOrDefault(u => u.Username == model.Username);
                if (existingUser != null)
                {
                    ViewBag.ErrorMessage = "Tên đăng nhập đã tồn tại!";
                    return View(model);
                }

                // Lưu người dùng vào database
                model.CreatedAt = DateTime.Now; // Gán thời gian tạo tài khoản
                db.Users.Add(model);
                db.SaveChanges();

                // Tự động đăng nhập sau khi đăng ký thành công
                Session["UserID"] = model.UserID;
                Session["Username"] = model.Username;

                // Chuyển hướng đến trang Home
                return RedirectToAction("Index", "Home");
            }

            // Nếu model không hợp lệ, trả về view cùng với lỗi
            return View(model);
        }

        // GET: Account/Login
        public ActionResult Login()
        {
            return View();
        }

        // POST: Account/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Users model)
        {
            if (ModelState.IsValid)
            {
                // Tìm kiếm người dùng dựa trên tên đăng nhập và mật khẩu
                var user = db.Users.FirstOrDefault(u => u.Username == model.Username && u.PasswordHash == model.PasswordHash);
                if (user != null)
                {
                    // Đăng nhập thành công, lưu thông tin người dùng vào session
                    Session["UserID"] = user.UserID;
                    Session["Username"] = user.Username;
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.ErrorMessage = "Tên đăng nhập hoặc mật khẩu không chính xác!";
                }
            }

            // Nếu có lỗi, trả về view với lỗi
            return View(model);
        }

        // GET: Account/Logout
        public ActionResult Logout()
        {
            // Xóa thông tin đăng nhập
            Session.Clear();
            return RedirectToAction("Login");
        }
    }
}
