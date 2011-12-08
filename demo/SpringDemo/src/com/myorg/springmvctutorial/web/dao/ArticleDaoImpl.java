package com.myorg.springmvctutorial.web.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myorg.springmvctutorial.web.model.Article;

@Repository("articleDao")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ArticleDaoImpl implements ArticleDao {

	@Autowired
	private SessionFactory sessionFactory;

    // To Save the article detail
	@Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
	public void saveArticle(Article article) {
		article.setAddedDate(new Date());
		sessionFactory.getCurrentSession().saveOrUpdate(article);
	}
	
	// To get list of all articles
	@SuppressWarnings("unchecked")
	public List<Article> listArticles() {		
		return (List<Article>) sessionFactory.getCurrentSession().createCriteria(Article.class).list();
	}
}