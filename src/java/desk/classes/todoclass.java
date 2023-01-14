package desk.classes;

public class todoclass {
    String title,text;
    int status;
    public todoclass(String title, String text, int status){
        this.title = title;
        this.text = text;
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public String getText() {
        return text;
    }

    public int getStatus() {
        return status;
    }
    
}
