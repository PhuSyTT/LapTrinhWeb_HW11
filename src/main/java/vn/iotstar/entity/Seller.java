package vn.iotstar.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "Seller")
public class Seller implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sellerId")
    private int sellerId;

    @Column(name = "sellername", length = 50)
    private String sellername;

    @Column(name = "images", length = 500)
    private String images;

    @Column(name = "status")
    private Integer status;

    @OneToMany(mappedBy = "seller", fetch = FetchType.LAZY)
    private List<User> users;

    @OneToMany(mappedBy = "seller", fetch = FetchType.LAZY)
    private List<Product> products;

    public Seller() {
    }

    public Seller(int sellerId, String sellername, String images, Integer status) {
        this.sellerId = sellerId;
        this.sellername = sellername;
        this.images = images;
        this.status = status;
    }

    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }

    public String getSellername() {
        return sellername;
    }

    public void setSellername(String sellername) {
        this.sellername = sellername;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Seller seller = (Seller) o;
        return sellerId == seller.sellerId;
    }

    @Override
    public int hashCode() {
        return Integer.hashCode(sellerId);
    }
}
