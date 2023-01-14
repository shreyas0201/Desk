
package desk.classes;

public class RecentArticlesClass {
    
    String name,title,text,date;
    int status;

    public RecentArticlesClass(String name, String date, String title, String text) {
        this.name = name;
        this.title = title;
        this.text = text;
        this.date = date;
    }
    

    public String getName() {
        return name;
    }

    public String getTitle() {
        return title;
    }

    public String getText() {
        System.out.println("\n returned text = "+text);
        return text;
    }

    public String getDate() {
        return date;
    }
    
}
