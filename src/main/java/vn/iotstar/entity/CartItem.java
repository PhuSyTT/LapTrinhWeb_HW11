package vn.iotstar.entity;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "CartItem")
public class CartItem implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "cartItemId", length = 50)
    private String cartItemId;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "unitPrice")
    private Double unitPrice;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "productId")
    private Product product;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "cartId")
    private Cart cart;

    public CartItem() {
    }

    public CartItem(String cartItemId, Integer quantity, Double unitPrice, Product product, Cart cart) {
        this.cartItemId = cartItemId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.product = product;
        this.cart = cart;
    }

    public String getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(String cartItemId) {
        this.cartItemId = cartItemId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }
}
