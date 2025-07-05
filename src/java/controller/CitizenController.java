/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.HouseholdMemberDAO;
import dao.RegistrationDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.HouseholdMember;
import model.Registration;
import model.User;

/**
 *
 * @author he181
 */
public class CitizenController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            request.getRequestDispatcher("view/homePage/home.jsp").forward(request, response);
        } else if (action.equals("profile")) {
            request.getRequestDispatcher("view/citizens/profile.jsp").forward(request, response);
        } else if (action.equals("registration")) {
            request.getRequestDispatcher("view/citizens/registration-form.jsp").forward(request, response);
        } else if (action.equals("notification")) {
            request.getRequestDispatcher("view/citizens/notification.jsp").forward(request, response);
        } else if (action.equals("viewRegistration")) {
            viewRegistration(request, response);
        } else if (action.equals("checkStatusRegistration")) {
            checkStatusRegistration(request, response);
        } else if (action.equals("viewSubmitcation")) {

            request.getRequestDispatcher("view/citizens/list-registration-user.jsp").forward(request, response);
        } else if (action.equals("changePassword")) {
            request.getRequestDispatcher("view/citizens/change-password.jsp").forward(request, response);
        } else if (action.equals("showHousehold")) {
            showHousehold(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {

            case "update":
                updateUserContactInfo(request, response);
                break;
            case "changePassword":
                changePassword(request, response);
                break;
            case "tamtru":
                tamtru(request, response);
                break;
            case "luutrutamthoi":
                luutrutamthoi(request, response);
                break;
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CitizenController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CitizenController at " + request.getContextPath() + "</h1>");
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

    private void updateUserContactInfo(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String cccd = request.getParameter("cccd");
        String email = request.getParameter("email");
        String phone = request.getParameter("phoneNumber");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        // Kiểm tra trùng email hoặc số điện thoại
        boolean emailExists = UserDAO.checkEmailExists(email, cccd);
        boolean phoneExists = UserDAO.checkPhoneExists(phone, cccd);

        if (emailExists) {
            request.setAttribute("error", "Email đã tồn tại, vui lòng chọn email khác.");
        } else if (phoneExists) {
            request.setAttribute("error", "Số điện thoại đã tồn tại, vui lòng chọn số khác.");
        } else {
            // Cập nhật thông tin email & số điện thoại
            UserDAO.updateContactInfo(cccd, email, phone);
            request.setAttribute("message", "Cập nhật thành công!");
            user.setEmail(email);
            user.setPhoneNumber(phone);
            session.setAttribute("user", user);
        }

        // Điều hướng lại trang thông tin người dùng
        request.getRequestDispatcher("view/citizens/profile.jsp").forward(request, response);
    }

    private void viewRegistration(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String regId = request.getParameter("registrationId");
        Registration reg = RegistrationDAO.findByRegId(regId);
        request.setAttribute("registration", reg);
        request.getRequestDispatcher("view/citizens/view-registration.jsp").forward(request, response);

    }

    private void checkStatusRegistration(HttpServletRequest request, HttpServletResponse response) {
        // kiểm tra các đơn nào đã được duyệt tìm đến insert vào householdMember

    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldPassword = request.getParameter("oldPassword");
        String cccd = request.getParameter("cccd");
        String message;
        String error;
        User user = UserDAO.findByCccdAndPassword(cccd, oldPassword);
        if (user != null) {
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            if (!confirmPassword.equals(newPassword)) {
                error = "Mật khẩu mới không khớp vui lòng nhập lại!";
                request.setAttribute("error", error);
                request.getRequestDispatcher("view/citizens/change-password.jsp").forward(request, response);
                return;
            }
            message = "Đổi mật khẩu thành công";
            UserDAO.changePassword(cccd, newPassword);
            request.setAttribute("message", message);
            request.getRequestDispatcher("view/citizens/change-password.jsp").forward(request, response);
            return;
        }

        error = "Sai mật khẩu!";
        request.setAttribute("error", error);
        request.getRequestDispatcher("view/citizens/change-password.jsp").forward(request, response);
    }

    private void showHousehold(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        HouseholdMember hm = HouseholdMemberDAO.findByCccd(cccd);

        if (hm == null) {
            String error = "Hiện chưa có hộ khẩu!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("view/homePage/home.jsp").forward(request, response);
        }

        ArrayList<HouseholdMember> list = HouseholdMemberDAO.findByHouseholdId(hm.getHouseholdId());
        request.setAttribute("list", list);
        request.getRequestDispatcher("view/citizens/showHousehold.jsp").forward(request, response);
    }

    private void tamtru(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        HouseholdMember hm = HouseholdMemberDAO.findByCccd(cccd, "Tạm trú");
        if (hm == null) {
            String error = "Hiện không tạm trú ở hộ khẩu nào!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("view/homePage/home.jsp").forward(request, response);
        }

        ArrayList<HouseholdMember> list = HouseholdMemberDAO.findByHouseholdId(hm.getHouseholdId());
        request.setAttribute("list", list);
        request.getRequestDispatcher("view/citizens/show_household_temporary.jsp").forward(request, response);

    }

    private void luutrutamthoi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        HouseholdMember hm = HouseholdMemberDAO.findByCccd(cccd, "Lưu trú tạm thời");
        if (hm == null) {
            String error = "Hiện không lưu trú ở hộ khẩu nào!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("view/homePage/home.jsp").forward(request, response);
        }
        
        ArrayList<HouseholdMember> list = HouseholdMemberDAO.findByHouseholdId(hm.getHouseholdId());
        request.setAttribute("list", list);
        request.getRequestDispatcher("view/citizens/show_household_temporary_stay.jsp").forward(request, response);
    }

}
