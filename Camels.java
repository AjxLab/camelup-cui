public class Camels {
    private int n_camels;
    private Camel camels[];

    public Camels() {
        this.n_camels = 5;
        this.camels = new Camel[this.n_camels];

        int colors[] = { 41, 42, 43, 44, 47 };
        for (int i = 0; i < this.n_camels; i++) {
            this.camels[i] = new Camel(0, 0, colors[i]);
        }
    }

    public Camel camel(int index) {
        if (index >= this.n_camels) {
            System.err.println("There are only 5 camels.");
            System.err.println("Please specify a value between 0 and 4.");
            return null;
        }

        return this.camels[index];
    }
}
