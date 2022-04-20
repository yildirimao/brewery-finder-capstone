package com.techelevator.controller;

import com.techelevator.dao.BrewerDao;
import com.techelevator.dao.BreweryDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Authority;
import com.techelevator.model.Brewer;
import com.techelevator.model.Brewery;
import com.techelevator.model.User;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
public class BreweryController {

    private BreweryDao breweryDao;
    private UserDao userDao;
    private BrewerDao brewerDao;
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
        return breweryDao.create(brewery.getName(), brewery.getLocation(), brewery.getPhoneNumber(),
                brewery.getHoursOfOperation(), brewery.getAddress(), brewery.getBio(), brewery.getImgUrl(), brewery.isActive());}

    @RequestMapping(path = "/breweries/{brewery_id}", method = RequestMethod.PUT)
    public void updateBrewery(@Valid @RequestBody Brewery brewery, @PathVariable int brewery_id, Principal principal){
        User user = userDao.findByUsername(principal.getName());
        List<Brewer> brewers = brewerDao.listBrewersByBreweryId(brewery_id);
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
            breweryDao.update(brewery.getPhoneNumber(), brewery.getHoursOfOperation(), brewery.getAddress(), brewery.getBio(), brewery.getImgUrl(), brewery.isActive(), brewery_id);
        } else if (isBrewer) {
            breweryDao.update(brewery.getPhoneNumber(), brewery.getHoursOfOperation(), brewery.getAddress(), brewery.getBio(), brewery.getImgUrl(), brewery.isActive(), brewery_id);
        } else {
            System.out.println("User does not have required authorities to update brewery."); //beerDao.create(beer);
        }
        breweryDao.update(brewery.getPhoneNumber(), brewery.getHoursOfOperation(), brewery.getAddress(), brewery.getBio(), brewery.getImgUrl(), brewery.isActive(), brewery_id);
    }
}
