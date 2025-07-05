/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import model.User;

/**
 *
 * @author he181
 */
public class AuthController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Không tạo mới session nếu chưa có
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        String action = request.getParameter("action");
        if (action == null) {
            if (user == null) {
                request.getRequestDispatcher("view/commons/login.jsp").forward(request, response);

            } else {
                response.sendRedirect("/citizen");
            }
        } else if (action.equals("register")) {
            request.getRequestDispatcher("view/commons/register.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            response.sendRedirect("auth");
            return;
        }

        switch (action) {
            case "login":
                handleLogin(request, response);
                break;
            case "logout":
                handleLogout(request, response);
                break;
            case "register":
                handleRegister(request, response);
                break;
            default:
                response.sendRedirect("auth");
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        String password = request.getParameter("password");

        User user = UserDAO.findAndJoinByCccdAndPassword(cccd, password);
        if (user == null) {
            request.setAttribute("error", "Sai số CCCD hoặc mật khẩu!");
            request.getRequestDispatcher("/view/commons/login.jsp").forward(request, response);
            return;
        }
        if (!user.getIsActive()) {
            request.setAttribute("error", "Tài khoản của bạn chưa được kích hoạt");
            request.getRequestDispatcher("/view/commons/login.jsp").forward(request, response);
            return;
        }
        

        // Đăng nhập thành công -> Lưu vào session
        HttpSession session = request.getSession(true);
        session.setAttribute("user", user);

        response.sendRedirect("citizen");
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Hủy session
        }
        response.sendRedirect("auth");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String error;
        User user = UserDAO.findByCccd(cccd);
        if (user == null) {
            error = "Số căn cước không hợp lệ!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("view/commons/register.jsp").forward(request, response);
            return;
        }
        if (!password.equals(confirmPassword)) {
            error = "Mật khẩu không trùng khớp!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("view/commons/register.jsp").forward(request, response);
            return;
        }
        if (user.getIsActive()) {
            request.setAttribute("error", "Tài khoản của bạn đã được kích hoạt trước đó");
            request.getRequestDispatcher("/view/commons/register.jsp").forward(request, response);
            return;
        }
        UserDAO.activeAccount(cccd, password);
        error = "Tài khoản đã được kích hoạt!";
        request.setAttribute("error", error);
        request.getRequestDispatcher("view/commons/register.jsp").forward(request, response);
        return;
    }

}
