package com.techelevator.dao;


import com.techelevator.model.Brewery;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
@Component
public class JdbcBreweryDao implements BreweryDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcBreweryDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Brewery> listAll() {
        List<Brewery> breweries = new ArrayList<>();
        String sql = "SELECT brewery_id, brewery_name, brewery_location FROM breweries;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while(results.next()) {
            Brewery brewery = mapRowToBrewery(results);
            breweries.add(brewery);
        }
        return breweries;
    }

    @Override
    public Brewery getBreweryById(int breweryId) {
        String sql = "SELECT brewery_id, brewery_name, brewery_location FROM breweries WHERE brewery_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, breweryId);
        if(results.next()) {
            return mapRowToBrewery(results);
        } else {
            throw new RuntimeException("breweryId " + breweryId + " was not found.");
        }
    }

    @Override
    public Brewery findByName(String name) {
        String sql = "SELECT brewery_id, brewery_name, brewery_location FROM breweries WHERE brewery_name = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, name);
        if (results.next()) {
            return mapRowToBrewery(results);
        } else {
            throw new RuntimeException(name + " was not found.");
        }
    }

    @Override
    public List<Brewery> findByLocation(String location) {
        List<Brewery> breweries = new ArrayList<>();
        String sql = "SELECT brewery_id, brewery_name, brewery_location FROM breweries WHERE brewery_location = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, location);
        while(results.next()) {
            breweries.add(mapRowToBrewery(results));
        }
        return breweries;
    }

    @Override
    public Brewery create(String name, String location) {
        String sql = "INSERT INTO breweries (brewery_name, brewery_location) VALUES (?,?) RETURNING brewery_id;";
        int newId = jdbcTemplate.queryForObject(sql, int.class, name, location);
        return getBreweryById(newId);
    }

    private Brewery mapRowToBrewery(SqlRowSet rs) {
        Brewery brewery = new Brewery();
        brewery.setId(rs.getInt("brewery_id"));
        brewery.setName(rs.getString("brewery_name"));
        brewery.setLocation(rs.getString("brewery_location"));
        return brewery;
    }
}
