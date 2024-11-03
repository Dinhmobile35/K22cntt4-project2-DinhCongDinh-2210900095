using System;
using System.Linq;
using System.Web.Mvc;
using Dinhkeyshop.Models;

namespace Dinhkeyshop.Controllers
{
    public class AdminController : Controller
    {
        private DinhKeyShopEntities db = new DinhKeyShopEntities();
        [Authorize(Roles = "Admin")]
        public ActionResult UserManagement()
        {
            var users = db.Users.ToList();
            return View(users);
        }

        public ActionResult Dashboard()
        {
            return View();
        }

        // =============================================
        // QUẢN LÝ NGƯỜI DÙNG
        // =============================================

        // GET: Admin/ManageUsers
        public ActionResult ManageUsers()
        {
            var users = db.Users.ToList(); // Lấy danh sách tất cả người dùng
            return View(users);
        }

        // GET: Admin/CreateUser
        public ActionResult CreateUser()
        {
            return View();
        }

        // POST: Admin/CreateUser
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateUser(Users model)
        {
            if (ModelState.IsValid)
            {
                var existingUser = db.Users.FirstOrDefault(u => u.Username == model.Username || u.Email == model.Email);
                if (existingUser != null)
                {
                    ViewBag.ErrorMessage = "Username or Email already exists!";
                    return View(model);
                }

                model.CreatedAt = DateTime.Now;
                db.Users.Add(model);
                db.SaveChanges();
                return RedirectToAction("ManageUsers");
            }

            return View(model);
        }

        // GET: Admin/EditUser/{id}
        public ActionResult EditUser(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }

            var user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }

            return View(user);
        }

        // POST: Admin/EditUser
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditUser(Users model)
        {
            if (ModelState.IsValid)
            {
                var user = db.Users.Find(model.UserID);
                if (user != null)
                {
                    user.FullName = model.FullName;
                    user.Email = model.Email;
                    user.PhoneNumber = model.PhoneNumber;
                    user.Address = model.Address;
                    user.Role = model.Role;  // Cập nhật quyền người dùng (admin hoặc user)

                    db.SaveChanges();
                    return RedirectToAction("ManageUsers");
                }
                else
                {
                    ModelState.AddModelError("", "User not found.");
                }
            }
            return View(model);
        }

        // GET: Admin/DeleteUser/{id}
        public ActionResult DeleteUser(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }

            var user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }

            return View(user);
        }

        // POST: Admin/DeleteUser/{id}
        [HttpPost, ActionName("DeleteUser")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteUserConfirmed(int id)
        {
            var user = db.Users.Find(id);
            if (user != null)
            {
                db.Users.Remove(user);
                db.SaveChanges();
            }
            return RedirectToAction("ManageUsers");
        }

        // =============================================
        // QUẢN LÝ SẢN PHẨM
        // =============================================

        // GET: Admin/ManageProducts
        public ActionResult ManageProducts()
        {
            var products = db.Products.Include("Categories").ToList(); // Lấy danh sách sản phẩm và bao gồm cả danh mục
            return View(products);
        }

        // GET: Admin/CreateProduct
        public ActionResult CreateProduct()
        {
            ViewBag.Categories = db.Categories.ToList(); // Lấy danh mục sản phẩm
            return View();
        }

        // POST: Admin/CreateProduct
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateProduct(Products model)
        {
            if (ModelState.IsValid)
            {
                db.Products.Add(model);
                db.SaveChanges();
                return RedirectToAction("ManageProducts");
            }
            ViewBag.Categories = db.Categories.ToList(); // Nếu tạo sản phẩm thất bại, trả lại danh mục
            return View(model);
        }

        // GET: Admin/EditProduct/{id}
        public ActionResult EditProduct(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }

            var product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }

            ViewBag.Categories = db.Categories.ToList(); // Lấy danh sách danh mục để hiển thị trong dropdown
            return View(product);
        }

        // POST: Admin/EditProduct
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditProduct(Products model)
        {
            if (ModelState.IsValid)
            {
                var product = db.Products.Find(model.ProductID);
                if (product != null)
                {
                    product.ProductName = model.ProductName;
                    product.Description = model.Description;
                    product.Price = model.Price;
                    product.QuantityInStock = model.QuantityInStock;
                    product.CategoryID = model.CategoryID;
                    product.ImageUrl = model.ImageUrl;

                    db.SaveChanges();
                    return RedirectToAction("ManageProducts");
                }
                else
                {
                    ModelState.AddModelError("", "Không tìm thấy sản phẩm.");
                }
            }
            // Nếu có lỗi thì trả lại view với thông tin cũ
            ViewBag.Categories = db.Categories.ToList();
            return View(model);
        }

        // GET: Admin/DeleteProduct/{id}
        public ActionResult DeleteProduct(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }

            var product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }

            return View(product);
        }

        // POST: Admin/DeleteProduct/{id}
        [HttpPost, ActionName("DeleteProduct")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("ManageProducts");
        }
    }
}
