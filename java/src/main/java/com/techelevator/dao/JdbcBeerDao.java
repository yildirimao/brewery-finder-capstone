package com.techelevator.dao;

import com.techelevator.model.Beer;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBeerDao implements BeerDao{

    //TODO: update these to reflect new changes in DB once DB is updated. (i.e img url, description etc.)

    private JdbcTemplate jdbcTemplate;

    public JdbcBeerDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Beer> listAll() {
        List<Beer> beers = new ArrayList<>();
        String sql = "SELECT beer_id, beer_name, abv, beer_type, ibu, hops, description, beer_img, malts, available, brewery_id " +
                     "FROM beers;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while(results.next()) {
            Beer beer = mapRowToBeer(results);
            beers.add(beer);
        }
        return beers;
    }

    @Override
    public List<Beer> getListByBrewery(int breweryId) {
        List<Beer> beers = new ArrayList<>();
        String sql = "SELECT beer_id, beer_name, abv, beer_type, ibu, hops, description, beer_img, malts, available, brewery_id " +
                "FROM beers " +
                "WHERE brewery_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, breweryId);
        while(results.next()) {
            Beer beer = mapRowToBeer(results);
            beers.add(beer);
        }
        return beers;
    }

    /**
     * Find a beer by ID
     * @param beerId, the beer id to find.
     * @return returns null if not found.
     */
    @Override
    public Beer getBeerById(int beerId) {
        Beer beer = null;
        String sql = "SELECT beer_id, beer_name, abv, beer_type, ibu, hops, description, beer_img, malts, available, brewery_id " +
                "FROM beers " +
                "WHERE beer_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, beerId);
        if(results.next()) {
            beer = mapRowToBeer(results);
        }
        return beer;
    }

    /**
     * Find a beer by name
     * @param name, the name of the beer to search with.
     * @return returns null if not found.
     */
    @Override
    public Beer getBeerByName(String name) {
        Beer beer = null;
        String sql = "SELECT beer_id, beer_name, abv, beer_type, ibu, hops, description, beer_img, malts, available, brewery_id " +
                "FROM beers" +
                "WHERE LOWER(beer_name) LIKE LOWER('%?%');";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, name);
        if(results.next()) {
            beer = mapRowToBeer(results);
        }
        return beer;
    }

    @Override
    public Beer create(Beer beerToCreate) {
        String sql = "INSERT INTO Beers (beer_name, abv, beer_type, ibu, hops, description, beer_img, malts, available, brewery_id) " +
                     "VALUES (?,?,?,?,?,?,?,?,?,?) " +
                     "RETURNING beer_id, beer_name, abv, beer_type, ibu, hops, description, beer_img, malts, available, brewery_id;";
        Beer newBeer = jdbcTemplate.queryForObject(sql, Beer.class,
                beerToCreate.getName(),
                beerToCreate.getAbv(),
                beerToCreate.getType(),
                beerToCreate.getIbu(),
                beerToCreate.getHops(),
                beerToCreate.getDescription(),
                beerToCreate.getBeer_img(),
                beerToCreate.getMalts(),
                beerToCreate.isAvailable(),
                beerToCreate.getBreweryID());
        return newBeer;
    }

    @Override
    public void toggleBeerAvailability(int beerId){
        String sql = "UPDATE beers SET available = NOT available " +
                     "WHERE beer_id = ? ";
        jdbcTemplate.update(sql, beerId);
    }

    @Override
    public void deleteBeer(int beerId) {
        String sql = "DELETE FROM beers " +
                     "WHERE beer_id = ?";
        jdbcTemplate.update(sql, beerId);
        return;
    }

    private Beer mapRowToBeer(SqlRowSet rs){
        Beer beer = new Beer();
        beer.setId(rs.getInt("beer_id"));
        beer.setName(rs.getString("beer_name"));
        beer.setAbv(rs.getFloat("abv"));
        beer.setType(rs.getString("beer_type"));
        beer.setIbu(rs.getInt("ibu"));
        beer.setHops(rs.getString("hops"));
        beer.setDescription(rs.getString("description"));
        beer.setBeer_img(rs.getString("beer_img"));
        beer.setMalts(rs.getString("malts"));
        beer.setAvailable(rs.getBoolean("available"));
        beer.setBreweryID(rs.getInt("brewery_id"));
        return beer;
    }
}
