using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebEncurtadorDeUrl
{
    public partial class Redirecionador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string dominio = Request.Url.Host;

            if (dominio.ToLower().Contains("localhost"))
            {
                dominio = "http://www.centauro.com.br";
            }

            if (Request.QueryString != null && Request.QueryString.Count > 0)
            {
                if (Page.RouteData.Values["url"] != null)
                {
                    try
                    {
                        br.com.devdream.encurtador.vo.Url url = new br.com.devdream.encurtador.vo.Url();

                        url = br.com.devdream.encurtador.bo.Url.Obter(Page.RouteData.Values["url"].ToString());

                        if (url.Original == "http://")
                        {
                            Response.Redirect(dominio, true);
                        }

                        string queryString = string.Empty;

                        foreach (string chave in Request.QueryString)
                        {
                            if (queryString == string.Empty)
                            {
                                queryString = string.Format("{0}={1}", chave, Request.QueryString[chave]);
                            }
                            else
                            {
                                queryString += string.Format("&{0}={1}", chave, Request.QueryString[chave]);
                            }
                        }

                        if (url.Original != string.Empty)
                        {
                            string ip = Request.UserHostAddress;

                            if (url.Original.Contains("?"))
                            {
                                url.Original += "&" + queryString;
                            }
                            else
                            {
                                url.Original += "?" + queryString;
                            }

                            br.com.devdream.encurtador.bo.Url.ContabilizarAcesso(url, ip);


                            Response.Redirect(url.Original);
                        }
                        else
                        {
                            Response.Write("URL Inválida!");
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.ToString());
                        Response.Redirect(dominio);
                    }
                }
            }
            else
            {
                Response.Redirect(dominio);
            }
        }
    }
}