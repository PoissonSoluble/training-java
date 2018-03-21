package com.excilys.cdb.ui.actionhandlers;

import java.util.Arrays;
import java.util.List;

import com.excilys.cdb.pagination.Page;

public enum PageChoice {
    FIRST_PAGE("[f]irst page", "f", "first page") {
        @Override
        public boolean handle(Page<?> page) {
            page.first();
            return true;
        }
    },
    LAST_PAGE("[l]ast page", "l", "last page") {
        @Override
        public boolean handle(Page<?> page) {
            page.last();
            return true;
        }
    },
    PREVIOUS_PAGE("[p]revious page", "p", "previous page") {
        @Override
        public boolean handle(Page<?> page) {
            page.previous();
            return true;
        }
    },
    NEXT_PAGE("[n]ext page", "n", "next page") {
        @Override
        public boolean handle(Page<?> page) {
            page.next();
            return true;
        }
    },
    QUIT("[q]uit", "q", "quit") {
        @Override
        public boolean handle(Page<?> page) {
            return false;
        }
    };

    private String title;
    private List<String> validChoices;

    PageChoice(String pTitle, String... pValidChoices) {
        title = pTitle;
        validChoices = Arrays.asList(pValidChoices);
    }

    public boolean accept(String choice) {
        if (validChoices.contains(choice.toLowerCase())) {
            return true;
        }
        return false;
    }

    public String getTitle() {
        return title;
    }

    public abstract boolean handle(Page<?> page);
}
