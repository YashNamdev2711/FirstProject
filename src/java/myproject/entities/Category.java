package myproject.entities;

public class Category {

    private int Cid;
    private String Cname;
    private String Cdiscription;

    public Category(int Cid, String Cname, String Cdiscription) {
        this.Cid = Cid;
        this.Cname = Cname;
        this.Cdiscription = Cdiscription;
    }

    public Category() {
    }

    public Category(String Cname, String Cdiscription) {
        this.Cname = Cname;
        this.Cdiscription = Cdiscription;
    }

    public int getCid() {
        return Cid;
    }

    public void setCid(int Cid) {
        this.Cid = Cid;
    }

    public String getCname() {
        return Cname;
    }

    public void setCname(String Cname) {
        this.Cname = Cname;
    }

    public String getCdiscription() {
        return Cdiscription;
    }

    public void setCdiscription(String Cdiscription) {
        this.Cdiscription = Cdiscription;
    }

}
