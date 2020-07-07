public class Camels {
    private int n_camels;
    private Camel camels[];
    private final int n_square = 16;
    private Integer field[][];

    public Camels(int n_camels) {
        this.n_camels = n_camels;
        this.camels = new Camel[this.n_camels];

        // init camel's color
        int colors[] = { 41, 42, 43, 44, 47 };
        for (int i = 0; i < this.n_camels; i++) {
            this.camels[i] = new Camel(0, 0, colors[i % 5]);
        }

        // init field with null
        this.field = new Integer[this.n_square][this.n_camels];
    }

    public Camel camel(int index) {
        if (index < 0 || index >= this.n_camels) {
            System.err.printf("There are only %d camels.\n", this.n_camels);
            System.err.printf("Please specify a value between 0 and %d.\n", this.n_camels - 1);
            return null;
        }

        return this.camels[index];
    }

    public void move(int camel_id, int dice) {
        int current = 0;

        // search field's index of <camel_id>
        for (int i = 0; i < this.n_square; i++) {
            for (int j = 0; j < this.n_camels; j++) {
                if (this.field[i][j] == null)
                    break;
                if (this.field[i][j] == camel_id) {
                    // set null in current position
                    this.field[i][j] = null;
                    current = i;
                }
            }
        }

        // if goal
        if (current + dice >= this.n_square) {
            // --------------------
            // Goal processing
            // --------------------
            return;
        }

        for (int j = 0; j < this.n_camels; j++) {
            if (this.field[current + dice][j] == null) {
                this.field[current + dice][j] = camel_id;
                return;
            }
        }
    }

    public void display() {
        for (int i = 0; i < this.n_square; i++) {
            for (int j = 0; j < this.n_camels; j++) {
                if (this.field[i][j] == null)
                    break;

                this.camel(this.field[i][j]).setPosition(i * 9, (this.n_camels - j) * 2);
                this.camel(this.field[i][j]).draw();
            }
        }
    }
}
