/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package role;

import database.dBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author theta
 */
public class roleDAO {

    Connection conn = null; // connect to sql Server
    PreparedStatement ps = null;// execute SQL query
    ResultSet rs = null;// return data

    public List<roleDTO> getAllRole() {
        List<roleDTO> listR = new ArrayList<>();
        String query = "select * from [Role]";

        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listR.add(new roleDTO(
                        rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return listR;
    }
    
    public static void main(String[] args) {
        roleDAO  rD = new roleDAO();
        System.out.println(rD.getAllRole());
    }
}
