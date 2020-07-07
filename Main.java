public class Main {
    public static void main(String[] args) {
        Camels camels = new Camels();
        camels.camel(0).move(0, 0);
        camels.camel(1).move(0, 2);
        camels.camel(2).move(0, 4);
        camels.camel(3).move(12, 2);
        camels.camel(4).move(12, 4);

        for(int i=0; i<5; i++) {
            camels.camel(i).draw();
        }
        System.out.print("\u001b[15B");
    }
}
