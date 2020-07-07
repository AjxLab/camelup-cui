public class Camels {
    private int n_camels;
    private Camel camels[];

    public Camels(int n_camels) {
        this.n_camels = n_camels;
        this.camels = new Camel[this.n_camels];

        int colors[] = { 41, 42, 43, 44, 47 };
        for (int i = 0; i < this.n_camels; i++) {
            this.camels[i] = new Camel(0, 0, colors[i % 5]);
        }
    }

    public Camel camel(int index) {
        if (index < 0 || index >= this.n_camels) {
            System.err.printf("There are only %d camels.\n", this.n_camels);
            System.err.printf("Please specify a value between 0 and %d.\n", this.n_camels - 1);
            return null;
        }

        return this.camels[index];
    }
}
