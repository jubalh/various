import javax.swing.*;

public class HelloWorld {
	private static void show() {
		JFrame f = new JFrame("Title");
		f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		JLabel l = new JLabel("Hello World!");
		f.getContentPane().add(l);

		f.pack();
		f.setVisible(true);
	}

	public static void main(String[] args) {
		javax.swing.SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				show();
			}
		});
	}
}
