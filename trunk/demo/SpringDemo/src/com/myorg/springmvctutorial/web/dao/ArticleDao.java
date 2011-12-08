package com.myorg.springmvctutorial.web.dao;

import java.util.List;

import com.myorg.springmvctutorial.web.model.Article;


public interface ArticleDao {
	// To Save the article detail
	public void saveArticle ( Article Article );
	
	// To get list of all articles
	public List<Article> listArticles();
}