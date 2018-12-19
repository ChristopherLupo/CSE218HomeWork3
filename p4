public class NumberBag<T extends Number> {
	private T[] nums;
	private int nElems;

	public NumberBag(int maxSize) {
		nums = (T[]) new Number[maxSize];
		nElems = 0;
	}

	public void insert(T value) {
		nums[nElems++] = value;
	}

	public boolean remove(T value) {
		boolean found = false;
		for (int i = 0; i < nElems; i++) {
			if (nums[i] == value) {
				found = true;
				for (int j = i; j < nElems - 1; j++) {
					nums[j] = nums[j + 1];
				}
				nElems--;
				return found;
			}
		}
		return found;
	}

	public boolean find(T value) {
		boolean found = false;
		for (int i = 0; i < nElems; i++) {
			if (nums[i] == value) {
				found = true;
			}
		}
		return found;
	}

	public void display() {
		for (int i = 0; i < nElems; i++) {
			System.out.println(nums[i] + " ");
		}
	}
}

public class Demo {

	public static void main(String[] args) {

		NumberBag bag = new NumberBag(10);

		bag.insert(1);
		bag.insert(27.5);
		bag.insert(777);

		
		System.out.println(bag.find(1));
		System.out.println(bag.remove(1));
		
		bag.display();
	}

}
