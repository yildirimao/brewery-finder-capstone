package com.techelevator.dao;

import com.techelevator.model.Brewer;
import com.techelevator.model.Brewery;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
@Component
public class JdbcBrewerDao implements BrewerDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcBrewerDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Brewer> listAll() {
        List<Brewer> brewers = new ArrayList<>();
        String sql = "SELECT brewer_id, brewery_id FROM brewers;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while(results.next()) {
            Brewer brewer = mapRowToBrewer(results);
            brewers.add(brewer);
        }
        return brewers;
    }

    @Override
    public Brewer getBrewerByBrewerId(int brewerId) {
        String sql = "SELECT brewer_id, brewery_id FROM brewers WHERE brewer_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, brewerId);
        if(results.next()) {
            return mapRowToBrewer(results);
        } else {
            throw new RuntimeException("brewerId " + brewerId + " was not found");
        }
    }

    @Override
    public List<Brewer> listBrewersByBreweryId(int breweryId) {
        List<Brewer> brewers = new ArrayList<>();
        String sql = "SELECT brewer_id, brewery_id FROM brewers WHERE brewery_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, breweryId);
        while(results.next()) {
            Brewer brewer = mapRowToBrewer(results);
            brewers.add(brewer);
        }
        return brewers;
    }

    @Override
    public Brewer createBrewer(int brewerId, int breweryId) {
        String sql = "INSERT INTO brewers (brewer_id, brewery_id) VALUES (?,?) RETURNING brewer_id;";
        int id = jdbcTemplate.queryForObject(sql, int.class, brewerId, breweryId);
        return getBrewerByBrewerId(id);
    }

    @Override
    public void updateRole(int id){
        String sql = "UPDATE users " +
                "SET role = 'ROLE_BREWER' " +
                "WHERE user_id = ?;";
        jdbcTemplate.update(sql, id);
    }

    private Brewer mapRowToBrewer(SqlRowSet rs) {
        Brewer brewer = new Brewer();
        brewer.setBrewerId(rs.getInt("brewer_id"));
        brewer.setBreweryId(rs.getInt("brewery_id"));
        return brewer;
    }

}
