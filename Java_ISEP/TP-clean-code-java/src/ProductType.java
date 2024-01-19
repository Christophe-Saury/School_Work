public enum ProductType {
    MEDICAL (0.0),
    FOOD(0.0),
    BOOK(0.0),
    ELECTRONIC(0.10),
    BEAUTY(0.10);


    private double tva;

    ProductType(double tva) {
        this.tva = tva;
    }

    public double getTva() {
        return tva;
    }

}
