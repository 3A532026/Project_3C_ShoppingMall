using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace MyWebApplication
{
    /// <summary>
    /// showImage 的摘要描述
    /// </summary>
    public class showImage : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";/*預設純文字*/
            if (context.Session["myFile"] != null)
            {
                HttpPostedFile obj_file = (HttpPostedFile)context.Session["myFile"];

                //檔案有多大，陣列就多大
                byte[] file = new byte[obj_file.ContentLength];
                obj_file.InputStream.Read(file, 0, file.Length);//讀取Stream內容到byte[]
                context.Response.Clear();//清除緩衝區
                context.Response.ContentType = "image/jpeg";//設定MIME類型
                context.Response.BinaryWrite(file);//輸出圖片
            }


        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}