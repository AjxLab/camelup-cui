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

    public Camel camel(int camel_id) {
        if (camel_id < 0 || camel_id >= this.n_camels) {
            System.err.printf("There are only %d camels.\n", this.n_camels);
            System.err.printf("Please specify a value between 0 and %d.\n", this.n_camels - 1);
            return null;
        }

        return this.camels[camel_id];
    }

    public int getRank(int camel_id) {
        int rank = this.n_camels;

        for (int i = 0; i < this.n_square; i++) {
            for (int j = 0; j < this.n_camels; j++) {
                if (this.field[i][j] == null)
                    break;

                if (this.field[i][j] == camel_id) {
                    return rank;
                } else {
                    rank--;
                }
            }
        }

        return rank;
    }

    public int[] getPosition(int camel_id) {
        int current[] = { -1, -1 };

        for (int i = 0; i < this.n_square; i++) {
            for (int j = 0; j < this.n_camels; j++) {
                if (this.field[i][j] == null)
                    break;

                if (this.field[i][j] == camel_id) {
                    current[0] = i;
                    current[1] = j;
                }
            }
        }

        return current;
    }

    public void move(int camel_id, int dist) {
        // search current index
        int current[] = this.getPosition(camel_id);
        if (current[0] >= 0) {
            this.field[current[0]][current[1]] = null;
        }

        // if goal
        if (current[0] + dist >= this.n_square) {
            // --------------------
            // Goal processing
            // --------------------
            System.out.println("GOAL!!");
            return;
        }

        for (int i = 0; i < this.n_camels; i++) {
            if (this.field[current[0] + dist][i] == null) {
                this.field[current[0] + dist][i] = camel_id;
                return;
            }
        }
    }

    public void display() {
        for (int i = 0; i < this.n_camels; i++) {
            int current[] = this.getPosition(i);
            this.camel(i).setPosition(current[0] * 10, (this.n_camels - current[1]) * 2);
            this.camel(i).draw();
        }
    }
}
