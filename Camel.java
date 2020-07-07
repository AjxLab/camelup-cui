public class Camel {
    private int id;
    private int color;
    private int x;
    private int y;

    public Camel(int id, int color) {
        this.id = id;
        this.color = color;

        this.x = 0;
        this.y = 0;
    }

    public int[] getPosition() {
        int[] position = new int[2];
        position[0] = this.x;
        position[1] = this.y;

        return position;
    }

    public void move(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public void draw() {
    }
}
