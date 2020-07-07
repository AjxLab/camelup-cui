public class Camel {
    private int color;
    private int x;
    private int y;
    private String shape[];

    public Camel(int x, int y, int color) {
        // init position
        this.x = x;
        this.y = y;

        // color of camel
        this.color = color;

        // camel's shape
        this.shape = new String[3];
        this.shape[0] = "*** ** **";
        this.shape[1] = " ********";
        this.shape[2] = "   *  *  ";
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
        String camel[] = this.shape;

        // replace template shape to colored space
        for(int i=0; i<3; i++) {
            camel[i] = camel[i].replace(" ", "\u001b[1C");
            camel[i] = camel[i].replace("*", "\u001b[00;" + this.color + "m \u001b[00m");
        }

        System.out.println("\u001b[" + this.y + "B");
        for(int i=0; i<3; i++) {
            System.out.println("\u001b[" + this.x + "C" + camel[i]);
        }
    }
}
