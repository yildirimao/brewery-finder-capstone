package com.techelevator.controller;

import com.techelevator.dao.BreweryDao;
import com.techelevator.model.Brewery;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class BreweryController {

    private BreweryDao breweryDao;

    public BreweryController(BreweryDao breweryDao) {
        this.breweryDao = breweryDao;
    }

    @RequestMapping(path = "/breweries", method = RequestMethod.GET)
    public List<Brewery> listAll() {
        return breweryDao.listAll();
    }

    @RequestMapping(path = "/breweries/{brewery_id}", method = RequestMethod.GET)
    public Brewery getBreweryById(@PathVariable int brewery_id){ return breweryDao.getBreweryById(brewery_id);}

//    @RequestMapping(path ="/breweries/{brewery_name}", method = RequestMethod.GET)
//    public Brewery findBreweryByName(@PathVariable String brewery_name){ return breweryDao.findByName(brewery_name);}

//    @RequestMapping(path = "/breweries", method = RequestMethod.POST)
//    public Brewery createBrewery(){
//        Brewery brewery = new Brewery();
//            breweryDao.create(brewery.getName(), brewery.getLocation());
}
