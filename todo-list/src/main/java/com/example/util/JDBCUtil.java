package com.example.util;


import org.apache.commons.dbcp2.BasicDataSource;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCUtil {
    private static final BasicDataSource source = new BasicDataSource();

    static {
        InputStream is = JDBCUtil.class.getClassLoader().getResourceAsStream("jdbc.properties");
        Properties pros = new Properties();
        try {
            pros.load(is);
            source.setDriverClassName(pros.getProperty("driver"));
            source.setUrl(pros.getProperty("url"));
            source.setUsername(pros.getProperty("user"));
            source.setPassword(pros.getProperty("password"));
            source.setInitialSize(10);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static DataSource getDataSource() {
        return source;
    }

    public static Connection getConnection() throws SQLException {
        return source.getConnection();
    }
}
