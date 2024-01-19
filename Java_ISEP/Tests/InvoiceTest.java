import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class InvoiceTest {
    @Test
    public void testInvoice() {
        Product perfumeImported = new Product("1 flacon de parfum importé", 27.99, true, false, ProductType.BEAUTY);
        Product perfume = new Product("1 flacon de parfum", 18.99, false, false, ProductType.BEAUTY);
        Product migrainePills = new Product("1 boite de pilule contre la migraine", 9.75, false, true, ProductType.MEDICAL);
        Product chocolatesImported = new Product("1 boite de chocolats importés", 11.25, true, true, ProductType.FOOD);


        List<Product> products = Arrays.asList(perfumeImported, perfume, migrainePills, chocolatesImported);
        Invoice invoice = new Invoice(products);


        assertEquals(4.19, invoice.calculateTax(perfumeImported), 0.01);
        assertEquals(1.9, invoice.calculateTax(perfume), 0.01);
        assertEquals(0.0, invoice.calculateTax(migrainePills), 0.01);
        assertEquals(0.6, invoice.calculateTax(chocolatesImported), 0.01);

        assertEquals(6.70, invoice.getTotalTaxes(), 0.01);

        assertEquals(74.68, invoice.getTotalAmount(), 0.01);


        InvoicePrinter.printInvoice(invoice);
    }
}