/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import database.dBContext;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
//import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import static user.validation.encryptPassword;

/**
 *
 * @author theta
 */
public class userDAO {

    Connection conn = null; // connect to sql Server
    PreparedStatement ps = null;// execute SQL query
    ResultSet rs = null;// return data

    public userDTO login(String userName, String passWord) throws NoSuchAlgorithmException {
        String query = "select * from [user]\n"
                + "where [email]= ?\n"
                + "and [password]= ?";
        String enPass = encryptPassword(passWord);
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            ps.setString(2, enPass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new userDTO(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getInt(9),
                        rs.getInt(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

//    public static void main(String[] args) throws NoSuchAlgorithmException {
//        userDAO dao = new userDAO();
//        String userName = "thanhTest3@fpt.edu.vn";
//        String passWord = "12345678";
//        userDTO u = dao.login(userName, passWord);
//        System.out.println(u);
//    }
    public boolean getUserExistency(String email) {
        String query = "select * from [user]\n"
                + "where [email]= ?\n";
        userDTO u;
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);

            rs = ps.executeQuery();
            while (rs.next()) {
                u = new userDTO(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getInt(9),
                        rs.getInt(10));

                if (u != null) {
                    return true;
                }
            }
        } catch (Exception e) {
        }
        return false;
    }

    public Date getCurrentDate() {
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);

        return date;
    }

    public void signUp(String email, String password, String address, String fullName, String phoneNumber) throws NoSuchAlgorithmException {
        // String email, String passwor, String address, String fullName, String phoneNumber
        String encryptedPass = encryptPassword(password);
        userDAO dao = new userDAO();
        String query = "insert into [user]\n"
                + "values (?, ?, NULL, ?, ?, ?, NULL, ? , 1, 0);";
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, encryptedPass);
            ps.setString(3, address);
            ps.setString(4, fullName);
            ps.setString(5, phoneNumber);
            ps.setDate(6, dao.getCurrentDate());
            rs = ps.executeQuery();

        } catch (Exception e) {
        }

    }

    public userDTO getUserByEmail(String email) {
        String query = "select * from [user]\n"
                + "where [email]= ?\n";
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);

            rs = ps.executeQuery();
            while (rs.next()) {
                userDTO u = new userDTO(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getInt(9),
                        rs.getInt(10));

                return u;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<userDTO> getAllUser() {
        List<userDTO> list = new ArrayList<>();
        String query = "select * from [user]";
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new userDTO(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getInt(9),
                        rs.getInt(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<userDTO> getUserBy6(int index) {
        List<userDTO> list = new ArrayList<>();
        String query = "select * from [User]\n"
                + "order by [Email]\n"
                + "offset ? row\n"
                + "fetch first 6 rows only";
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index-1)*6);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new userDTO(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getInt(9),
                        rs.getInt(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public int getMaxPagesUser(){
        String query = "select count(*) from [user]";

        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 6;
                if (total % 6 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public static void main(String[] args) {
        userDAO uD = new userDAO();
//        String email = "thanhTest3@gmail.com";
//        String password = "1";
//        String avatarLink = "2";
//        String address = "3";
//        String fullName = "admin";
//        String phoneNumber = "1234567890";
//        String gender = "male";
//        Date creationDate = uD.getCurrentDate();
//        int status = 1;
//        int roleID = 2;
        //uD.editMyProfile(email, password, avatarLink, address, fullName, phoneNumber, gender, creationDate, 0, 0);
        System.out.println(uD.getUserBy6(1));
        System.out.println(uD.getMaxPagesUser());
    }

    public void editMyProfile(String email, String password, String avatarLink, String address, String fullName, String phoneNumber, String gender, Date creationDate, int status, int roleId) {
        String query = "update [user]\n"
                + "set [password] = ?, \n" //1
                + "[avatarLink] = ?, \n" //2
                + "[address]= ?, \n" //3
                + "[fullName]=?, \n" //4
                + "[phoneNumber]=?, \n" //5
                + "[gender]=?, \n" //6
                + "[creationDate]= ?, \n" //7
                + "[status]= ?, \n" //8
                + "[roleID]= ? \n" //9
                + "where [email]= ?";   //10
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);

            ps.setString(1, password);
            ps.setString(2, avatarLink);
            ps.setString(3, address);
            ps.setString(4, fullName);
            ps.setString(5, phoneNumber);
            ps.setString(6, gender);
            ps.setDate(7, creationDate);
            ps.setInt(8, status);
            ps.setInt(9, roleId);
            ps.setString(10, email);
            ps.executeQuery();
        } catch (Exception e) {
        }

    }

}

//    public void addRole(int roleID, String Name) {
//        String query = "insert into [role]\n"
//                + " values (?, ?)";
//        try {
//            conn = new dBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, roleID);
//            ps.setString(2, Name);
//            rs = ps.executeQuery();
//        } catch (Exception e) {
//        }
//
//    }
//    public static void main(String[] args) throws NoSuchAlgorithmException {
//        userDAO dao = new userDAO();
//        String password = "12345678";
//        String enPass = encryptPassword(password);
//        String email = "thanhTest2@fpt.edu.vn";
//        String address = "tpHCM";
//        String fullName = "thanh";
//        String phoneNumber = "0397318617";
//        dao.signUp(email, password, address, fullName, phoneNumber);
//        // dao.addRole(6, enPass);
//        Date date = dao.getCurrentDate();
//        System.out.println(date);
//        System.out.println(enPass);
//    }
//    public static void main(String[] args) {
//        String a = "admin@fpt.edu.vn";
//        userDAO dao = new userDAO();
//        System.out.println(dao.getUserExistency(a));
//    }
    //}
