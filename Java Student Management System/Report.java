package hw2;
// TODO: Make sure you create a package named hw2 and add the package name to every Java file 
import java.io.*;
import java.util.List;
import java.util.ArrayList;

/*
 * To ensure you get graded correctly by autograder, 
 * DO NOT change the file name (Report.java), method name (generateReport), or add parameters to this method.
 * Fill in your code where there is a TODO comment.
 * Use the provided variables in the reportBuilder code. 
 * Check if your generateReport() output is equal to hw2_output.txt (String.equals())
 * 
 * Questions or comments? Ask on CourseAssist Course Chat
 * 
 */
public class Report {

	private static List<Student> students = new ArrayList<>();



	public Report(){
		students = new ArrayList<>();
	}


	// generateReport() should be a public static method that takes no parameters and returns a String
	public static String generateReport() {
		//System.out.println("Current working directory: " + System.getProperty("user.dir"));
		students.clear();

		

		StringBuilder reportBuilder = new StringBuilder();
		// TODO:
		// Read hw2.txt line by line
		// Hardcode "hw2.txt" as your input, which means that you should put hw2.txt 
		// right under your Eclipse workspace folder (the top level of the workspace hierarchy).
		StringBuilder report = new StringBuilder();
		try (BufferedReader fileread = new BufferedReader(new FileReader("hw2.txt"))){
			String newline;
			while((newline = fileread.readLine()) != null){
				String[] line = newline.split(";");
				if (line.length < 6) continue;

				String id = line[0];
				String fn = line[1];
				String ln = line[2];
				int age = Integer.parseInt(line[3]);
				int ch = Integer.parseInt(line[4]);
				boolean degree= "Y".equals(line[5]);

				if (degree){
					String major = line[6];
					String type = line[7];
					boolean hA = "Y".equals(line[8]);
					double amount;
					if (hA) {
						amount = Double.parseDouble(line[9]);
					}
					else{
						amount = 0;
					}
					students.add(new DegreeStudent(id, fn, ln, age, ch, major, type, hA, amount));
				}
				else{
					String type = line[6];
					String cT = null;
					if (type.equals("C")){
						cT = line[7];
					}
					students.add(new NonDegreeStudent(id, fn, ln, age, ch, type, cT));

					
				}
			} 
		}
		catch(IOException e){
				e.printStackTrace();
			}
		// For each record, create an instance from the corresponding class (FinAssist,
		// NoFinAssist, Degree, etc.)

		// Save all instances to a Student[] array. Student is the interface or parent class for all the
		// classes you make.
		Student[] array = students.toArray(new Student[0]); // save all the student record objects here

		// DO NOT ADD, CHANGE, OR DELETE ANY reportBuilder code. Use the provided variables.
		// INDIVIDUAL REPORTS, listing of all students and the fees they have each been
		// assessed
		int student_fee; // TODO: Change this! Assign its value in the iteration below and use the
								// provided print statement
		String student_name; // TODO: Change this! Assign its value in the iteration below and use the
									// provided print statement

		// Print out first and last name and fee amount
		reportBuilder.append("Summary of each student's fees assessed: \n\n");
		// TODO: iterate over all Student records and compute the individual student_fee. Assign student_name.
		for(Student student : students){
			student_fee = (int) student.fees();
			student_name = student.fn + " " + student.ln;
					reportBuilder.append(student_name + " has $" + String.format("%,d", student_fee) + " fees assessed \n");
		}
		// TODO: put the following line in your for/while loop so that every student's fee gets printed
		
		
		// This should work once your Student classes are implemented
		// Don't worry about the string formatting in printData()  :)
		// Make sure you do not comment out the following two lines when you submit the hw
		students.get(0).printData();
		students.get(1).printData();
		
		
		// SUMMARY REPORT of fees assessed for each of the four types of student
		int degree_nofin_fees = 0;
		int degree_fin_fees = 0;
		int certificate_fees = 0;
		int senior_fees = 0;
		int total_fees = 0;

		// TODO: Calculate the fees by iterating through all students, or do it in the loop above
		for (Student student : students) {
            int fee = (int) student.fees();
            total_fees += fee;

            if (student instanceof DegreeStudent) {
                DegreeStudent degreeStudent = (DegreeStudent) student;
                if (degreeStudent.hasFinancialAssistance()) {
                    degree_fin_fees += fee;
                } else {
                    degree_nofin_fees += fee;
                }
            } else if (student instanceof NonDegreeStudent) {
                NonDegreeStudent nonDegreeStudent = (NonDegreeStudent) student;
                if ("S".equalsIgnoreCase(nonDegreeStudent.getStudentType())) {
                    senior_fees += fee;
                } else {
                    certificate_fees += fee;
                }
            }
        }
		
		// Print out the total fees for different students
		reportBuilder.append("\n\n");
		reportBuilder.append("Summary of all student fees assessed: \n\n");
		reportBuilder.append(
				"Degree-seeking students without financial assistance: $" + String.format("%,d", degree_nofin_fees) + "\n");
		reportBuilder
				.append("Degree-seeking students with financial assistance: $" + String.format("%,d", degree_fin_fees) + "\n");
		reportBuilder.append("Certificate students: $" + String.format("%,d", certificate_fees) + "\n");
		reportBuilder.append("Senior citizens: $" + String.format("%,d", senior_fees) + "\n\n");
		reportBuilder.append("Total fees assessed: $" + String.format("%,d", total_fees));

		return reportBuilder.toString();
	}

	public static void main(String[] args) {
		// You may test your Report here by comparing the output with the provided hw2_output.txt
		System.out.println(generateReport());
	}
}
