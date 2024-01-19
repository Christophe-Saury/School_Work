public class TVATaxCalculator implements TaxCalculator {

    public static double calculateTax(Product product) {
        double taxRate = 0.0;
        taxRate += product.getProductType().getTva();
        return Math.ceil(product.getPrice() * taxRate * 20.0) / 20.0;
    }

}
