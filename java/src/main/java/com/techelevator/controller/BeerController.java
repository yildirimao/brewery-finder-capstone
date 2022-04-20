package com.techelevator.controller;

import com.techelevator.dao.BeerDao;
import com.techelevator.dao.BrewerDao;
import com.techelevator.dao.BreweryDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.*;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@CrossOrigin
@RestController
public class BeerController {

    private BeerDao beerDao;
    private UserDao userDao;
    private BrewerDao brewerDao;
    private BreweryDao breweryDao;

    public BeerController(BeerDao beerDao, UserDao userDao, BrewerDao brewerDao, BreweryDao breweryDao){
        this.beerDao = beerDao;
        this.userDao = userDao;
        this.brewerDao = brewerDao;
        this.breweryDao = breweryDao;
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

    @RequestMapping(path = "/beers/{beer_id}/toggle", method = RequestMethod.PUT)
    public void toggleBeerAvailability(@PathVariable int beer_id, Principal principal){

        User user = userDao.findByUsername(principal.getName());
        Beer beer = beerDao.getBeerById(beer_id);
        int breweryId = beer.getBreweryID();
        List<Brewer> brewers = brewerDao.listBrewersByBreweryId(breweryId);
        boolean isBrewer = false;
        for (Brewer brewer : brewers) {
            if (brewer.getBrewerId() == user.getId()) {
                isBrewer = true;
            }
        }

        if(isBrewer){
            beerDao.toggleBeerAvailability(beer_id);
        }
    }

    @ResponseStatus(code = HttpStatus.CREATED)
    @RequestMapping(path = "/beers", method = RequestMethod.POST)
    public Beer createBeer(@Valid @RequestBody Beer beer, Principal principal){
        //get current user
        System.out.println(beer.toString());
        User user = userDao.findByUsername(principal.getName());
        int breweryId = beer.getBreweryID();
        List<Brewer> brewers = brewerDao.listBrewersByBreweryId(breweryId);
        boolean isBrewer = false;
        for (Brewer brewer : brewers) {
            if (brewer.getBrewerId() == user.getId()) {
                isBrewer = true;
            }
        };

        //check if admin or brewer.
        if(user.getAuthorities().contains(new Authority("ROLE_ADMIN"))) {
            //admin path
            System.out.println();
            return beerDao.create(beer);
        } else if (isBrewer) {
            System.out.println(beer);
            return beerDao.create(beer);
        } else {
            System.out.println("User does not have required authorities to add beer."); //beerDao.create(beer);
            return beer;
        }
    }

    @RequestMapping(path = "/beers/search/{terms}", method = RequestMethod.POST)
    public List<Beer> searchBeers(@PathVariable String terms) {
        List<Beer> beers = beerDao.listAll();
        for (int i = 0; i < beers.size(); i++) {
            Beer b = beers.get(i);

            String mush = b.getDescription() +
                    b.getHops() +
                    b.getMalts() +
                    b.getType() +
                    b.getName();

            if(!mush.toLowerCase().contains(terms.toLowerCase())){
                beers.remove(i);
                i--;
                continue;
            }
        }

        return beers;
    }
}
