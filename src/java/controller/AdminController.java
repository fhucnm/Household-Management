/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DBContext;
import dao.HouseHoldDAO;
import dao.HouseholdMemberDAO;
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

import model.Registration;
import model.User;

/**
 *
 * @author he181
 */
public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");

        if (action == null) {
            request.getRequestDispatcher("view/admin/admin-home.jsp").forward(request, response);
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
        ArrayList<User> list = new ArrayList<>();
        switch (action) {
            case "search":
                list = search(request, response);
                break;

            case "insert":
                list = insert(request, response);
                break;
            case "update":
                list = update(request, response);
                break;
            case "delete":
                list = delete(request, response);
                break;
            case "back":
                back(request, response);
                break;
            case "insertHouseholdMember":
                insertHouseholdMember(request, response);
                break;

            case "updateHouseholdMember":
                updateHouseholdMember(request, response);
                break;
            case "deleteHouseholdMember":
                deleteHouseholdMember(request, response);
                break;
            case "deleteHousehold":
                deleteHousehold(request, response);
                break;
            case "insertHousehold":
                insertHousehold(request, response);
                break;
            case "changeHeadOfHouseholdCccd":
                changeHeadOfHouseholdCccd(request, response);
                break;

        }
        request.setAttribute("listUsers", list);
        request.getRequestDispatcher("view/admin/users.jsp").forward(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminController at " + request.getContextPath() + "</h1>");
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

    private ArrayList<User> search(HttpServletRequest request, HttpServletResponse response) {
        String keywords = request.getParameter("keywords");
        ArrayList<User> list = UserDAO.findByKeywords(keywords);
        return list;

    }

    private ArrayList<User> insert(HttpServletRequest request, HttpServletResponse response) {
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
        return UserDAO.findAllUser();
    }

    private ArrayList<User> update(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<User> list = new ArrayList<>();
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
        return UserDAO.findAllUser();
    }

    private ArrayList<User> delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<User> list = new ArrayList<>();
        String cccd = request.getParameter("cccd");

        if (HouseholdMemberDAO.findByCccd(cccd) != null) {
            String error = "Hãy thực hiện xóa công dân ra khỏi hộ khẩu trước!";
            request.setAttribute("error", error);
            request.setAttribute("listUsers", UserDAO.findAllUser());
            request.getRequestDispatcher("view/admin/users.jsp").forward(request, response);

        }

        UserDAO.delete(cccd);
        return UserDAO.findAllUser();

    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<User> users = UserDAO.findAllUser();
        request.setAttribute("listUsers", users);
        request.getRequestDispatcher("view/admin/users.jsp").forward(request, response);
    }

    private void listRegistrationsJoinHousehold(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Registration> list = RegistrationDAO.findAllRegistrationIsPending();
        request.setAttribute("listRegistrations", list);
        request.getRequestDispatcher("view/admin/listRegistration.jsp").forward(request, response);
    }

    private void listApproved(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Registration> list = RegistrationDAO.findAllRegistrationIsApprove();
        request.setAttribute("listRegistrations", list);
        request.getRequestDispatcher("view/admin/registration-approved.jsp").forward(request, response);

    }

    private void listRejected(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Registration> list = RegistrationDAO.findAllRegistrationIsReject();

        request.setAttribute("listRegistrations", list);
        request.getRequestDispatcher("view/admin/registration-rejected.jsp").forward(request, response);
    }

    private void listHouseHold(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<HouseHold> list = HouseHoldDAO.findAll();
        request.setAttribute("listHouseHold", list);
        request.getRequestDispatcher("view/admin/household.jsp").forward(request, response);
    }

    private void back(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Registration> list = RegistrationDAO.findAllRegistrationIsPending();
        request.setAttribute("listRegistrations", list);
        request.getRequestDispatcher("view/admin/listRegistration.jsp").forward(request, response);
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
            request.getRequestDispatcher("view/admin/admin-household-member.jsp").forward(request, response);
            return;
        }
        //nếu relationship khác với tạm trú và lưu trú ko thêm đc nữa
        if (relationship.equals("Tạm trú") || relationship.equals("Lưu trú tạm thời")) {

            if (HouseholdMemberDAO.findByCccd(cccd, relationship) != null) {
                error = "Số cccd này đã tạm trú/lưu trú hộ khẩu khác!";
                request.setAttribute("error", error);
                request.setAttribute("listHouseholdMember", HouseholdMemberDAO.findByHouseholdId(householdId));
                request.getRequestDispatcher("view/admin/admin-household-member.jsp").forward(request, response);
                return;
            }
            HouseholdMember hm2 = new HouseholdMember(householdId, relationship, cccd);
            HouseholdMemberDAO.insert(hm2);
            request.setAttribute("listHouseholdMember", HouseholdMemberDAO.findByHouseholdId(householdId));
            request.getRequestDispatcher("view/admin/admin-household-member.jsp").forward(request, response);
            return;
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

    private void updateHouseholdMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        String relationship = request.getParameter("relationship");
        int householdId = Integer.parseInt(request.getParameter("householdId"));

        String error;

        if (relationship == "") {
            error = "Hãy chọn quan hệ!";
            request.setAttribute("error", error);
            request.setAttribute("listHouseholdMember", HouseholdMemberDAO.findByHouseholdId(householdId));
            request.getRequestDispatcher("view/admin/admin-household-member.jsp").forward(request, response);
            return;
        }
        HouseholdMember hm = new HouseholdMember(householdId, relationship, cccd);
        HouseholdMemberDAO.update(hm);
        request.setAttribute("listHouseholdMember", HouseholdMemberDAO.findByHouseholdId(householdId));
        request.getRequestDispatcher("view/admin/admin-household-member.jsp").forward(request, response);
        return;

    }

    private void deleteHouseholdMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        String relationship = request.getParameter("relationship");
        int householdId = Integer.parseInt(request.getParameter("householdId"));
        HouseholdMemberDAO.delete(cccd, relationship);
        request.setAttribute("listHouseholdMember", HouseholdMemberDAO.findByHouseholdId(householdId));
        request.getRequestDispatcher("view/admin/admin-household-member.jsp").forward(request, response);
        return;
    }

    private void deleteHousehold(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int householdId = Integer.parseInt(request.getParameter("householdId"));
        if (!HouseholdMemberDAO.findByHouseholdId(householdId).isEmpty()) {
            String error = "Chưa thể xóa hộ khẩu này hãy thực hiện xóa hết thành viên trước!";
            request.setAttribute("error", error);
            request.setAttribute("listHouseHold", HouseHoldDAO.findAll());
            request.getRequestDispatcher("view/admin/household.jsp").forward(request, response);
            return;
        }

        HouseHoldDAO.delete(householdId);
        request.setAttribute("listHouseHold", HouseHoldDAO.findAll());
        request.getRequestDispatcher("view/admin/household.jsp").forward(request, response);
        return;

    }

    private void insertHousehold(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cccd = request.getParameter("cccd");
        String createDate = request.getParameter("startDate");
        int addressId = Integer.parseInt(request.getParameter("addressId"));

        if (HouseholdMemberDAO.findByCccd(cccd) != null) {
            String error = "Công dân này đã có hộ khẩu!";
            request.setAttribute("error", error);
            ArrayList<HouseHold> list = HouseHoldDAO.findAll();
            request.setAttribute("listHouseHold", list);
            request.getRequestDispatcher("view/admin/household.jsp").forward(request, response);
            return;
        }

        HouseHold h = new HouseHold(cccd, addressId, createDate);
        HouseHoldDAO.insertHousehold(h);

        HouseholdMember hm = new HouseholdMember(HouseHoldDAO.findByCccd(cccd).getHouseHoldId(), "Chủ hộ", cccd);
        HouseholdMemberDAO.insert(hm);
        ArrayList<HouseHold> list = HouseHoldDAO.findAll();
        request.setAttribute("listHouseHold", list);
        request.getRequestDispatcher("view/admin/household.jsp").forward(request, response);
    }

    private void changeHeadOfHouseholdCccd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int householdId = Integer.parseInt(request.getParameter("householdId"));

        if (HouseholdMemberDAO.countHeadOfHousehold(householdId) != 1) {
            String error = "Hiện đang có nhiều hơn 1 chủ hộ!";
            request.setAttribute("error", error);
            request.setAttribute("listHouseholdMember", HouseholdMemberDAO.findByHouseholdId(householdId));
            request.getRequestDispatcher("view/admin/admin-household-member.jsp").forward(request, response);
            return;
        }

        HouseHoldDAO.updateHeadOfHousehold(HouseholdMemberDAO.findHeadOfHousehold(householdId).getCccd(), householdId);
        request.setAttribute("listHouseHold", HouseHoldDAO.findAll());
        request.getRequestDispatcher("view/admin/household.jsp").forward(request, response);

    }

}
