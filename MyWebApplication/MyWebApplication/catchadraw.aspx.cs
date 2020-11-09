using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;

public partial class catchadraw : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Bitmap objBMP = new System.Drawing.Bitmap(100, 16);//認證碼長,寬
        Graphics objGraphics = System.Drawing.Graphics.FromImage(objBMP);
        objGraphics.Clear(Color.LightGray);//認證碼背景
        //objGraphics.TextRenderingHint = TextRenderingHint.AntiAlias; Configure font to use for text
        Font objFont = new Font("Arial", 8, FontStyle.Italic);//認證碼字體、大小及字型;其他字體可參考https://www.1001freefonts.com/
        string randomStr = "";
        char[] myIntArray = new char[4];//認證碼n個字
        int x;
        Random autoRand = new Random();//That is to create the random # and add it to our string 
        for (x = 0; x < 4; x++)//認證碼n個字
        {   //myIntArray[x] = System.Convert.ToInt32 (autoRand.Next(0,9));
            myIntArray[x] = (System.Convert.ToChar(Convert.ToInt32(Math.Floor(26 * autoRand.NextDouble()) + 65)));//加65為認證碼大寫英文;加48為數字
            randomStr += (myIntArray[x].ToString());
        }
        Session.Add("randomStr", randomStr);//產生的認證碼放在session "randomStr"
        objGraphics.DrawString(randomStr, objFont, Brushes.Black, 3, 3);//認證碼用黑色畫出
        objBMP.Save(Response.OutputStream, ImageFormat.Gif);//' Set the content type and return the image Response.ContentType = "image/GIF";
        objFont.Dispose();
        objGraphics.Dispose();
        objBMP.Dispose();
    }
}