/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

/**
 *
 * @author theta
 */
public class productDTO {

    private int id;
    private String name;
    private String categoryID;
    private String thumbNailLink;
    private String uploaderEmail;
    private int originalSalePrice;
    private int salePrice;
    private String details;
    private boolean status;
    private boolean saleStatus;
    private int stock;
    
    public productDTO(){
        
    }

    public productDTO(int id, String name, String categoryID, String thumbNailLink, String uploaderEmail, int originalSalePrice, int salePrice, String details, boolean status, boolean saleStatus, int stock) {
        this.id = id;
        this.name = name;
        this.categoryID = categoryID;
        this.thumbNailLink = thumbNailLink;
        this.uploaderEmail = uploaderEmail;
        this.originalSalePrice = originalSalePrice;
        this.salePrice = salePrice;
        this.details = details;
        this.status = status;
        this.saleStatus = saleStatus;
        this.stock = stock;
    }

    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        return "productDTO{" + "id=" + id + ", name=" + name + ", categoryID=" + categoryID + ", thumbNailLink=" + thumbNailLink + ", uploaderEmail=" + uploaderEmail + ", originalSalePrice=" + originalSalePrice + ", salePrice=" + salePrice + ", details=" + details + ", status=" + status + ", saleStatus=" + saleStatus + ", stock=" + stock  + '}' + "\n";
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getThumbNailLink() {
        return thumbNailLink;
    }

    public void setThumbNailLink(String thumbNailLink) {
        this.thumbNailLink = thumbNailLink;
    }

    public String getUploaderEmail() {
        return uploaderEmail;
    }

    public void setUploaderEmail(String uploaderEmail) {
        this.uploaderEmail = uploaderEmail;
    }

    public int getOriginalSalePrice() {
        return originalSalePrice;
    }

    public void setOriginalSalePrice(int originalSalePrice) {
        this.originalSalePrice = originalSalePrice;
    }

    public int getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(int salePrice) {
        this.salePrice = salePrice;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public boolean isSaleStatus() {
        return saleStatus;
    }

    public void setSaleStatus(boolean saleStatus) {
        this.saleStatus = saleStatus;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
}
