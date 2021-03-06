package it.unisa.tophw.server.controller.product;

import it.unisa.tophw.server.model.beans.ProductBean;
import it.unisa.tophw.server.model.management.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletModifyRequest")
public class ServletModifyRequest extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("id_prodotto")!=null){
            int id = Integer.parseInt((String) request.getParameter("id_prodotto"));
            if(id>0) {
                ProductBean prodotto = new ProductBean();
                ProductDAO prodDao = new ProductDAO();
                prodotto = prodDao.doRetriveById(id);
                if(prodotto != null){

                    request.setAttribute("prodotto", prodotto);
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/modifyProduct.jsp");
                    dispatcher.forward(request, response);

                }
            }
        }

    }
}
