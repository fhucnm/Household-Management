/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.HouseHoldDAO;
import dao.HouseholdMemberDAO;
import dao.NotificationDAO;
import dao.RegistrationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import static java.util.Collections.list;
import model.HouseHold;
import model.HouseholdMember;
import model.PendingHouseholds;
import model.Registration;

/**
 *
 * @author he181
 */
public class RegistrationController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String registrationType = "";
        if (action.equals("permanent")) {

            registrationType = "Dài hạn";
            request.setAttribute("registrationType", registrationType);
            request.getRequestDispatcher("view/citizens/registration-form.jsp").forward(request, response);
        } else if (action.equals("temporary")) {
            registrationType = "Tạm thời";
            request.setAttribute("registrationType", registrationType);
            request.getRequestDispatcher("view/citizens/registration-form.jsp").forward(request, response);
        } else if (action.equals("temporaryStay")) {
            registrationType = "Lưu trú tạm thời";
            request.setAttribute("registrationType", registrationType);
            request.getRequestDispatcher("view/citizens/registration-form.jsp").forward(request, response);
        } else if (action.equals("createHousehold")) {
            registrationType = "Tạo hộ khẩu";
            request.setAttribute("registrationType", registrationType.trim());
            request.getRequestDispatcher("view/citizens/registration-create-form.jsp").forward(request, response);
        } else if (action.equals("splitHousehold")) {
            registrationType = "Tách hộ khẩu";
            request.setAttribute("registrationType", registrationType.trim());
            request.getRequestDispatcher("view/citizens/registration-split-household.jsp").forward(request, response);
        } else if (action.equals("transferHousehold")) {
            registrationType = "Chuyển hộ khẩu";
            request.setAttribute("registrationType", registrationType.trim());
            request.getRequestDispatcher("view/citizens/registration-transfer-household.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "insert":
                insert(request, response);
                break;
            case "accept":
                accept(request, response);
                break;
            case "reject":

                reject(request, response);
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
            out.println("<title>Servlet RegistrationController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrationController at " + request.getContextPath() + "</h1>");
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

    private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        String registrationType = request.getParameter("registrationType");
        String startDate = request.getParameter("startDate");

        Registration reg = new Registration(cccd, registrationType, startDate);
        RegistrationDAO.insert(reg);
        String message = "Đơn của bạn đã được gửi!";
        request.setAttribute("message", message);
        request.getRequestDispatcher("view/citizens/registration-form.jsp").forward(request, response);
    }

    private void accept(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Registration> list = new ArrayList<>();
        String registrationType = request.getParameter("registrationType");
        //sau khi lấy về thông tin 
        //kiểm tra loại đơn chia ra dễ làm

        //TH1(nếu là dạng nhập hộ khẩu):
        if (registrationType.equals("Dài hạn")
                || registrationType.equals("Tạm thời")
                || registrationType.equals("Lưu trú tạm thời")) {
            String registrationId = request.getParameter("registrationId");
            String approvedBy = request.getParameter("approvedBy");
            String headOfHouseholdCccd = request.getParameter("headOfHouseholdCccd");
            String relationship = request.getParameter("relationship");
            String cccd = request.getParameter("cccd");

            // nếu 1 trong 3 loại này thì chỉ cần lấy thông tin trước lưu ở PendingHousehold
            // insert vào bảng chính và gửi thông báo đến người làm đơn
            PendingHouseholds ph = HouseHoldDAO.PendingHouseholdFindByRegId(registrationId);

            //tìm hộ khẩu muốn nhập vào chắc chắn có
            HouseHold h = HouseHoldDAO.findByCccd(headOfHouseholdCccd);
            HouseholdMember hm = new HouseholdMember(h.getHouseHoldId(), relationship, cccd);
            HouseholdMemberDAO.insert(hm);

            //insert hoàn tất gửi thông báo rồi chuyển trang
            NotificationDAO.sentToCccd(cccd, "Đơn của bạn đã được duyệt!");
            RegistrationDAO.acceptById(registrationId, approvedBy);
            list = RegistrationDAO.findAllRegistrationIsApprove();
            request.setAttribute("listRegistrations", list);
            request.getRequestDispatcher("view/admin/registration-approved.jsp").forward(request, response);
            return;
        } else if (registrationType.equals("Tạo hộ khẩu")) {
            String registrationId = request.getParameter("registrationId");
            String approvedBy = request.getParameter("approvedBy");
            String headOfHouseholdCccd = request.getParameter("headOfHouseholdCccd");
            String relationship = request.getParameter("relationship");
            String cccd = request.getParameter("cccd");

            PendingHouseholds ph = HouseHoldDAO.PendingHouseholdFindByRegId(registrationId);
            HouseHold h = new HouseHold(headOfHouseholdCccd, ph.getAddressId(), ph.getCreateDate());
            HouseHoldDAO.insertHousehold(h);

            //sau khi insert household rồi thì lấy id của household mới đó để insert cho bảng member
            HouseHold household = HouseHoldDAO.findByCccd(headOfHouseholdCccd);

            // tạo mới nên relationship chắc chắn là chủ hộ
            HouseholdMember hm = new HouseholdMember(household.getHouseHoldId(), relationship, cccd);
            HouseholdMemberDAO.insert(hm);

            // hoàn tất thêm thì gửi thông báo và chuyển trang
            NotificationDAO.sentToCccd(cccd, "Đơn của bạn đã được duyệt!");
            RegistrationDAO.acceptById(registrationId, approvedBy);
            list = RegistrationDAO.findAllRegistrationIsApprove();
            request.setAttribute("listRegistrations", list);
            request.getRequestDispatcher("view/admin/registration-approved.jsp").forward(request, response);
            return;
        } else if (registrationType.equals("Tách hộ khẩu")) {
            String registrationId = request.getParameter("registrationId");
            String approvedBy = request.getParameter("approvedBy");
            String cccd = request.getParameter("cccd");
            PendingHouseholds ph = HouseHoldDAO.PendingHouseholdFindByRegId(registrationId);
            
            // khi mà đơn ý được duyệt tức đã nằm trong 1 hộ khẩu và kp chủ hộ lúc này chỉ cần thực hiện xóa người đó ra khỏi hộ khẩu đó
            HouseholdMemberDAO.delete(cccd, ph.getRelationship());

            NotificationDAO.sentToCccd(cccd, "Đơn tách hộ khẩu của bạn đã được duyệt!");
            RegistrationDAO.acceptById(registrationId, approvedBy);
            list = RegistrationDAO.findAllRegistrationIsApprove();
            request.setAttribute("listRegistrations", list);
            request.getRequestDispatcher("view/admin/registration-approved.jsp").forward(request, response);
            return;
        } else if (registrationType.equals("Chuyển hộ khẩu")) {
            String registrationId = request.getParameter("registrationId");
            String approvedBy = request.getParameter("approvedBy");
            String cccd = request.getParameter("cccd");
            int addressId = Integer.parseInt(request.getParameter("addressId"));

            //update địa chỉ mới thôi
            HouseHoldDAO.updateAddress(cccd, addressId);
            NotificationDAO.sentToCccd(cccd, "Đơn tách hộ khẩu của bạn đã được duyệt!");
            RegistrationDAO.acceptById(registrationId, approvedBy);
            list = RegistrationDAO.findAllRegistrationIsApprove();
            request.setAttribute("listRegistrations", list);
            request.getRequestDispatcher("view/admin/registration-approved.jsp").forward(request, response);
            return;
        }

    }

    private void reject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Registration> list = new ArrayList<>();
        String registrationId = request.getParameter("registrationId");
        String comments = request.getParameter("comments");
        RegistrationDAO.reject(registrationId, comments);
        list = RegistrationDAO.findAllRegistrationIsReject();

        // gửi thông báo
        String cccd = request.getParameter("cccd");
        String msgFromRejecter = request.getParameter("comments");
        String msg = "Đơn của bạn bị từ chối vì: " + msgFromRejecter;
        NotificationDAO.sentToCccd(cccd, msg);

        request.setAttribute("listRegistrations", list);
        request.getRequestDispatcher("view/admin/registration-rejected.jsp").forward(request, response);

    }

}
