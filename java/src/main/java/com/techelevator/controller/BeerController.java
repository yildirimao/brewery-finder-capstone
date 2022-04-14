package com.techelevator.controller;

import com.techelevator.dao.BeerDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Beer;
import com.techelevator.model.User;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@CrossOrigin
@RestController
public class BeerController {

    private BeerDao beerDao;
    private UserDao userDao;

    public BeerController(BeerDao beerDao, UserDao userDao){
        this.beerDao = beerDao;
        this.userDao = userDao;
    }

    @RequestMapping(path = "/beers", method = RequestMethod.GET)
    public List<Beer> listAllBeers(){
        return beerDao.listAll();
    }

    @RequestMapping(path = "/breweries/{brewery_id}/beers", method = RequestMethod.GET)
    public List<Beer> getBeerByBreweryId(@PathVariable int brewery_id){
        return beerDao.getListByBrewery(brewery_id);
    }

    @RequestMapping(path = "/beers/{beer_id}", method = RequestMethod.GET)
    public Beer getBeerById(@PathVariable int beer_id){
        return beerDao.getBeerById(beer_id);
    }

    @PreAuthorize("hasRole('ADMIN')")
    @ResponseStatus(code = HttpStatus.CREATED)
    @RequestMapping(path = "/beers", method = RequestMethod.POST)
    public Beer createBeer(@RequestBody Beer beer){
        return beerDao.create(beer);
    }

    //TODO: this isn't done yet. we need to only add the beer to a brewery the brewer works at.
    @PreAuthorize("hasRole('BREWER')")
    @ResponseStatus(code = HttpStatus.CREATED)
    @RequestMapping(path = "/beers", method = RequestMethod.POST)
    public Beer createBeerAsBrewer(@RequestBody Beer beer, Principal principal){
        //Get user id of current user
        User user = userDao.findByUsername(principal.getName());
        //Make sure the user works at the brewery they are adding the beer to
        //add the beer to database via beerDAO, AFTER verifying they work at that brewery.


        //this is just placeholder response data, it doesn't actually add the beer to the brewery yet.
        beer.setBreweryID(-1);
        String placeholdertext = "This currently doesn't do anything. see comments in code for more info.";
        beer.setDescription(placeholdertext);
        return beer; //beerDao.create(beer);
    }

}
