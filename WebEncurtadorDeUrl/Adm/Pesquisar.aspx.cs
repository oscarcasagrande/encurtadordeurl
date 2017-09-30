using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebEncurtadorDeUrl
{
    public partial class Pesquisar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PesquisarButton_Click(object sender, EventArgs e)
        {
            if (UrlEncurtadaTextBox.Text.Length > 0)
            {
                br.com.devdream.encurtador.vo.Url url = br.com.devdream.encurtador.bo.Url.Obter(UrlEncurtadaTextBox.Text.Substring(UrlEncurtadaTextBox.Text.LastIndexOf("/"), UrlEncurtadaTextBox.Text.Length - UrlEncurtadaTextBox.Text.LastIndexOf("/")).Replace("/", ""));
                if (url.Original != string.Empty)
                {
                    UrlEncurtadaHyperLink.NavigateUrl = UrlEncurtadaHyperLink.Text = url.Encurtada;
                    UrlOriginalTextBox.Text = url.Original;
                }
            }
        }
    }
}