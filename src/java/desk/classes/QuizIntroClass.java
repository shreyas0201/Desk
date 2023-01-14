
package desk.classes;

public class QuizIntroClass {

    public QuizIntroClass(String name, String imagename, String[] syllabus) {
        this.name = name;
        this.imagename = imagename;
        this.syllabus = syllabus;
    }
    
    String name, imagename;
    String syllabus[];

    public String getName() {
        return name;
    }

    public String getImagename() {
        return imagename;
    }

    public String[] getSyllabus() {
        return syllabus;
    }
    
}
