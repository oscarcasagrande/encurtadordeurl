using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace WebEncurtadorDeUrl.Adm
{
    /// <summary>
    /// Summary description for Api
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Api : System.Web.Services.WebService
    {

        [WebMethod]
        public string EncurtarUrl(string endereco)
        {
            string resultado = string.Empty;

            try
            {
                string chave = br.com.devdream.encurtador.bo.Url.Criar(endereco, Context.Request.UserHostAddress);
                br.com.devdream.encurtador.vo.Url url = new br.com.devdream.encurtador.vo.Url();
                url = br.com.devdream.encurtador.bo.Url.Obter(chave);
                resultado = url.Encurtada;
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return resultado;
        }
    }
}
