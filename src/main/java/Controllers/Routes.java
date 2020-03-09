/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Controllers.BreweryService;
import java.util.Date;
import javax.validation.Valid;
import javax.ws.rs.QueryParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Keane
 */
@RestController
@RequestMapping("/Brewery")
@SessionAttributes("Breweries")
public class Routes {

    @Autowired
    BreweryService breweryService;

    @RequestMapping("/AllBreweries")
    public ModelAndView displayAllBreweries() {
        return new ModelAndView("/AllBreweries", "BreweryList", breweryService.getAllBreweries());
    }

    @GetMapping("/add")
    public ModelAndView displayBreweryAddForm() {
        return new ModelAndView("/AddBrewery", "Breweries", new Breweries());
    }

    /* HANDLES INSERT  */
    @PostMapping("/AddBrewery")
    public ModelAndView addABrewery(@Valid @ModelAttribute("Breweries") Breweries Brew, BindingResult result, ModelMap model) {
        Date date = new Date();
        Brew.setLastMod(date);
        if (result.hasErrors()) {
            return new ModelAndView("/error");
        }
        breweryService.addABrewery(Brew);
        return new ModelAndView("redirect:/Brewery/AllBreweries");
    }

    @GetMapping("edit/{id}")
    public ModelAndView getABrewery(@PathVariable("id") int id, ModelAndView model) {
        model.addObject("Breweries", breweryService.getBreweryById(id));
        model.setViewName("/UpdateBrewery");
        return model;
    }

    @PostMapping("/editBrewery")
    public ModelAndView editBrewery(@Valid @ModelAttribute("Breweries") Breweries Brew, BindingResult result, SessionStatus status) {
        Date date = new Date();
        Brew.setLastMod(date);
        if (result.hasErrors()) {
            return new ModelAndView("/error");
        }
        breweryService.editBrewery(Brew);
        status.setComplete();
        return new ModelAndView("redirect:/Brewery/AllBreweries");
    }

    @GetMapping("/delete/{id}")
    public ModelAndView deleteABrewery(@PathVariable("id") int id) {
        breweryService.deleteABrewery(id);
        return new ModelAndView("redirect:/Brewery/AllBreweries");
    }
   
}
