import org.junit.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ImportedTaxCalculatorTest {

    @Test
    public void testImportedTaxCalc() {

        // Test case 1: Imported and tax exempt product
        Product product1 = new Product("Book", 12.99, true, true, ProductType.BOOK);
        assertEquals(0.65, ImportedTaxCalculator.calculateTax(product1), 0.01);

        // Test case 2: Imported and not tax exempt product
        Product product2 = new Product("Perfume", 27.99, true, false, ProductType.BEAUTY);
        assertEquals(1.4, ImportedTaxCalculator.calculateTax(product2), 0.01);

    }
}
