package vn.iotstar.model;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import java.util.List;
import jakarta.persistence.OneToMany;

@Entity
@Table(name = "categories")
@NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c")
public class Category implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CategoryId")
    private int categoryid;

    @Column(name = "CategoryName", columnDefinition = "nvarchar(50) not null")
    @NotEmpty(message = "Không được phép rỗng")
    private String categoryname;

    @Column(name = "Images", columnDefinition = "nvarchar(500) null")
    private String images;

    private int status;

    // Constructors
    public Category() {}

    public Category(int categoryid, String categoryname, String images, int status) {
        this.categoryid = categoryid;
        this.categoryname = categoryname;
        this.images = images;
        this.status = status;
    }

    // Getters/Setters
    public int getCategoryid() { return categoryid; }
    public void setCategoryid(int categoryid) { this.categoryid = categoryid; }

    public String getCategoryname() { return categoryname; }
    public void setCategoryname(String categoryname) { this.categoryname = categoryname; }

    public String getImages() { return images; }
    public void setImages(String images) { this.images = images; }

    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }
    @OneToMany(mappedBy = "category")
    private List<Product> products;

    public List<Product> getProducts() { return products; }
    public void setProducts(List<Product> products) { this.products = products; }
}