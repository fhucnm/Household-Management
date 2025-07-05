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
import model.HouseHold;
import model.HouseholdMember;
import model.PendingHouseholds;
import model.Registration;

/**
 *
 * @author he181
 */
public class HouseHoldController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "insert":
                submitApplication(request, response);
                break;
            case "find":
                findByCccd(request, response);
                break;
            case "showMember":
                showMemberByHouseholdId(request, response);
                break;
            case "create":
                createHousehold(request, response);
                break;
            case "split":
                splitHousehold(request, response);
                break;
            case "transfer":
                transferHousehold(request, response);
                break;
            default:
                throw new AssertionError();
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
            out.println("<title>Servlet HouseHoldController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HouseHoldController at " + request.getContextPath() + "</h1>");
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

    private void submitApplication(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String headOfHouseHoldCccd = request.getParameter("headOfHouseHoldCccd");
        String startDate = request.getParameter("startDate");
        String memberCccd = request.getParameter("cccd");
        String relationship = request.getParameter("relationship");
        String registrationType = request.getParameter("registrationType");

        if (registrationType.equals("Tạm thời") || registrationType.equals("Lưu trú tạm thời")) {
            HouseHold h = HouseHoldDAO.findByCccd(headOfHouseHoldCccd);
            if (h == null) {
                String error = "Không tìm thấy hộ khẩu mà bạn muốn nhập vào!";
                request.setAttribute("error", error);
                request.getRequestDispatcher("view/homePage/home.jsp").forward(request, response);
                return;
            }
            HouseholdMember hm = HouseholdMemberDAO.findByCccd2(memberCccd, headOfHouseHoldCccd);
            if (hm != null) {
                String error = "Hiện đang thường trú tại hộ khẩu này!";
                request.setAttribute("error", error);
                request.getRequestDispatcher("view/homePage/home.jsp").forward(request, response);
                return;
            }
            if (registrationType.equals("Tạm thời")) {
                relationship = "Tạm trú";
            }else{
                relationship = "Lưu trú tạm thời";
            }
            HouseholdMember hm3 = HouseholdMemberDAO.findByCccd(memberCccd, relationship);
            if (hm3 != null) {
                 String error = "Hiện đang tạm trú/lưu trú tại hộ khẩu không thể tạm trú/lưu trú tiếp!";
                request.setAttribute("error", error);
                request.getRequestDispatcher("view/homePage/home.jsp").forward(request, response);
                return;
            }
            
            
            // sau khi công dân gửi đơn lưu vào bảng registration chờ duyệt
            Registration reg = new Registration(memberCccd, registrationType, startDate);
            RegistrationDAO.insert(reg);

            //lấy ra đơn mới nhất của người vừa đăng kí
            String status = "Đang chờ xử lý";
            Registration regLast = RegistrationDAO.findLastByCccd(memberCccd);

            // lưu những thông tin vừa nhập trong đơn vào pendingHouseHold để sau này sử dụng 
            PendingHouseholds ph = new PendingHouseholds(regLast.getRegistrationId(), headOfHouseHoldCccd, h.getAddressId(), relationship, memberCccd, startDate);
            HouseHoldDAO.insertForPending(ph);

            // chưa được duyệt luôn chuyển đến trang thông báo
            String msg = "Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.";
            NotificationDAO.sentToCccd(memberCccd, msg);
            request.getRequestDispatcher("view/citizens/notification.jsp").forward(request, response);
            return;

        } else {
            HouseHold h = HouseHoldDAO.findByCccd(headOfHouseHoldCccd);
            if (h == null) {
                String error = "Không tìm thấy hộ khẩu mà bạn muốn nhập vào!";
                request.setAttribute("error", error);
                request.getRequestDispatcher("view/homePage/home.jsp").forward(request, response);
                return;
            }

            HouseholdMember hm = HouseholdMemberDAO.findByCccd(memberCccd);
            if (hm != null) {
                String error = "Hiện bạn đã có hộ khẩu không thể thực hiện chức năng này hãy tách khỏi hộ khẩu hiện tại trước!";
                request.setAttribute("error", error);
                request.getRequestDispatcher("view/homePage/home.jsp").forward(request, response);
                return;
            }

            // sau khi công dân gửi đơn lưu vào bảng registration chờ duyệt
            Registration reg = new Registration(memberCccd, registrationType, startDate);
            RegistrationDAO.insert(reg);

            //lấy ra đơn mới nhất của người vừa đăng kí
            String status = "Đang chờ xử lý";
            Registration regLast = RegistrationDAO.findLastByCccd(memberCccd);

            // lưu những thông tin vừa nhập trong đơn vào pendingHouseHold để sau này sử dụng 
            PendingHouseholds ph = new PendingHouseholds(regLast.getRegistrationId(), headOfHouseHoldCccd, h.getAddressId(), relationship, memberCccd, startDate);
            HouseHoldDAO.insertForPending(ph);

            // chưa được duyệt luôn chuyển đến trang thông báo
            String msg = "Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.";
            NotificationDAO.sentToCccd(memberCccd, msg);
            request.getRequestDispatcher("view/citizens/notification.jsp").forward(request, response);
            return;
        }

    }

    private void findByCccd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String headOfHouseholdCccd = request.getParameter("headOfHouseholdCccd");
        HouseHold household = HouseHoldDAO.findByCccd(headOfHouseholdCccd);
        request.setAttribute("household", household);
        request.getRequestDispatcher("view/admin/admin-household.jsp").forward(request, response);

    }

    private void showMemberByHouseholdId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int householdId = Integer.parseInt(request.getParameter("householdId"));
        ArrayList<HouseholdMember> list = HouseholdMemberDAO.findByHouseholdId(householdId);
        request.getSession().setAttribute("householdId", householdId);
        request.setAttribute("listHouseholdMember", list);
        request.getRequestDispatcher("view/admin/admin-household-member.jsp").forward(request, response);
    }

    private void createHousehold(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        String regisType = request.getParameter("registrationType");
        String createDate = request.getParameter("startDate");
        int addressId = Integer.parseInt(request.getParameter("addressId"));

        HouseholdMember hm = HouseholdMemberDAO.findByCccd(cccd);
        if (hm != null) {
            String error = "Hiện bạn đã có hộ khẩu không thể thực hiện chức năng này!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("view/homePage/home.jsp").forward(request, response);
            return;
        }

        // tạo đơn mới
        Registration reg = new Registration(cccd, regisType, createDate);
        RegistrationDAO.insert(reg);

        Registration regLast = RegistrationDAO.findLastByCccd(cccd);
        // lưu thông tin vào pendingHousehold
        PendingHouseholds ph = new PendingHouseholds(regLast.getRegistrationId(), cccd, addressId, "Chủ hộ", cccd, createDate);
        HouseHoldDAO.insertForPending(ph);

        String msg = "Đơn của bạn đã được gửi đi và sẽ được duyệt trong 24h tới.";
        NotificationDAO.sentToCccd(cccd, msg);
        request.getRequestDispatcher("view/citizens/notification.jsp").forward(request, response);

    }

    private void splitHousehold(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");

        HouseholdMember hm = HouseholdMemberDAO.findByCccd(cccd);
        if (hm == null) {
            String error = "Hiện bạn chưa có hộ khẩu không thể thực hiện tách hộ khẩu!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("view/homePage/home.jsp").forward(request, response);
            return;
        }
        if (hm.getRelationship().equals("Chủ hộ")) {
            String error = "Hiện tại web chưa hỗ trợ chủ hộ tách hộ khẩu";
            request.setAttribute("error", error);
            request.getRequestDispatcher("view/homePage/home.jsp").forward(request, response);
            return;
        }

        String registrationType = request.getParameter("registrationType");
        String createDate = request.getParameter("startDate");
        String householdType = request.getParameter("householdType");

        if (householdType.equals("Tạm trú") || householdType.equals("Lưu trú tạm thời")) {
            // xóa khỏi hộ khẩu tạm trú hoặc lưu trú
            // tạo đơn gửi cho officals hoặc admin;
            Registration reg = new Registration(cccd, registrationType, createDate);
            RegistrationDAO.insert(reg);
            HouseholdMember hm2 = HouseholdMemberDAO.findByCccd(cccd, householdType);

            if (hm2 == null) {
                String error = "Hiện tại không trong hộ khẩu tạm trú, lưu trú nào";
                request.setAttribute("error", error);
                request.getRequestDispatcher("view/homePage/home.jsp").forward(request, response);
                return;
            }
            Registration regLast = RegistrationDAO.findLastByCccd(cccd);

            HouseHold h = HouseHoldDAO.findByHouseholdID(hm2.getHouseholdId());
            // lưu thông tin vào pendingHousehold
            PendingHouseholds ph = new PendingHouseholds();
            ph.setRegistrationId(regLast.getRegistrationId());
            ph.setHeadOfHouseholdCccd(cccd);
            ph.setCccd(cccd);
            ph.setCreateDate(createDate);
            ph.setRelationship(householdType);
            ph.setAddressId(h.getAddressId());
            HouseHoldDAO.insertForPending(ph);

            NotificationDAO.sentToCccd(cccd, "Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới");
            request.getRequestDispatcher("view/citizens/notification.jsp").forward(request, response);

        } else {
            Registration reg = new Registration(cccd, registrationType, createDate);
            RegistrationDAO.insert(reg);

            Registration regLast = RegistrationDAO.findLastByCccd(cccd);

            HouseHold h = HouseHoldDAO.findByHouseholdID(hm.getHouseholdId());
            // lưu thông tin vào pendingHousehold
            PendingHouseholds ph = new PendingHouseholds();
            ph.setRegistrationId(regLast.getRegistrationId());
            ph.setHeadOfHouseholdCccd(cccd);
            ph.setCccd(cccd);
            ph.setCreateDate(createDate);
            ph.setRelationship(hm.getRelationship());
            ph.setAddressId(h.getAddressId());
            HouseHoldDAO.insertForPending(ph);

            NotificationDAO.sentToCccd(cccd, "Đơn tách hộ khẩu đã được gửi đi chờ xử lý trong 24h tới");
            request.getRequestDispatcher("view/citizens/notification.jsp").forward(request, response);
        }

    }

    private void transferHousehold(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        String registrationType = request.getParameter("registrationType");
        String createDate = request.getParameter("startDate");
        int newAddressId = Integer.parseInt(request.getParameter("newAddressId"));

        HouseholdMember hm = HouseholdMemberDAO.findByCccd(cccd);

        if (hm != null && hm.getRelationship().equals("Chủ hộ")) {
            Registration reg = new Registration(cccd, registrationType, createDate);

            RegistrationDAO.insert(reg);
            Registration regLast = RegistrationDAO.findLastByCccd(cccd);
            PendingHouseholds ph = new PendingHouseholds(regLast.getRegistrationId(), cccd, newAddressId, "Chủ hộ", cccd, createDate);
            HouseHoldDAO.insertForPending(ph);

            NotificationDAO.sentToCccd(cccd, "Đơn của bạn đã được gửi đi chờ xử lý trong 24h tới");
            request.getRequestDispatcher("view/citizens/notification.jsp").forward(request, response);

        }

        String error = "Bạn không thể thực chức năng này khi không phải là chủ hộ khẩu!";
        request.setAttribute("error", error);
        request.getRequestDispatcher("view/homePage/home.jsp").forward(request, response);

    }
}
