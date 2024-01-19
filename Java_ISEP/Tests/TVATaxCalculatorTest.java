import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TVATaxCalculatorTest {

    @Test
    public void testImportedTaxCalc() {


        // Test case 1: Imported and not tax exempt product
        Product product2 = new Product("Perfume", 27.99, true, false, ProductType.BEAUTY);
        assertEquals(1.4, ImportedTaxCalculator.calculateTax(product2), 0.01);


        // Test case 2: Not imported and not tax exempt product
        Product product4 = new Product("Headphones", 129.99, false, false, ProductType.ELECTRONIC);
        assertEquals(6.5, ImportedTaxCalculator.calculateTax(product4), 0.01);

    }


}
