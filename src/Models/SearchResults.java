package Models;

public class SearchResults 
{
	private String link;
	private String paragraph;
	private String title;
	private String type;
	

	public SearchResults()
	{
	}
	
	
	public SearchResults(String title, String paragraph, String link, String type) {
		super();
		this.link = link;
		this.paragraph = paragraph;
		this.title = title;
		this.type = type;
	}
	
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getParagraph() {
		return paragraph;
	}
	public void setParagraph(String paragraph) {
		this.paragraph = paragraph;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
}
