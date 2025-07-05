/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.oracle.wls.shaded.org.apache.xalan.xsltc.compiler.Parser;
import dao.HouseHoldDAO;
import dao.HouseholdMemberDAO;
import dao.NotificationDAO;
import dao.RegistrationDAO;
import dao.UserDAO;
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
import model.User;

/**
 *
 * @author he181
 */
public class OfficialController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            request.getRequestDispatcher("view/official/official-home.jsp").forward(request, response);
        } else if (action.equals("listUsers")) {
            listUsers(request, response);
        } else if (action.equals("listRegistrations")) {
            listRegistrationsJoinHousehold(request, response);
        } else if (action.equals("listApproved")) {
            listApproved(request, response);
        } else if (action.equals("listRejected")) {
            listRejected(request, response);
        } else if (action.equals("listHouseHold")) {
            listHouseHold(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "search":
                search(request, response);

                break;
            case "insert":
                insert(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "approveRegistration":
                approveRegistration(request, response);
                break;
            case "showHouseholdMember":
                showHouseholdMember(request, response);
                break;

            case "insertHousehold":
                insertHousehold(request, response);
                break;

            case "deleteHousehold":
                deleteHousehold(request, response);
                break;

            case "changeHeadOfHouseholdCccd":
                changeHeadOfHouseholdCccd(request, response);
                break;
            case "updateHouseholdMember":
                updateHouseholdMember(request, response);
                break;

            case "deleteHouseholdMember":
                deleteHouseholdMember(request, response);
                break;
            case "insertHouseholdMember":
                insertHouseholdMember(request, response);
                break;
            case "rejectRegistration":
                rejectRegistration(request, response);
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
            out.println("<title>Servlet OfficialController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OfficialController at " + request.getContextPath() + "</h1>");
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

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int addressId = Integer.parseInt(request.getParameter("addressId"));
        ArrayList<User> users = UserDAO.findAllUserByAddressId(addressId);
        request.setAttribute("listUsers", users);
        request.getRequestDispatcher("view/official/users.jsp").forward(request, response);
    }

    private void listRegistrationsJoinHousehold(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int addressId = Integer.parseInt(request.getParameter("addressId"));
        ArrayList<Registration> list = RegistrationDAO.findAllRegistrationIsPendingInAddressId(addressId);
        request.setAttribute("listRegistrations", list);
        request.getRequestDispatcher("view/official/listRegistration.jsp").forward(request, response);
    }

    private void listApproved(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int addressId = Integer.parseInt(request.getParameter("addressId"));
        ArrayList<Registration> list = RegistrationDAO.findAllRegistrationIsApproveInAddressId(addressId);
        request.setAttribute("listRegistrations", list);
        request.getRequestDispatcher("view/official/registration-approved.jsp").forward(request, response);

    }

    private void listRejected(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int addressId = Integer.parseInt(request.getParameter("addressId"));
        ArrayList<Registration> list = RegistrationDAO.findAllRegistrationIsRejectInAddressId(addressId);

        request.setAttribute("listRegistrations", list);
        request.getRequestDispatcher("view/official/registration-rejected.jsp").forward(request, response);
    }

    private void listHouseHold(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int addressId = Integer.parseInt(request.getParameter("addressId"));
        ArrayList<HouseHold> list = HouseHoldDAO.findAllInAddressId(addressId);
        request.setAttribute("listHouseHold", list);
        request.getRequestDispatcher("view/official/household.jsp").forward(request, response);
    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int addressId = Integer.parseInt(request.getParameter("addressId"));
        String keywords = request.getParameter("keywords");

        ArrayList<User> users = UserDAO.findByKeywordsInAddressId(keywords, addressId);
        request.setAttribute("listUsers", users);
        request.getRequestDispatcher("view/official/users.jsp").forward(request, response);
    }

    private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        String fullName = request.getParameter("fullName");
        String birthday = request.getParameter("birthday");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        int addressId = Integer.parseInt(request.getParameter("addressId"));
        User user = new User(cccd, fullName, birthday, email, phoneNumber, gender, password, roleId, addressId);
        UserDAO.insert(user);
        ArrayList<User> users = UserDAO.findAllUserByAddressId(addressId);
        request.setAttribute("listUsers", users);
        request.getRequestDispatcher("view/official/users.jsp").forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String cccd = request.getParameter("cccd");
        String fullName = request.getParameter("fullName");
        String birthday = request.getParameter("birthday");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        int addressId = Integer.parseInt(request.getParameter("addressId"));
        User user = new User(cccd, fullName, birthday, email, phoneNumber, gender, password, roleId, addressId);
        UserDAO.update(user);
        ArrayList<User> users = UserDAO.findAllUserByAddressId(addressId);
        request.setAttribute("listUsers", users);
        request.getRequestDispatcher("view/official/users.jsp").forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        int addressId = Integer.parseInt(request.getParameter("addressId"));
        UserDAO.delete(cccd);
        ArrayList<User> users = UserDAO.findAllUserByAddressId(addressId);
        request.setAttribute("listUsers", users);
        request.getRequestDispatcher("view/official/users.jsp").forward(request, response);
    }

    private void approveRegistration(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Registration> list = new ArrayList<>();
        String registrationType = request.getParameter("registrationType");
        //sau khi lấy về thông tin 
        //kiểm tra loại đơn chia ra dễ làm
        int addressId = Integer.parseInt(request.getParameter("addressId"));
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
            list = RegistrationDAO.findAllRegistrationIsApproveInAddressId(addressId);
            request.setAttribute("listRegistrations", list);
            request.getRequestDispatcher("view/official/registration-approved.jsp").forward(request, response);
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
            list = RegistrationDAO.findAllRegistrationIsApproveInAddressId(addressId);
            request.setAttribute("listRegistrations", list);
            request.getRequestDispatcher("view/official/registration-approved.jsp").forward(request, response);
            return;
        } else if (registrationType.equals("Tách hộ khẩu")) {
            String registrationId = request.getParameter("registrationId");
            String approvedBy = request.getParameter("approvedBy");
            String cccd = request.getParameter("cccd");

            // khi mà đơn ý được duyệt tức đã nằm trong 1 hộ khẩu và kp chủ hộ lúc này chỉ cần thực hiện xóa người đó ra khỏi hộ khẩu đó
            HouseholdMemberDAO.delete(cccd);

            NotificationDAO.sentToCccd(cccd, "Đơn tách hộ khẩu của bạn đã được duyệt!");
            RegistrationDAO.acceptById(registrationId, approvedBy);
            list = RegistrationDAO.findAllRegistrationIsApproveInAddressId(addressId);
            request.setAttribute("listRegistrations", list);
            request.getRequestDispatcher("view/official/registration-approved.jsp").forward(request, response);
            return;
        } else if (registrationType.equals("Chuyển hộ khẩu")) {
            String registrationId = request.getParameter("registrationId");
            String approvedBy = request.getParameter("approvedBy");
            String cccd = request.getParameter("cccd");
            int newAddressId = Integer.parseInt(request.getParameter("newAddressId"));

            //update địa chỉ mới thôi
            HouseHoldDAO.updateAddress(cccd, newAddressId);
            NotificationDAO.sentToCccd(cccd, "Đơn tách hộ khẩu của bạn đã được duyệt!");
            RegistrationDAO.acceptById(registrationId, approvedBy);
            list = RegistrationDAO.findAllRegistrationIsApproveInAddressId(addressId);
            request.setAttribute("listRegistrations", list);
            request.getRequestDispatcher("view/official/registration-approved.jsp").forward(request, response);
            return;
        }

    }

    private void showHouseholdMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int householdId = Integer.parseInt(request.getParameter("householdId"));
        ArrayList<HouseholdMember> list = HouseholdMemberDAO.findByHouseholdId(householdId);
        request.getSession().setAttribute("householdId", householdId);
        request.setAttribute("listHouseholdMember", list);
        request.getRequestDispatcher("view/official/household-member.jsp").forward(request, response);
    }

    private void insertHousehold(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        String createDate = request.getParameter("startDate");
        int addressId = Integer.parseInt(request.getParameter("addressId"));

        if (HouseholdMemberDAO.findByCccd(cccd) != null) {
            String error = "Công dân này đã có hộ khẩu!";
            request.setAttribute("error", error);
            ArrayList<HouseHold> list = HouseHoldDAO.findAllInAddressId(addressId);
            request.setAttribute("listHouseHold", list);
            request.getRequestDispatcher("view/official/household.jsp").forward(request, response);
            return;
        }

        HouseHold h = new HouseHold(cccd, addressId, createDate);
        HouseHoldDAO.insertHousehold(h);

        HouseholdMember hm = new HouseholdMember(HouseHoldDAO.findByCccd(cccd).getHouseHoldId(), "Chủ hộ", cccd);
        HouseholdMemberDAO.insert(hm);
        ArrayList<HouseHold> list = HouseHoldDAO.findAllInAddressId(addressId);
        request.setAttribute("listHouseHold", list);
        request.getRequestDispatcher("view/official/household.jsp").forward(request, response);

    }

    private void deleteHousehold(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int householdId = Integer.parseInt(request.getParameter("householdId"));

        int addressId = Integer.parseInt(request.getParameter("addressId"));
        if (!HouseholdMemberDAO.findByHouseholdId(householdId).isEmpty()) {
            String error = "Chưa thể xóa hộ khẩu này hãy thực hiện xóa hết thành viên trước!";
            request.setAttribute("error", error);
            request.setAttribute("listHouseHold", HouseHoldDAO.findAllInAddressId(addressId));
            request.getRequestDispatcher("view/official/household.jsp").forward(request, response);
            return;
        }

        HouseHoldDAO.delete(householdId);
        request.setAttribute("listHouseHold", HouseHoldDAO.findAllInAddressId(addressId));
        request.getRequestDispatcher("view/official/household.jsp").forward(request, response);
        return;

    }

    private void changeHeadOfHouseholdCccd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int householdId = Integer.parseInt(request.getParameter("householdId"));
        int addressId = Integer.parseInt(request.getParameter("addressId"));

        if (HouseholdMemberDAO.countHeadOfHousehold(householdId) != 1) {
            String error = "Hiện đang có nhiều hơn 1 chủ hộ!";
            request.setAttribute("error", error);
            request.setAttribute("listHouseholdMember", HouseholdMemberDAO.findByHouseholdId(householdId));
            request.getRequestDispatcher("view/official/household-member.jsp").forward(request, response);
            return;
        }

        HouseHoldDAO.updateHeadOfHousehold(HouseholdMemberDAO.findHeadOfHousehold(householdId).getCccd(), householdId);
        ArrayList<HouseHold> list = HouseHoldDAO.findAllInAddressId(addressId);
        request.setAttribute("listHouseHold", list);
        request.getRequestDispatcher("view/official/household.jsp").forward(request, response);

    }

    private void updateHouseholdMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        String relationship = request.getParameter("relationship");
        int householdId = Integer.parseInt(request.getParameter("householdId"));

        String error;

        if (relationship == "") {
            error = "Hãy chọn quan hệ!";
            request.setAttribute("error", error);
            request.setAttribute("listHouseholdMember", HouseholdMemberDAO.findByHouseholdId(householdId));
            request.getRequestDispatcher("view/official/household-member.jsp").forward(request, response);
            return;
        }
        HouseholdMember hm = new HouseholdMember(householdId, relationship, cccd);
        HouseholdMemberDAO.update(hm);
        request.setAttribute("listHouseholdMember", HouseholdMemberDAO.findByHouseholdId(householdId));
        request.getRequestDispatcher("view/official/household-member.jsp").forward(request, response);
        return;
    }

    private void deleteHouseholdMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        String relationship = request.getParameter("relationship");
        int householdId = Integer.parseInt(request.getParameter("householdId"));
        HouseholdMemberDAO.delete(cccd, relationship);
        request.setAttribute("listHouseholdMember", HouseholdMemberDAO.findByHouseholdId(householdId));
        request.getRequestDispatcher("view/official/household-member.jsp").forward(request, response);
        return;
    }

    private void insertHouseholdMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        String relationship = request.getParameter("relationship");
        int householdId = Integer.parseInt(request.getParameter("householdId"));
        String error;
        if (UserDAO.findByCccd(cccd) == null) {
            error = "Số cccd không tồn tại!";
            request.setAttribute("error", error);
            request.setAttribute("listHouseholdMember", HouseholdMemberDAO.findByHouseholdId(householdId));
            request.getRequestDispatcher("view/official/household-member.jsp").forward(request, response);
            return;
        }

        //nếu relationship khác với tạm trú và lưu trú ko thêm đc nữa
        if (relationship.equals("Tạm trú") || relationship.equals("Lưu trú tạm thời")) {

            if (HouseholdMemberDAO.findByCccd(cccd, relationship) != null) {
                error = "Số cccd này đã tạm trú/lưu trú hộ khẩu khác!";
                request.setAttribute("error", error);
                request.setAttribute("listHouseholdMember", HouseholdMemberDAO.findByHouseholdId(householdId));
                request.getRequestDispatcher("view/official/household-member.jsp").forward(request, response);
                return;
            }
            HouseholdMember hm2 = new HouseholdMember(householdId, relationship, cccd);
            HouseholdMemberDAO.insert(hm2);
            request.setAttribute("listHouseholdMember", HouseholdMemberDAO.findByHouseholdId(householdId));
            request.getRequestDispatcher("view/official/household-member.jsp").forward(request, response);

        } else {
            if (HouseholdMemberDAO.findByCccd(cccd) != null) {
                error = "Số cccd này đã thuộc hộ khẩu khác!";
                request.setAttribute("error", error);
                request.setAttribute("listHouseholdMember", HouseholdMemberDAO.findByHouseholdId(householdId));
                request.getRequestDispatcher("view/official/household-member.jsp").forward(request, response);
                return;
            }
            if (relationship == "") {
                error = "Hãy chọn quan hệ!";
                request.setAttribute("error", error);
                request.setAttribute("listHouseholdMember", HouseholdMemberDAO.findByHouseholdId(householdId));
                request.getRequestDispatcher("view/official/household-member.jsp").forward(request, response);
                return;
            }
            HouseholdMember hm2 = new HouseholdMember(householdId, relationship, cccd);
            HouseholdMemberDAO.insert(hm2);
            request.setAttribute("listHouseholdMember", HouseholdMemberDAO.findByHouseholdId(householdId));
            request.getRequestDispatcher("view/official/household-member.jsp").forward(request, response);
        }
    }

    private void rejectRegistration(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Registration> list = new ArrayList<>();
        String registrationId = request.getParameter("registrationId");
        String comments = request.getParameter("comments");
        int addressId = Integer.parseInt(request.getParameter("addressId"));
        RegistrationDAO.reject(registrationId, comments);
        list = RegistrationDAO.findAllRegistrationIsRejectInAddressId(addressId);

        // gửi thông báo
        String cccd = request.getParameter("cccd");
        String msgFromRejecter = request.getParameter("comments");
        String msg = "Đơn của bạn bị từ chối vì: " + msgFromRejecter;
        NotificationDAO.sentToCccd(cccd, msg);

        request.setAttribute("listRegistrations", list);
        request.getRequestDispatcher("view/official/registration-rejected.jsp").forward(request, response);
    }

}
