package com.example.dao;

import com.example.util.JDBCUtil;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.List;

public abstract class BaseDao {
    public int executeUpdate(String sql, Object... params) throws SQLException {
        QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
        return runner.update(sql, params);
    }

    public BigInteger executeInsert(String sql, Object... params) throws SQLException {
        QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
        ResultSetHandler<BigInteger> handler = new ScalarHandler<>();
        return runner.insert(sql, handler, params);
    }

    public <T> T executeQueryOne(Class<T> clazz, String sql, Object... params) throws SQLException {
        RowProcessor rowProcessor = new BasicRowProcessor(new GenerousBeanProcessor());
        BeanHandler<T> beanHandler = new BeanHandler<>(clazz, rowProcessor);
        QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
        return runner.query(sql, beanHandler, params);
    }

    public <T> List<T> executeQueryList(Class<T> clazz, String sql, Object... params) throws SQLException {
        RowProcessor rowProcessor = new BasicRowProcessor(new GenerousBeanProcessor());
        BeanListHandler<T> beanListHandler = new BeanListHandler<>(clazz, rowProcessor);
        QueryRunner runner = new QueryRunner(JDBCUtil.getDataSource());
        return runner.query(sql, beanListHandler, params);
    }
}
