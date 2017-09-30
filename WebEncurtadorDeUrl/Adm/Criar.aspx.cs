using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebEncurtadorDeUrl
{
    public partial class Criar : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["url"] != null)
                {
                    if (Request.QueryString["url"] != string.Empty)
                    {
                        string url = Context.Request.Url.AbsoluteUri.Replace(string.Format("http://{0}{1}?url=", Context.Request.Url.Authority, Context.Request.Url.AbsolutePath), "");
                        ObterUrl(url, Request.UserHostAddress);
                    }
                }
            }
        }

        protected void EncurtarUrl_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("Criar.aspx?url={0}", UrlOriginalTextBox.Text));
        }

        private void ObterUrl(string endereco, string ip)
        {
            br.com.devdream.encurtador.vo.Url url = null;

            try
            {
                string chave = br.com.devdream.encurtador.bo.Url.Criar(endereco, ip);
                url = br.com.devdream.encurtador.bo.Url.Obter(chave);
            }
            catch (Exception)
            {

                throw;
            }

            UrlOriginalLabel.Text = url.Original;
            QuantidadeCaracteresUrlOriginalLabel.Text = url.Original.Trim().Length.ToString();
            QuantidadeCaracteresUrlEncurtadaLabel.Text = url.Encurtada.Length.ToString();
            UrlEncurtadaLabel.Text = url.Encurtada;
            AbraEmUmaNovaJanelaHyperLink.NavigateUrl = url.Encurtada;
            UrlOriginalTextBox.Text = url.Original;
        }
    }
}