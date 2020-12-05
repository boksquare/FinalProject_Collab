package CIS3368.finalproject.models;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Table(name = "covid_table")
public class Covid {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @Column(name = "total_cases")
    private String total_cases;

    @Column(name = "new_cases")
    private String new_cases;

    @Column(name = "deaths")
    private String deaths;

    @Column(name = "recovered")
    private String recovered;

    @Column(name = "username")
    private String username;

    public Covid(){

    }

    public Covid(String id, String name, String total_cases, String new_cases, String deaths, String recovered, String username) {
        this.id = id;
        this.name = name;
        this.total_cases = total_cases;
        this.new_cases = new_cases;
        this.deaths = deaths;
        this.recovered = recovered;
        this.username = username;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTotal_cases() {
        return total_cases;
    }

    public void setTotal_cases(String total_cases) {
        this.total_cases = total_cases;
    }

    public String getNew_cases() {
        return new_cases;
    }

    public void setNew_cases(String new_cases) {
        this.new_cases = new_cases;
    }

    public String getDeaths() {
        return deaths;
    }

    public void setDeaths(String deaths) {
        this.deaths = deaths;
    }

    public String getRecovered() {
        return recovered;
    }

    public void setRecovered(String recovered) {
        this.recovered = recovered;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
