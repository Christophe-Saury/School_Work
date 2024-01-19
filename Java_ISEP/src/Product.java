public class Product {
    private String name;
    private double price;
    private boolean isImported;
    private boolean isTaxExempt;

    private ProductType productType;

    public Product(String name, double price, boolean isImported, boolean isTaxExempt, ProductType productType) {
        this.name = name;
        this.price = price;
        this.isImported = isImported;
        this.isTaxExempt = isTaxExempt;
        this.productType = productType;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public boolean isImported() {
        return isImported;
    }

    public boolean isTaxExempt() {
        return isTaxExempt;
    }
    public ProductType getProductType() {
        return productType;
    }




}