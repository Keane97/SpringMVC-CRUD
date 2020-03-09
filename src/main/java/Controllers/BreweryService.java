/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Service;

/**
 *
 * @author Keane
 */
@Service
public class BreweryService {

    public List<Breweries> getAllBreweries() {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        TypedQuery<Breweries> tq = em.createNamedQuery("Breweries.findAll", Breweries.class);

        List<Breweries> BreweryList = new ArrayList<>();
        try {
            BreweryList = tq.getResultList();
        } catch (Exception e) {
            System.out.println(e);
        }
        return BreweryList;
    }

    public void addABrewery(Breweries Brew) { //Insert new Brewery into DB
        EntityManager em = DBUtil.getEmf().createEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try {
            transaction.begin();
            em.persist(Brew);
            transaction.commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }
    }

    public Breweries getBreweryById(int id) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        TypedQuery<Breweries> tq = em.createNamedQuery("Breweries.findById", Breweries.class).setParameter("id", id);

        Breweries Brew = null;
        try {
            Brew = tq.getSingleResult();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }
        return Brew;
    }

    public void editBrewery(Breweries Brew) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try {
            transaction.begin();
            em.merge(Brew);
            transaction.commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }
    }

    public void deleteABrewery(int id) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try {
            Breweries Brew = getBreweryById(id);
            transaction.begin();
            em.remove(em.merge(Brew));
            transaction.commit();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            em.close();
        }
    }
}
