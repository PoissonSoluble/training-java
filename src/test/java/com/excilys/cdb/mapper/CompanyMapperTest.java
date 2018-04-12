package com.excilys.cdb.mapper;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.excilys.cdb.model.Company;

public class CompanyMapperTest {
    
    @Autowired
    private ICompanyMapper companyMapper;
    
    @Test
    public void testCreation() {
        Company company = companyMapper.createCompany(1L, "Company");
        assertEquals(company.getId().get(), new Long(1L));
        assertEquals(company.getName().get(), "Company");
    }
}
