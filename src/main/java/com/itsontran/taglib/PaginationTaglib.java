package com.itsontran.taglib;

import java.io.Writer;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class PaginationTaglib extends SimpleTagSupport {
	private String uri = "";
	private int currentPage = 1;
	private int numberOfPagesDisplay = 7;
	private int numberOfPages;

	private Writer getWriter() {
		JspWriter out = getJspContext().getOut();
		return out;
	}

	@Override
	public void doTag() throws JspException {
		List<Integer> paginations = PaginationHelper.makePagination(numberOfPages, numberOfPagesDisplay, currentPage);
		StringBuilder html = new StringBuilder();
		try {
			html.append("<ul class='d-flex justify-content-end pagination pagination-sm'>");
			if (currentPage == 1) {
				html.append("<li class='page-item disabled'><a class='page-link' href='javascript:void(0)' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
			} else {
				html.append("<li class='page-item'><a class='page-link' href='" + this.getLink(currentPage - 1) + "' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");;
			}
			
			for (Integer itemPage : paginations) {
				if (itemPage == currentPage) {
					html.append("<li class='page-item active'><a class='page-link' href='" + this.getLink(itemPage) + "'>" + itemPage + "</a></li>");
				} else if (itemPage == -1) {
					html.append("<li class='page-item disabled'><a class='page-link' href='javascript:void(0)'>...</a></li>");
				} else if (itemPage == -2) {
					html.append("<li class='page-item disabled'><a class='page-link'  href='javascript:void(0)'>...</a></li>");
				} else {
					html.append("<li class='page-item'><a class='page-link' href='" + this.getLink(itemPage) + "'>" + itemPage + "</a></li>");
				}
			}
             
			if (currentPage == numberOfPages) {
				html.append("<li class='page-item disabled'><a class='page-link' href='javascript:void(0)' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
			} else {
				html.append("<li class='page-item'><a class='page-link' href='" + this.getLink(currentPage + 1) + "' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
			}
			html.append("</ul>");
			
			getWriter().write(html.toString());
		} catch (java.io.IOException ex) {
			throw new JspException("Error in Paginator tag", ex);
		}
	}
	
	private String getLink(int pageTarget) {
		if (uri.contains("?")) {
			return uri + "&page=" + pageTarget;
		} else {
			return uri + "?page=" + pageTarget;
		}
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getNumberOfPagesDisplay() {
		return numberOfPagesDisplay;
	}

	public void setNumberOfPagesDisplay(int numberOfPagesDisplay) {
		this.numberOfPagesDisplay = numberOfPagesDisplay;
	}

	public int getNumberOfPages() {
		return numberOfPages;
	}

	public void setNumberOfPages(int numberOfPages) {
		this.numberOfPages = numberOfPages;
	}
}
