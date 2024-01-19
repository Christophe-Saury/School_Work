public class InvoicePrinter {
    public static void printInvoice(Invoice invoice) {
        invoice.getProducts().forEach(product ->
                System.out.println(product.getName() + ": " + String.format("%.2f", product.getPrice()))
        );
        System.out.println("Montant des taxes : " + String.format("%.2f", invoice.getTotalTaxes()));
        System.out.println("Total : " + String.format("%.2f", invoice.getTotalAmount()));
    }
}
