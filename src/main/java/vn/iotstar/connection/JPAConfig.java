package vn.iotstar.connection;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAConfig {
    private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("ShoppingPU");

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
}