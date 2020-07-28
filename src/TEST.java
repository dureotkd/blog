import java.util.Scanner;

public class TEST{
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		int one = scanner.nextInt();
		int two = scanner.nextInt();
		int three = scanner.nextInt();
		
		if ( one % 2 == 0 ) {
			System.out.println("even");
		} else {
			System.out.println("odd");
		}
		
		if ( two % 2 == 0 ) {
			System.out.println("even");
		} else {
			System.out.println("odd");
		}
		
		if ( three % 2 == 0 ) {
			System.out.println("even");
		} else {
			System.out.println("odd");
		}
		
	}
}