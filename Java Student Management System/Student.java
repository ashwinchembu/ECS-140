package hw2;

public abstract class Student {
    protected String id;
    protected String fn;
    protected String ln;
    protected int age;
    protected int ch;

    public Student(String id, String fn, String ln, int age, int ch){
        this.id = id;
        this.fn = fn; 
        this.ln = ln;
        this.age = age; 
        this.ch = ch;
    }

    public abstract void printData();
    public abstract double fees();

}