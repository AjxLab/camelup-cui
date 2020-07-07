import java.util.Random;

public class Main {
    public static void main(String[] args) {
        final int N_CAMELS = 5;

        // generate camels list
        Camels camels = new Camels(N_CAMELS);

        for(int i=0; i<N_CAMELS; i++) {
            camels.move(i, dice(3));
        }

        camels.display();

        System.out.print("\u001b[15B");
    }

    private static int dice(int range_max) {
        Random rand = new Random();
        return rand.nextInt(range_max);
    }
}
