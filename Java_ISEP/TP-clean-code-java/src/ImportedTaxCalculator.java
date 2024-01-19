public class ImportedTaxCalculator implements TaxCalculator{

    public static final double IMPORT_TAX_RATE = 0.05;
    public static double calculateTax(Product product) {
        double taxRate = 0.0;
          taxRate += IMPORT_TAX_RATE;

        return Math.ceil(product.getPrice() * taxRate * 20.0) / 20.0;
    }

}
