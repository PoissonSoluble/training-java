package com.excilys.cdb.persistence;

import static org.junit.Assert.assertNotNull;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class DatabaseConnectionTest {

    private Connection conn;

    public DatabaseConnectionTest() {
        super();
    }

    @Before
    public void setUp() {
        conn = DatabaseConnection.INSTANCE.getConnection();
    }

    @Test
    public void testConnection() {
        assertNotNull(conn);
    }

    @After
    public void unSetUp() {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
        }
        ;
    }

}
