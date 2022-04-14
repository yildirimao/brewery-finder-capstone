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

    //TODO:Finish "brewer path" for this method //needs a way to look up brewer id for a user.
    @PreAuthorize("hasRole('ADMIN', BREWER)")
    @ResponseStatus(code = HttpStatus.CREATED)
    @RequestMapping(path = "/beers", method = RequestMethod.POST)
    public Beer createBeer(@RequestBody Beer beer, Principal principal){
        //get current user
        User user = userDao.findByUsername(principal.getName());

        //check if admin or brewer.
        if(user.getAuthorities().contains("ROLE_ADMIN")){
            //admin path
            return beerDao.create(beer);
        }else{
            //brewer path
            //Make sure the user works at the brewery they are adding the beer to
            //add the beer to database via beerDAO, AFTER verifying they work at that brewery.
            //this is just placeholder response data, it doesn't actually add the beer to the brewery yet.
            beer.setBreweryID(-1);
            String placeholdertext = "This currently doesn't do anything. see comments in code for more info.";
            beer.setDescription(placeholdertext);
            return beer; //beerDao.create(beer);
        }
    }
}
