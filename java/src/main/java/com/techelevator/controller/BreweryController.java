package com.techelevator.controller;

import com.techelevator.dao.BreweryDao;
import com.techelevator.model.Brewery;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
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

    @ResponseStatus(code = HttpStatus.CREATED)
    @RequestMapping(path = "/breweries", method = RequestMethod.POST)
    public Brewery createBrewery(@RequestBody Brewery brewery){
        return breweryDao.create(brewery.getName(), brewery.getLocation());}
}
