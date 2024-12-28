package hw2;

public class DegreeStudent extends Student {
    private String major;
    private String aS;
    private boolean hFA;
    private double fAA;

    public DegreeStudent(String id, String fn, String ln, int age, int ch, String major, String aS, boolean hFA, double fAA){
        super(id, fn, ln, age, ch);
        this.major = major;
        this.aS = aS;
        this.hFA = hFA;
        if (hFA){
            this.fAA = fAA;
        }
        else{
            this.fAA = 0;
        }
    }

    @Override
    public void printData(){
        System.out.println("ID number: " + id);
        System.out.println("Name: " + fn + " " + ln);
        System.out.println("Age: " + age);
        System.out.println(fn + " is a degree-seeking student enrolled in " + ch + " credits.");

        if (hFA) {
            System.out.println(fn + " receives $" + fAA + " in financial assistance per term.");
        }

        System.out.println(fn + "'s major is " + major);
        System.out.println(fn + "'s academic standing is " + aS);

        }
    
    @Override
    public double fees(){
        int max = Math.min(ch, 12);
        double cash = (275 *max) + 150;
        if (hFA){
            cash -= fAA;
            cash = Math.max(cash, 0);
        }
        return cash;
    }

    public boolean hasFinancialAssistance() {
        return hFA;
    }
}