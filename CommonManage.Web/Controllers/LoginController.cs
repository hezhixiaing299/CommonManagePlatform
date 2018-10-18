//using CMP.Dal;
//using Common.Base.BaseEntity;
//using Common.Tool;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using CMP.Dal;
using Common.Tool;
using Common.Base.BaseEntity;
using Common.Base.BaseCommon;

namespace CommonManage.Web.Controllers
{
    public class LoginController : Controller
    {
        private Org_UserDal ouDal = new Org_UserDal();

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult GetAuthCode()
        {
            return File(VerifyCode.GetVerifyCode(HttpContext), @"image/Gif");
        }

        public JsonResult CheckLogin(BaseUser loginuser)
        {
            OperateStatus op = new OperateStatus { IsSuccessful = false,Message = "初始异常!"};
            op = ouDal.CheckLogin(loginuser);



            string checkVerify = DEncrypt.Get16_Md5Lower(loginuser.Code, null);
            if (HttpContext.Session.GetString("Login_VerifyCode") == null || checkVerify != HttpContext.Session.GetString("Login_VerifyCode").ToString())
            {
                op.IsSuccessful = false;
                op.Message = "验证码不正确，请重新输入!";
            }
            else
            {
                op = ouDal.CheckLogin(loginuser);
                if (op.IsSuccessful)
                {
                    //记录Cookie
                    //UserHelper.WrriteUserTokenCookie(loginuser.LoginName);
                    op.IsSuccessful = true;
                    op.Message = "登录成功!欢迎您!";
                    //记录Cookie
                    //UserHelper.WriteUserTokenCookie(loginuser.LoginName);
                }
                else
                {
                    op.IsSuccessful = false;
                    op.Message = op.Message ?? "用户名或密码错误！";
                }
            }
            return Json(op);
        }
    }
}