
package desk.classes;

public class QuizClass {
    
    String question,a,b,c,d;
    int no,correctanswer,subject;

    public QuizClass(int no, String question, String a, String b, String c, String d, int correctanswer, int subject) {
        this.question = question;
        this.a = a;
        this.b = b;
        this.c = c;
        this.d = d;
        this.no = no;
        this.correctanswer = correctanswer;
        this.subject = subject;
    }

    public int getSubject() {
        return subject;
    }

    public String getQuestion() {
        return question;
    }

    public String getA() {
        return a;
    }

    public String getB() {
        return b;
    }

    public String getC() {
        return c;
    }

    public String getD() {
        return d;
    }

    public int getNo() {
        return no;
    }

    public int getCorrectanswer() {
        return correctanswer;
    }
}
