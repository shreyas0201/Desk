                                                                                                                                                                            
package desk.classes;

public class Student_Data {
    private final String date;
    private final int stat;
    private final String category;
    private final float amount;
    
    public Student_Data(String date, int stat, String category, float amount){
         this.date  = date;
         this.stat = stat;
         this.category = category;
         this.amount = amount;
    }

    public String getDate() {
        return date;
    }

    public int getStat() {
        return stat;
    }

    public String getCategory() {
        return category;
    }

    public float getAmount() {
        return amount;
    }
    
    
    
    
    
}
