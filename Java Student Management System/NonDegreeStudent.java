package hw2;

public class NonDegreeStudent extends Student {
    private String sT;
    private String cT;

    public NonDegreeStudent(String id, String fn, String ln, int age, int ch, String sT, String cT) {
        super(id, fn, ln, age, ch);
        this.sT = sT;
        this.cT = cT;
    }

    @Override
    public void printData() {
        System.out.println("ID number: " + id);
        System.out.println("Name: " + fn + " " + ln);
        System.out.println("Age: " + age);

        if ("Senior".equalsIgnoreCase(sT)) {
            System.out.println(fn + " is a senior citizen student enrolled in " + ch + " credits.");
        } else {
            System.out.println(fn + " is a certificate student pursuing " + cT + " and enrolled in " + ch + " credits.");
        }
    }

    @Override
    public double fees() {
        if ("S".equalsIgnoreCase(sT)) {
            if (ch > 6) {
                return (ch - 6) * 50 + 100;
            } else {
                return 100;
            }
        } else {
            return 700 + 300 * ch; 
        }
    }
    public String getStudentType() {
        return sT;
    }
}