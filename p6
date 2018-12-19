public class Student {

	private String name;
	private String id;
	private double gpa;

	public Student(String name, double gpa) {
		super();
		this.name = name;
		this.gpa = gpa;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public double getGpa() {
		return gpa;
	}

	public void setGpa(double gpa) {
		this.gpa = gpa;
	}

	@Override
	public String toString() {
		return "Student [name=" + name + ", id=" + id + ", gpa=" + gpa + "]";
	}

}

public class GBag <T extends Student>{
	private T[] array;
	private int nElems;
	private int idcount = 1;
	
	
	public GBag(int maxSize) {
		array = (T[]) new Student[maxSize];
		nElems = 0;
	}

	public void store(T value) {
		value.setId(Integer.toString(idcount++));
		array[nElems++] = value;
	}

	public boolean delete(String value) {
		boolean found = false;
		for (int i = 0; i < nElems; i++) {
			if (array[i].getId().equals(value)) {
				found = true;
				for (int j = i; j < nElems - 1; j++) {
					array[j] = array[j + 1];
				}
				nElems--;
				return found;
			}
		}
		return found;
	}

	public boolean find(String value) {
		boolean found = false;
		for (int i = 0; i < nElems; i++) {
			if (array[i].getId().equals(value)) {
				found = true;
			}
		}
		return found;
	}

	public T displayById(String value) {
		for (int i = 0; i < nElems; i++) {
			if (array[i].getId().equals(value)) {
				return array[i];
			}
		}
		System.out.println("No one of that id");
		return null;
	}
	
	public void display() {
		for (int i = 0; i < nElems; i++) {
			System.out.println(array[i]);
		}
	}
}

public class Demo {

	public static void main(String[] args) {

		Student s1 = new Student("Bob", 3.0);
		Student s2 = new Student("John", 3.5);
		Student s3 = new Student("Mary", 3.2);
		Student s4 = new Student("Lauren", 4.0);
		Student s5 = new Student("Andrew", 3.7);

		GBag<Student> students = new GBag<>(5);

		students.store(s1);
		students.store(s2);
		students.store(s3);
		students.store(s4);
		students.store(s5);

		System.out.println(students.find("3"));
		System.out.println(students.displayById("3"));
		
	}

}
