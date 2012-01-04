package vbay.dao;

import java.io.Serializable;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import vbay.model.Multimedia;

@Repository("multimediaDao")
@Transactional(propagation = Propagation.REQUIRES_NEW)
public class MultimediaDaoImpl implements MultimediaDao {
    
    @Autowired
    SessionFactory sessionFactory;

    @Override
    @Transactional(readOnly = false)
    public Serializable themMultimedia(Multimedia multimedia) {
        return sessionFactory.getCurrentSession().save(multimedia);
    }

    @Override
    public Multimedia layMultimedia(int maMultimedia) {
        return (Multimedia) sessionFactory.getCurrentSession().get(Multimedia.class, maMultimedia);
    }

}
