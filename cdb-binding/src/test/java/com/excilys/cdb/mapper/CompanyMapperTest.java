package com.excilys.cdb.mapper;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.AnnotationConfigContextLoader;

import com.excilys.cdb.config.BindingConfig;
import com.excilys.cdb.model.Company;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes=BindingConfig.class, loader=AnnotationConfigContextLoader.class)
@ActiveProfiles("cli")
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
