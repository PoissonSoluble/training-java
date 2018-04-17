package com.excilys.cdb.ui.actionhandlers;

import java.util.List;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.excilys.cdb.model.Company;
import com.excilys.cdb.pagination.CompanyPage;
import com.excilys.cdb.pagination.Page;
import com.excilys.cdb.service.ICompanyService;
import com.excilys.cdb.ui.CommandLineInterface;

@Component("companyLister")
public class CompanyLister implements CLIActionHandler {

    private ICompanyService companyService;
    private final int PAGE_SIZE = 20;
    private Page<Company> page;

    public CompanyLister(ICompanyService pCompanyService) {
        companyService = pCompanyService;
    }

    @Override
    public boolean handle() {
        page = new CompanyPage(1, PAGE_SIZE, "", companyService);
        printPages();
        return true;
    }

    private String getPage(List<Company> companies) {
        StringBuilder sb = new StringBuilder("======== COMPANIES ========\n");
        sb.append("======== ID - NAME ========\n");
        companies.forEach(company -> {
            sb.append(company).append("\n");
        });
        sb.append("Page ").append(page.getPageNumber()).append("/").append(page.getPageTotal()).append("\n");
        return sb.toString();
    }

    private boolean handleChoice() {
        String input = CommandLineInterface.getUserInput().toLowerCase();
        return Stream.of(PageChoice.values()).filter(v -> v.accept(input)).findFirst().orElse(PageChoice.CURRENT_PAGE)
                .handle(page);
    }

    private void printPageMenu() {
        StringBuilder menu = new StringBuilder();
        Stream.of(PageChoice.values()).forEach(value -> menu.append(value.getTitle()).append(", "));
        menu.append("please pick one.");
        System.out.println(menu);
    }

    private void printPages() {
        while (true) {
            System.out.println(getPage(page.get()));
            printPageMenu();
            if (!handleChoice()) {
                return;
            }
        }
    }
}
