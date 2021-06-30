/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import database.dBContext;
import category.categoryDTO;
import product.productDTO;
import user.userDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author theta
 */
public class productDAO {

    Connection conn = null; // connect to sql Server
    PreparedStatement ps = null;// execute SQL query
    ResultSet rs = null;// return data

    public static void main(String[] args) {
        productDAO dao = new productDAO();
        System.out.println(dao.searchMenuMaxPagesBy6("lá ngón"));
        System.out.println(dao.searchMenuProductBy6("lá ngón", 2));
    }
        
    public List<productDTO> searchMenuProductBy6(String searchMenu, int index) {
        List<productDTO> list = new ArrayList<>();
        String query = "select * from [Product]\n"
                + "where [Name] like ?\n"
                + "order by [Id]\n"
                + "offset ? row\n"
                + "fetch first 6 rows only";
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + searchMenu + "%");
            ps.setInt(2, (index-1)*6);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new productDTO(
                        rs.getInt(1), //id
                        rs.getString(2), // name
                        rs.getString(3), // cateID
                        rs.getString(4), //thumbnail
                        rs.getString(5), //uploader
                        rs.getInt(6), // lowerPrice
                        rs.getInt(7), // higherPrice
                        rs.getString(8), // detail
                        rs.getBoolean(9), // status
                        rs.getBoolean(10),// saleStatus
                        rs.getInt(11) // stock
                ));

            }
        } catch (Exception e) {

        }
        return list;
    }
    
    public int searchMenuMaxPagesBy6(String searchMenu){
        String query = "select count(*) from [Product]"
                + "where [Name] like ?";

        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%"+searchMenu+ "%");
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

    public List<productDTO> getAllProduct() {
        List<productDTO> list = new ArrayList<>();
        String query = "select * from Product";
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new productDTO(
                        rs.getInt(1), //id
                        rs.getString(2), // name
                        rs.getString(3), // cateID
                        rs.getString(4), //thumbnail
                        rs.getString(5), //uploader
                        rs.getInt(6), // lowerPrice
                        rs.getInt(7), // higherPrice
                        rs.getString(8), // detail
                        rs.getBoolean(9), // status
                        rs.getBoolean(10),// saleStatus
                        rs.getInt(11) // stock
                ));

            }
        } catch (Exception e) {

        }
        return list;
    }

    public void deleteProduct(int pID) {
        String query = "delete from [product]\n"
                + "where id = ?";
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, pID);
            //rs = ps.executeQuery();
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<productDTO> getAllProductByCateID(String cateID) {
        List<productDTO> list = new ArrayList<>();
        String query = "select * from Product \n"
                + "where CategoryId=?";
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cateID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new productDTO(
                        rs.getInt(1), //id
                        rs.getString(2), // name
                        rs.getString(3), // cateID
                        rs.getString(4), //thumbnail
                        rs.getString(5), //uploader
                        rs.getInt(6), // lowerPrice
                        rs.getInt(7), // higherPrice
                        rs.getString(8), // detail
                        rs.getBoolean(9), // status
                        rs.getBoolean(10),// saleStatus
                        rs.getInt(11) // stock
                ));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public productDTO getLastestProduct() {
        String query = "select top 1 * from Product\n"
                + "order by product.Id desc";
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new productDTO(
                        rs.getInt(1), //id
                        rs.getString(2), // name
                        rs.getString(3), // cateID
                        rs.getString(4), //thumbnail
                        rs.getString(5), //uploader
                        rs.getInt(6), // lowerPrice
                        rs.getInt(7), // higherPrice
                        rs.getString(8), // detail
                        rs.getBoolean(9), // status
                        rs.getBoolean(10),// saleStatus
                        rs.getInt(11) // stock
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public productDTO getProductByID(int pID) {
        String query = "select * from Product \n"
                + "where id=?";
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, pID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new productDTO(
                        rs.getInt(1), //id
                        rs.getString(2), // name
                        rs.getString(3), // cateID
                        rs.getString(4), //thumbnail
                        rs.getString(5), //uploader
                        rs.getInt(6), // lowerPrice
                        rs.getInt(7), // higherPrice
                        rs.getString(8), // detail
                        rs.getBoolean(9), // status
                        rs.getBoolean(10),// saleStatus
                        rs.getInt(11) // stock
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void addProduct(String name, String cateID, String thumnailLink, String uploaderEmail, int originalSalePrice, int salePrice, String detail, boolean status, boolean saleStatus, int stock) {
        String query = "INSERT [dbo].[Product]\n"
                + "( [Name], "
                + "[CategoryId], "
                + "[ThumbnailLink], "
                + "[UploaderEmail], "
                + "[OringinalSalePrice], "
                + "[SalePrice], "
                + "[Details], "
                + "[Status], "
                + "[SaleStatus], "
                + "[Stock]) \n"
                + "VALUES (?,?,?,?,?,?,?,?,?,?)";
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, cateID);
            ps.setString(3, thumnailLink);
            ps.setString(4, uploaderEmail);
            ps.setInt(5, originalSalePrice);
            ps.setInt(6, salePrice);
            ps.setString(7, detail);
            ps.setBoolean(8, status);
            ps.setBoolean(9, saleStatus);
            ps.setInt(10, stock);
            ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public void editProduct(String name, String cateID, String thumnailLink, String uploaderEmail, int originalSalePrice, int salePrice, String detail, boolean status, boolean saleStatus, int stock, int id) {
        String query = "update [Product]\n"
                + "set [Name] = ?,\n"
                + "[CategoryId] = ?,\n"
                + "[ThumbnailLink] = ?,\n"
                + "[UploaderEmail] = ?,\n"
                + "[OringinalSalePrice] = ?,\n"
                + "[SalePrice]= ?,\n"
                + "[Details]= ?,\n"
                + "[Status] = ?,\n"
                + "[SaleStatus] = ?,\n"
                + "[Stock] = ? \n"
                + "where [Id] = ?";

        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, cateID);
            ps.setString(3, thumnailLink);
            ps.setString(4, uploaderEmail);
            ps.setInt(5, originalSalePrice);
            ps.setInt(6, salePrice);
            ps.setString(7, detail);
            ps.setBoolean(8, status);
            ps.setBoolean(9, saleStatus);
            ps.setInt(10, stock);
            ps.setInt(11, id);
            ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public int getMaxPagesBy6() {
        String query = "select count(*) from [Product]";

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

    public int getProductQuatity() {
        String query = "select count(*) from [Product]";
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = 0;
                total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getMaxPagesByCategoryBy6(String cateID) {
        String query = "select count(*) from [Product] \n"
                + "where [CategoryID]= ?";

        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cateID);
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

    public List<productDTO> getProductByCategoryBy6(int index, String cateID) {
        List<productDTO> list = new ArrayList<>();
        String query = "select * from [Product]\n"
                + "where [CategoryId]=? \n"
                + "order by [Id]\n"
                + "offset ? rows\n"
                + "fetch first 6 rows only";
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cateID);
            ps.setInt(2, (index - 1) * 6);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new productDTO(
                        rs.getInt(1), //id
                        rs.getString(2), // name
                        rs.getString(3), // cateID
                        rs.getString(4), //thumbnail
                        rs.getString(5), //uploader
                        rs.getInt(6), // lowerPrice
                        rs.getInt(7), // higherPrice
                        rs.getString(8), // detail
                        rs.getBoolean(9), // status
                        rs.getBoolean(10),// saleStatus
                        rs.getInt(11) // stock
                ));
            }

        } catch (Exception e) {
        }
        return list;
    }
//    public static void main(String[] args) {
//        productDAO dao = new productDAO();
//        List<productDTO> list = dao.getProductByCategoryBy6(1, "C1");
//        System.out.println(list);
//        
//    }

    public List<productDTO> getProductBy6(int index) {
        List<productDTO> list = new ArrayList<>();
        String query = "select * from [Product]\n"
                + "order by [Id]\n"
                + "offset ? rows\n"
                + "fetch first 6 rows only";
        try {
            conn = new dBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 6);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new productDTO(
                        rs.getInt(1), //id
                        rs.getString(2), // name
                        rs.getString(3), // cateID
                        rs.getString(4), //thumbnail
                        rs.getString(5), //uploader
                        rs.getInt(6), // lowerPrice
                        rs.getInt(7), // higherPrice
                        rs.getString(8), // detail
                        rs.getBoolean(9), // status
                        rs.getBoolean(10),// saleStatus
                        rs.getInt(11) // stock
                ));
            }

        } catch (Exception e) {
        }
        return list;
    }
//    public static void main(String[] args) {
//        productDAO dao = new productDAO();
//        String name = "lá ngón loại 1";
//        String cateID = "C1";
//        String thumnailLink = "https://www.thuocdantoc.org/wp-content/uploads/2019/10/la-ngon.jpg";
//        String uploaderEmail = "thanhTest3@gmail.com";
//        String detail = "ngon lam do";
//        //dao.editProduct(name, cateID, thumnailLink, uploaderEmail, 0, 0, detail, true, true, 0, 23);
//        dao.addProduct(name, cateID, thumnailLink, uploaderEmail, 0, 0, detail, true, true, 0);
//    }

//    public static void main(String[] args) {
//        productDAO dao = new productDAO();
//        System.out.println(dao.getMaxPagesBy6());
//        System.out.println(dao.getProductQuatity());
//    }
}
