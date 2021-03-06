package com.excilys.cdb.dto;

public class ComputerDTO {
    private Long id;
    private String name;
    private String introduced;
    private String discontinued;
    private CompanyDTO company;

    public CompanyDTO getCompany() {
        return company;
    }

    public String getDiscontinued() {
        return discontinued;
    }

    public Long getId() {
        return id;
    }

    public String getIntroduced() {
        return introduced;
    }

    public String getName() {
        return name;
    }

    public void setCompany(CompanyDTO pCompany) {
        company = pCompany;
    }

    public void setDiscontinued(String pDiscontinued) {
        discontinued = pDiscontinued;
    }

    public void setId(long pId) {
        id = pId;
    }

    public void setIntroduced(String pIntroduced) {
        introduced = pIntroduced;
    }

    public void setName(String pName) {
        name = pName;
    }

}
