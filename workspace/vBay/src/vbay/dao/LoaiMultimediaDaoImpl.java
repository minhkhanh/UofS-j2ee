package vbay.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import vbay.model.LoaiMultimedia;

@Repository("loaiMultimediaDao")
@Transactional(propagation = Propagation.REQUIRES_NEW)
public class LoaiMultimediaDaoImpl implements LoaiMultimediaDao {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    @Transactional(readOnly = true)
    public LoaiMultimedia layLoaiMultimedia(int maMultimedia) {
        return (LoaiMultimedia) sessionFactory.getCurrentSession().load(LoaiMultimedia.class,
                maMultimedia);
    }
}
