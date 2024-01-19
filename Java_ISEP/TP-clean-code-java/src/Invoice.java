import java.util.List;

public class Invoice {
    private List<Product> products;
    private double totalTaxes;
    private double totalAmount;

    public Invoice(List<Product> products) {
        this.products = products;
        this.totalTaxes = calculateTotalTaxes();
        this.totalAmount = calculateTotalAmount();
    }
/*
    private double calculateTotalTaxes() {
        return products.stream()
                .mapToDouble(TaxCalculator::calculateTax)
                .sum();
    }
*/
    private double calculateTotalAmount() {
        return products.stream()
                .mapToDouble(Product::getPrice)
                .sum() + totalTaxes;
    }

    private double calculateTotalTaxes() {
        return products.stream()
                .mapToDouble(this::calculateTax)
                .sum();
    }

    public double calculateTax(Product product) {
        double tax = 0.0;
        if (product.isImported())       tax += ImportedTaxCalculator.calculateTax(product);
        if (!product.isTaxExempt())     tax += TVATaxCalculator.calculateTax(product);
        return tax;
    }
    

    public List<Product> getProducts() {
        return products;
    }

    public double getTotalTaxes() {
        return totalTaxes;
    }

    public double getTotalAmount() {
        return totalAmount;
    }
}
