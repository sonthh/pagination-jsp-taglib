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
		Writer out = getWriter();
		List<Integer> paginations = PaginationHelper.makePagination(numberOfPages, numberOfPagesDisplay, currentPage);

		try {
			out.write("<ul class='pagination'>");
			if (uri.contains("?")) {
				if (currentPage == 1) {
					out.write("<li class='page-item disabled'><a class='page-link' href='javascript:void(0)' aria-label='Previous'><span class='mdi mdi-chevron-left' aria-hidden='true'></span></a></li>");
				} else {
					out.write("<li class='page-item'><a class='page-link' href='" + uri + "&page=" + (currentPage - 1) + "' aria-label='Previous'><span class='mdi mdi-chevron-left' aria-hidden='true'></span></a></li>");;
				}
				
				for (Integer itemPage : paginations) {
					if (itemPage == currentPage) {
						out.write("<li class='page-item active'><a class='page-link' href='" + uri + "&page=" + itemPage + "'>" + itemPage + "</a></li>");
					} else if (itemPage == -1) {
						out.write("<li class='page-item disabled'><a class='page-link' href='javascript:void(0)'>...</a></li>");
					} else if (itemPage == -2) {
						out.write("<li class='page-item disabled'><a class='page-link'  href='javascript:void(0)'>...</a></li>");
					} else {
						out.write("<li class='page-item'><a class='page-link' href='" + uri + "&page=" + itemPage + "'>" + itemPage + "</a></li>");
					}
				}
	             
				if (currentPage == numberOfPages) {
					out.write("<li class='page-item disabled'><a class='page-link' href='javascript:void(0)' aria-label='Next'><span class='mdi mdi-chevron-right' aria-hidden='true'></span></a></li>");
				} else {
					out.write("<li class='page-item'><a class='page-link' href='" + uri + "&page=" + (currentPage + 1) + "' aria-label='Next'><span class='mdi mdi-chevron-right' aria-hidden='true'></span></a></li>");
				}
			} else {
				if (currentPage == 1) {
					out.write("<li class='page-item disabled'><a class='page-link' href='javascript:void(0)' aria-label='Previous'><span class='mdi mdi-chevron-left' aria-hidden='true'></span></a></li>");
				} else {
					out.write("<li class='page-item'><a class='page-link' href='" + uri + "?page=" + (currentPage - 1) + "' aria-label='Previous'><span class='mdi mdi-chevron-left' aria-hidden='true'></span></a></li>");;
				}
				
				for (Integer itemPage : paginations) {
					if (itemPage == currentPage) {
						out.write("<li class='page-item active'><a class='page-link' href='" + uri + "?page=" + itemPage + "'>" + itemPage + "</a></li>");
					} else if (itemPage == -1) {
						out.write("<li class='page-item disabled'><a class='page-link' href='javascript:void(0)'>...</a></li>");
					} else if (itemPage == -2) {
						out.write("<li class='page-item disabled'><a class='page-link'  href='javascript:void(0)'>...</a></li>");
					} else {
						out.write("<li class='page-item'><a class='page-link' href='" + uri + "?page=" + itemPage + "'>" + itemPage + "</a></li>");
					}
				}
	             
				if (currentPage == numberOfPages) {
					out.write("<li class='page-item disabled'><a class='page-link' href='javascript:void(0)' aria-label='Next'><span class='mdi mdi-chevron-right' aria-hidden='true'></span></a></li>");
				} else {
					out.write("<li class='page-item'><a class='page-link' href='" + uri + "?page=" + (currentPage + 1) + "' aria-label='Next'><span class='mdi mdi-chevron-right' aria-hidden='true'></span></a></li>");
				}
			}
			out.write("</ul>");
		} catch (java.io.IOException ex) {
			throw new JspException("Error in Paginator tag", ex);
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
